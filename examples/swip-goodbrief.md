# Example — `/swip-goodbrief`

## Thin request

```text
/swip-goodbrief bikin landing page buat toko roti gue
```

Agent asks which skill (no skill named):

> Mau pakai skill apa? 1) design-taste-frontend 2) frontend-design 3) hallmark 4) **Tanpa skill** 5) lainnya

User: `1`. Agent reads that skill, then asks only gaps (max 5):

> Nama toko + artinya? Alamat/tempat? Jumlah kursi/harga? Jam & hari tutup? Foto ada di folder mana? Aksi utama halaman?

## Result

```markdown
**Skill:** Use the design-taste-frontend skill to build the landing page.

**Task:** Landing page for Sete Portas, a bakery named after the street it stands in.

**Specifics:**
- 14 seats
- Oven lit at five, bread out at seven, usually gone by noon
- Closed on Sundays
- One sourdough at 6 euros and three pastries; full list in `menu.md`

**Assets:** own photos in `./photos`

**Action:** get people to pre-order for Saturday by email
```

Agent: "Skill: design-taste-frontend, 7 specifics, 0 TODO. Confirm?" → runs only after OK.

## No skill

Same flow, but the **Skill** line is omitted and the agent does the task directly.
