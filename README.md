# resume

My resume, written in LaTeX, in two variants that share the same facts but differ in emphasis:

| Variant | Source | PDF | Aimed at |
|---|---|---|---|
| SWE / Quant Dev / Quant SWE | [`resume_swe_quantdev.tex`](resume_swe_quantdev.tex) | [`resume_swe_quantdev.pdf`](resume_swe_quantdev.pdf) | systems, testing, CI, performance work |
| Quant Trading / Quant Research | [`resume_quant_trading.tex`](resume_quant_trading.tex) | [`resume_quant_trading.pdf`](resume_quant_trading.pdf) | statistical rigor, forecasting, backtests |

Both PDFs are rebuilt automatically by GitHub Actions on every push.

## Layout

```
preamble.tex              shared style (fonts, spacing, macros)
sections/header.tex       name + contact line
sections/education.tex    degree + GPA; coursework comes from \coursework, set per variant
sections/experience.tex   internships (identical in both variants)
resume_*.tex              root files: coursework, project order/emphasis, skills
```

Edit `sections/` to change something in both resumes at once; edit a root file to change one variant.

## Building locally

With [Tectonic](https://tectonic-typesetting.github.io/) (single binary, downloads packages on demand):

```bash
tectonic resume_swe_quantdev.tex && tectonic resume_quant_trading.tex
```

Or with a full TeX Live install:

```bash
latexmk -xelatex resume_swe_quantdev.tex resume_quant_trading.tex
```

The template is adapted from [Jake Gutierrez's resume](https://github.com/jakegut/resume) and uses [Carlito](https://ctan.org/pkg/carlito), a metric-compatible clone of Calibri.
