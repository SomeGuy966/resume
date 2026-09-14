# resume

My resume, written in LaTeX, in two variants that share the same facts but differ in emphasis:

| Variant | Source | PDF | Aimed at |
|---|---|---|---|
| SWE / Quant Dev / Quant SWE | [`CV_Anthony_Ge_SWE_QuantDev.tex`](CV_Anthony_Ge_SWE_QuantDev.tex) | [`CV_Anthony_Ge_SWE_QuantDev.pdf`](CV_Anthony_Ge_SWE_QuantDev.pdf) | systems, testing, CI, performance work |
| Quant Trading / Quant Research | [`CV_Anthony_Ge_QuantTrading.tex`](CV_Anthony_Ge_QuantTrading.tex) | [`CV_Anthony_Ge_QuantTrading.pdf`](CV_Anthony_Ge_QuantTrading.pdf) | statistical rigor, forecasting, backtests |

Both PDFs are rebuilt automatically by GitHub Actions on every push.

## Layout

```
preamble.tex              shared style (fonts, spacing, macros)
sections/header.tex       name + contact line
sections/education.tex    degree + GPA; coursework comes from \coursework, set per variant
sections/experience.tex   internships (identical in both variants)
CV_Anthony_Ge_*.tex              root files: coursework, project order/emphasis, skills
```

Edit `sections/` to change something in both resumes at once; edit a root file to change one variant.

## Building locally

With [Tectonic](https://tectonic-typesetting.github.io/) (single binary, downloads packages on demand):

```bash
tectonic CV_Anthony_Ge_SWE_QuantDev.tex && tectonic CV_Anthony_Ge_QuantTrading.tex
```

Or with a full TeX Live install:

```bash
latexmk -xelatex CV_Anthony_Ge_SWE_QuantDev.tex CV_Anthony_Ge_QuantTrading.tex
```

The template is adapted from [Jake Gutierrez's resume](https://github.com/jakegut/resume) and uses [Carlito](https://ctan.org/pkg/carlito), a metric-compatible clone of Calibri.
