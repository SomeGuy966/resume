# Working on this repo

Instructions for any coding agent (Claude Code, Codex, Cursor, …) asked to change Anthony Ge's
resume. **Read this before editing anything.**

## The one rule that is easy to get wrong

This repo keeps a **browsable timeline of past resume PDFs**. Before you change any resume
content, you must archive the current PDF so the old version is preserved:

```bash
scripts/snapshot.sh all "one line describing the version you are about to replace"
```

Then make the edits and rebuild. Do not skip this, and do not archive *after* rebuilding —
by then the old PDF is gone. If you only changed one variant, use `swe` or `quant-trading`
instead of `all`.

## Layout

```
preamble.tex                       shared style: fonts, spacing, macros, link colour
sections/header.tex                name + contact line          } shared by BOTH variants
sections/education.tex             degree, GPA, \coursework      } edit these to change both
sections/experience.tex            Amazon + MedSphere            }
swe/Anthony_Ge_Resume_SWE.tex                    root file: coursework, project order, skills
swe/Anthony_Ge_Resume_SWE.pdf                    current PDF (built)
swe/history/                                     superseded PDFs only — never put .tex here
swe/README.md                                    version-history table
quant-trading/…                                  same shape
scripts/snapshot.sh                              archive current PDF(s) into history/
scripts/reindex.sh                               add a row to a variant's history table
```

Change something in `sections/` and it lands in both resumes. Change a root `.tex` and it lands
in one. The two variants differ deliberately: project order, the `\coursework` line, and the
Skills block. See each variant's README for who it is aimed at.

## Building

```bash
cd swe && tectonic Anthony_Ge_Resume_SWE.tex
cd quant-trading && tectonic Anthony_Ge_Resume_QuantTrading.tex
```

`latexmk -xelatex` works too. GitHub Actions rebuilds both on every push and commits the PDFs,
so **`git pull` after pushing** or your next edit will conflict.

## Hard constraints

- **Each resume must stay exactly one page.** Check after every change. If content no longer
  fits, tighten wording rather than shrinking margins or font size further; both are already
  tight. Verify with a PDF tool, not by eye.
- **Do not invent or inflate claims.** Every number on these resumes traces to a real repo or a
  transcript. Specifically: the Amazon service is an *observer*, never a validation gate — nothing
  may imply it blocked or prevented bad publishes; no internal Amazon names or ticket jargon.
  btc-trading-pipeline has no WebSocket, backtester, fee/slippage modelling or live trading.
  weather-bot used hourly METARs from IEM/NWS (not 1-minute data, not MADIS) and never traded live.
- Filenames in `history/` follow the descending scheme below — let `scripts/snapshot.sh` generate
  them rather than naming files by hand.

## Why the history filenames look like that

GitHub's web UI lists files in **ascending** lexicographic order and offers no way to reverse it.
To make the newest version appear at the **top** of `history/`, each file carries a 10-digit
descending sort key:

```
7973908499_2026-09-15_Anthony_Ge_Resume_SWE.pdf
└────┬───┘ └───┬────┘ └──────────┬──────────┘
     │         │                 └─ variant, so the file is meaningful once downloaded
     │         └─ the real date, human readable
     └─ (99999999 − YYYYMMDD) followed by (99 − nth version that day)
```

A later date produces a *smaller* number, so it sorts first. The two trailing digits break ties
within a single day, also descending. `scripts/snapshot.sh` computes all of this.
