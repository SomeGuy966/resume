# resume

My resume in LaTeX, in two variants that share the same facts but differ in emphasis — plus a
timeline of every past version.

| Variant | Current PDF | Aimed at |
|---|---|---|
| [SWE / Quant Dev](swe/) | [`Anthony_Ge_Resume_SWE.pdf`](swe/Anthony_Ge_Resume_SWE.pdf) | software engineering, quant dev, quant SWE — systems, testing, CI, performance |
| [Quant Trading](quant-trading/) | [`Anthony_Ge_Resume_QuantTrading.pdf`](quant-trading/Anthony_Ge_Resume_QuantTrading.pdf) | quant trading, quant research — statistical rigour, forecasting, backtests |

Both PDFs are rebuilt automatically by GitHub Actions on every push.

## Version history

Each variant folder keeps every superseded PDF in its own `history/`, newest first, with a table
explaining what changed:

- [SWE version history](swe/#version-history)
- [Quant Trading version history](quant-trading/#version-history)

History filenames carry a 10-digit descending sort key so GitHub's ascending file listing shows
the newest version at the top; the readable date follows it. See [AGENTS.md](AGENTS.md#why-the-history-filenames-look-like-that).

## Layout

```
preamble.tex              shared style (fonts, spacing, macros)
sections/                 header, education, experience — shared by both variants
swe/                      root .tex, current PDF, history/, README with the timeline
quant-trading/            same shape
scripts/snapshot.sh       archive the current PDF(s) into history/ before changing them
```

Edit `sections/` to change both resumes at once; edit a variant's root `.tex` to change one.

## Making a change

```bash
scripts/snapshot.sh all "what the version being replaced contained"
# edit sections/ or a variant's .tex, then:
cd swe && tectonic Anthony_Ge_Resume_SWE.tex
cd ../quant-trading && tectonic Anthony_Ge_Resume_QuantTrading.tex
```

Confirm each PDF is still one page, then commit and push. CI rebuilds both and commits the PDFs,
so `git pull` afterwards.

With [Tectonic](https://tectonic-typesetting.github.io/) the build needs no TeX install;
`latexmk -xelatex` works if you have a full TeX Live.

The template is adapted from [Jake Gutierrez's resume](https://github.com/jakegut/resume) and uses
[Carlito](https://ctan.org/pkg/carlito), a metric-compatible clone of Calibri.
