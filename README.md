# resume

My resume, written in LaTeX. [`resume.pdf`](resume.pdf) is rebuilt automatically by GitHub Actions on every push to `resume.tex`.

## Building locally

With [Tectonic](https://tectonic-typesetting.github.io/) (single binary, downloads packages on demand):

```bash
tectonic resume.tex
```

Or with a full TeX Live install:

```bash
latexmk -xelatex resume.tex
```

The template is adapted from [Jake Gutierrez's resume](https://github.com/jakegut/resume) and uses [Carlito](https://ctan.org/pkg/carlito), a metric-compatible clone of Calibri.
