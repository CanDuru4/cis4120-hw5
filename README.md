# Customs Case Review Prototype

![React](https://img.shields.io/badge/React-19-61dafb?style=flat&logo=react&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-7-3178c6?style=flat&logo=typescript&logoColor=white)
![Vite](https://img.shields.io/badge/Vite-8-646cff?style=flat&logo=vite&logoColor=white)

Interactive high-fidelity prototype of a customs-declaration review workflow: an analyst creates a
case, types the declarant fields by hand, uploads the supporting PDFs, links each field to the
region of a document that proves it, and a reviewer validates the result in a field-by-document
matrix before the case is sent on. The audience is the course staff grading the assignment and the
teammates iterating on the design. It is a UI prototype, not a production system, and it has no
backend. This repository tracks only the latest prototype (served on port 5176); earlier per-port
experiments (5173/5174/5175) are deliberately untracked and listed in [`.gitignore`](.gitignore).

> **Context:** CIS 4120 (Introduction to Human-Computer Interaction) HW5, University of Pennsylvania, Spring 2026

## Features

All ten requirement surfaces live behind the `Req 1` … `Req 10` tabs of a single app shell:

| Tab | Surface |
| --- | --- |
| Req 1 | Hello-world boot screen that confirms the app runs on the target runtime |
| Req 2 | Style tokens: typography, colours, icons, badges, buttons |
| Req 3 | Role dashboard: cases grouped by status, role-specific actions (Analyst / Reviewer, plus Case Reviewer / Lead Reviewer / CEO dashboard views) |
| Req 4 | Case creation and manual entry of the fixed declarant fields |
| Req 5 | Multi-file PDF upload with tabbed document viewing (separate files or one combined file) |
| Req 6 | Manual evidence linking between a declarant field and a highlighted region of the active PDF |
| Req 7 | Send-file validation: missing values, missing links, and value mismatches block the send, with an explanation flow |
| Req 8 | Review matrix of declarant field × document with per-cell state |
| Req 9 | Field inspection modal showing the linked PDF region next to the typed value |
| Req 10 | Case routing between roles with comments and notifications |

Declarant fields covered by the prototype: company name, gross weight, invoice number,
item description, quantity.

## Tech stack

- **React 19** + **TypeScript 7** (strict mode)
- **Vite 8** dev server and build
- **react-router-dom 7** (`BrowserRouter` shell)
- No backend, no API keys: all case state lives in the browser

Dependency maintenance notes: [docs/DEPENDENCIES.md](docs/DEPENDENCIES.md).

## Architecture

Case-level data (declarant values, uploaded documents stored as data URLs, evidence links,
comments and notifications) is persisted to `localStorage` under the key
`hw5_port5176_state_v1`. Clearing site data resets the prototype to an empty case list. Nothing
is uploaded anywhere.

## Getting started

### Prerequisites

- Node.js `^20.19.0 || >=22.12.0` (required by Vite 8)
- npm 10+

### Installation

```bash
git clone https://github.com/CanDuru4/cis4120-hw5.git
cd cis4120-hw5
npm ci
npm run dev
```

Then open <http://localhost:5176>. The dev script uses `--strictPort`, so it fails fast rather
than silently moving to another port if 5176 is taken.

### Configuration

None. The prototype reads no environment variables and needs no `.env` file.

## Usage

| Script | What it does |
| --- | --- |
| `npm run dev` | Vite dev server on port 5176 (`dev:5176` is an alias) |
| `npm run build` | `tsc -b` type-check, then `vite build` into `dist/` |
| `npm run preview` | Serve the contents of `dist/` |
| `npm run lint` | Wired to ESLint, but no `eslint.config.js` exists yet, so it currently errors out |

To exercise the upload and evidence-linking flows, use any PDF declaration and supporting
documents of your own.

## Project structure

```
index.html                     app shell; dynamically imports the 5176 entry point
src/
  main.5176.tsx                React root: StrictMode + BrowserRouter + Port5176App
  port5176/
    Port5176App.tsx            the whole prototype (tabs, case state, upload, linking, matrix)
    port5176.css               prototype styles
  styles/global.css            base resets and shared tokens
docs/DEPENDENCIES.md           dependency maintenance notes
vite.config.ts                 Vite + @vitejs/plugin-react config
```

## Known limitations

- `index.html` loads the app through a `@vite-ignore` dynamic import, so the production bundle
  contains only that loader and `npm run preview` will not render the prototype. Use
  `npm run dev` for demos and grading until the entry point is made static.
- `pdf-lib` and `pdfjs-dist` are declared in `package.json` but not imported by any tracked
  source file.

## Acknowledgments

- Portions of this repository were developed with AI coding assistance (including code
  generation, refactoring suggestions, bug-fix drafts, and documentation edits).
- Team members reviewed, tested, and adjusted AI-assisted output before accepting changes.
- Final responsibility for implementation decisions, correctness, and submission content
  remains with the team.

## License

Coursework; no license granted. No `LICENSE` file is distributed, and all rights are reserved by the authors.

## Author

Can Duru — [canduru.net](https://canduru.net)

## Shared local capacity

The package build and validation commands use the optional Mini helper at
`~/Developer/personal/mac-mini/validation-economy` for CPU/RAM admission.
Use the usual package commands directly, without an outer lockf. Matching clean
validation can reuse a pass; commands producing build or render output always run.
The `:local` scripts hold the original recipes for the wrapper and remote builders.
Without the helper, the original command still runs. Existing tool caches remain.
