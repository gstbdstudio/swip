#!/usr/bin/env bash
# Smoke checks for the SWIP skill pack: frontmatter + plugin manifests.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

fail=0
pass=0

ok() { echo "OK  $*"; pass=$((pass + 1)); }
bad() { echo "FAIL $*"; fail=$((fail + 1)); }

echo "== SWIP smoke test =="
echo "root: $ROOT"

shopt -s nullglob
skills=(skills/*/SKILL.md)
if [[ ${#skills[@]} -eq 0 ]]; then
  bad "no skills/*/SKILL.md found"
else
  ok "found ${#skills[@]} skill file(s)"
fi

for skill in "${skills[@]}"; do
  dir="$(dirname "$skill")"
  folder="$(basename "$dir")"

  if [[ "$(head -n 1 "$skill")" != "---" ]]; then
    bad "$skill: missing opening --- frontmatter"
    continue
  fi

  fm="$(awk 'BEGIN{c=0} /^---$/{c++; next} c==1{print} c==2{exit}' "$skill")"

  name="$(printf '%s\n' "$fm" | sed -n 's/^name:[[:space:]]*//p' | head -n1 | tr -d '"' | tr -d "'")"

  if ! printf '%s\n' "$fm" | grep -q '^description:'; then
    bad "$skill: missing description"
  else
    ok "$skill: has description"
  fi

  if [[ -z "$name" ]]; then
    bad "$skill: missing name"
  elif [[ "$name" != "$folder" ]]; then
    bad "$skill: name '$name' != folder '$folder'"
  else
    ok "$skill: name=$name"
  fi

  desc="$(printf '%s\n' "$fm" | tr '\n' ' ')"
  if printf '%s' "$desc" | grep -qi "$name"; then
    ok "$skill: description mentions $name"
  else
    bad "$skill: description should mention $name"
  fi
done

json_files=(
  .claude-plugin/plugin.json
  .claude-plugin/marketplace.json
  .cursor-plugin/plugin.json
  package.json
)

for jf in "${json_files[@]}"; do
  if [[ ! -f "$jf" ]]; then
    bad "missing $jf"
    continue
  fi
  if python3 -c "import json,sys; json.load(open(sys.argv[1]))" "$jf"; then
    ok "$jf: valid JSON"
  else
    bad "$jf: invalid JSON"
  fi
done

if version="$(python3 - <<'PY'
import json
from pathlib import Path
root = Path(".")
plugin = json.loads((root / ".claude-plugin/plugin.json").read_text())
for key in ("name", "version", "description", "license"):
    if not plugin.get(key):
        raise SystemExit(f"missing {key}")
if plugin.get("name") != "swip":
    raise SystemExit(f"plugin name {plugin.get('name')!r} != 'swip'")
mp = json.loads((root / ".claude-plugin/marketplace.json").read_text())
if not mp.get("plugins"):
    raise SystemExit("marketplace plugins empty")
cursor = json.loads((root / ".cursor-plugin/plugin.json").read_text())
if cursor.get("skills") != "./skills/":
    raise SystemExit(f"cursor skills={cursor.get('skills')!r}")
pkg = json.loads((root / "package.json").read_text())
versions = {plugin["version"], cursor.get("version"), pkg.get("version")}
versions.discard(None)
if len(versions) != 1:
    raise SystemExit(f"version mismatch: {sorted(versions)}")
print(next(iter(versions)))
PY
)"; then
  ok "manifest fields + version sync ($version)"
else
  bad "manifest fields + version sync"
fi

if [[ -f .claude-plugin/icon.png ]]; then
  ok "plugin icon present"
else
  bad "missing .claude-plugin/icon.png"
fi

# Expected skills in this pack
for expected in swip swip-commit; do
  if [[ -f "skills/$expected/SKILL.md" ]]; then
    ok "pack includes $expected"
  else
    bad "missing skills/$expected/SKILL.md"
  fi
done

if command -v claude >/dev/null 2>&1; then
  if claude plugin validate "$ROOT" >/tmp/swip-plugin-validate.out 2>&1; then
    ok "claude plugin validate"
  else
    bad "claude plugin validate"
    sed -n '1,40p' /tmp/swip-plugin-validate.out || true
  fi
else
  echo "SKIP claude plugin validate (claude CLI not installed)"
fi

echo
echo "passed=$pass failed=$fail"
if [[ "$fail" -ne 0 ]]; then
  exit 1
fi
echo "All smoke checks passed."
