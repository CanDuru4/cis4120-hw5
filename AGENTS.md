# cis4120-hw5: Customs Case Review Prototype

CIS 4120 (Intro to HCI) HW5 at Penn, Spring 2026. The course is over and the repo is kept for maintenance only. It is a high-fidelity UI prototype of a customs-declaration review workflow, built with React 19, TypeScript 7 (strict) and Vite 8. It has no backend. The repo is public.

## Repo map (tracked files)

- `index.html`: the app shell. It loads `/src/main.5176.tsx` through a `@vite-ignore` dynamic import.
- `src/main.5176.tsx`: the React root (StrictMode + BrowserRouter + `Port5176App`).
- `src/port5176/Port5176App.tsx`: the whole prototype in one component (~1240 lines). It holds the types, the `reqTabs`/`reqMeta` for tabs `Req 1` to `Req 10`, case state, upload, evidence linking, the review matrix and routing.
- `src/port5176/port5176.css`: the prototype styles. `src/styles/global.css` holds the base resets and tokens.
- `docs/DEPENDENCIES.md`: the `overrides` policy. There is no Dependabot version-update config.

## Legacy untracked code (gotcha)

- Only the port-5176 prototype is tracked. The earlier 5173/5174/5175 experiments (`src/main.tsx`, `src/main.caseflow.tsx`, `src/main.neo.tsx`, `src/App.tsx`, `src/CaseFlowApp.tsx`, `src/caseflow/`, `src/neo/`, `src/pages/`, `src/dashboard/`, `src/state/`, `src/lib/`, `src/styles/app.module.css`, `src/styles/theme.css`) are listed in `.gitignore`. They may still exist in a local checkout.
- Do not edit them, un-ignore them or delete them unless asked to. Any feature work goes in `src/port5176/`.
- `tsconfig.json` includes all of `src`. In a checkout that still has the legacy files, `tsc -b` also type-checks them, and they import `pdfjs-dist`. A fresh clone does not have them.

## Commands

```bash
npm ci
npm run dev        # vite --port 5176 --strictPort (dev:5176 is an alias)
npm run build      # tsc -b && vite build -> dist/
npm run preview    # vite preview of dist/
npm run lint       # eslint . -- errors out: no eslint.config.js exists
```

- `vite.config.ts` sets `server.port: 5173`, but the npm scripts override it with `--port 5176 --strictPort`. Always use the scripts.
- `npm run build` is the only correctness check. There is no test suite and no working linter.
- Node `^20.19.0 || >=22.12.0` (Vite 8 requirement).
- No deploy target and no GitHub Actions workflows. CodeQL runs as GitHub default setup.

## Behavior and conventions

- All state lives in the browser `localStorage` under the key `hw5_port5176_state_v1`. This includes uploaded PDFs, stored as data URLs. If you change the stored shape, bump the key suffix instead of breaking existing saved state.
- There are no env vars, no `.env` and no API keys. Nothing is uploaded anywhere. Keep it that way.
- The declarant fields are fixed: `companyName`, `grossWeight`, `invoiceNumber`, `itemDescription`, `quantity` (`DeclarantFields` type).
- `npm run preview` does not render the app. The dynamic import in `index.html` means the production bundle has only the loader. Use `npm run dev` for demos and grading.
- `pdf-lib` and `pdfjs-dist` are declared in `package.json`, but no tracked file imports them.
- Do not lower the floors in the `package.json` `overrides` block without checking the advisories (see `docs/DEPENDENCIES.md`). `npm audit` should report 0 vulnerabilities.
- A major dependency bump needs `npm ci && npm run build` to pass before it is merged.
- The README keeps the owner's standard skeleton: an AI-assistance acknowledgment, "Coursework; no license granted", and Author "Can Duru — canduru.net". Keep those sections when editing it.

## Shared local capacity

The package build and validation commands use the optional Mini helper at
`~/Developer/personal/mac-mini/validation-economy` for CPU/RAM admission.
Use the usual package commands directly, without an outer lockf. Matching clean
validation can reuse a pass; commands producing build or render output always run.
The `:local` scripts hold the original recipes for the wrapper and remote builders.
Without the helper, the original command still runs. Existing tool caches remain.

## Validation placement and reuse (owner update 2026-10-26)

- Follow the global Claude/Codex test policy and `~/Developer/personal/mac-mini/validation-economy/README.md` and `COVERAGE.md`. Focus first; full coverage only when the changed inputs require it. Docs-only policy edits need no application suite or deploy.
- Use `~/Developer/personal/mac-mini/validation-economy/remote-run.py` for every check that can run on Linux (owner rule 2026-10-27: "all the things that we can run on pc must be on pc"): tests, lint, typecheck, Node and web checks. The Mini keeps only what needs macOS or a device, each such chunk with its reason written in the gate map; this repo wires the route in its own gate, and Linux-capable work left on the Mini is a bug to fix here. It defaults to `gaming-pc` and handles connection and bounded Wake-on-LAN automatically; call it directly without a separate online check or asking the owner each time. Match the pinned runtime and locked dependencies, bound actual workers, and preserve repo data-export restrictions. Never export credentials, production data, signing keys or uncommitted work.
- The PC pool shares eight CPU slots and 24 GiB across isolated jobs with zero test swap; retain automatic job cleanup, the 8 GiB package-cache budget and 128 GiB virtual-disk cap. Brain is an explicit secondary route (`--runner brain`) when compatible, capped at two CPUs and 4 GiB together. If the PC remains unavailable after bounded wake/connect, report the blocker; never silently start the same work on the Mini or replay an uncertain submitted job.
- For work that must run on the Mini: call this repo's integrated check/build entry points directly, without an outer `lockf`. Keep worker ceilings; reserve separate heavy phases and diagnose retention by physical footprint, including compressed memory.
- Reuse only supported receipts with matching source, coverage, dependencies, runtime/platform and relevant environment. Preserve passed unaffected batches; count remote results only when the owning gate aggregates them. Receipts do not replace required build artifacts or OS/device/browser proof. Split or offload an impossible reservation instead of waiting indefinitely; only stop your own obsolete jobs. Existing gates need explicit remote routing and matching-result aggregation; this instruction does not automatically move unintegrated commands.
