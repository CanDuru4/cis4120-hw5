@AGENTS.md

Compatible heavy committed-source checks prefer the gaming PC through `remote-run.py`, which handles bounded wake/connect automatically. Follow AGENTS.md for runtime/data exceptions, native checks and matching-result reuse. Do not ask for PC availability each time or silently fall back to the Mini.

## Claude Code

- `node_modules` is usually absent in this checkout; run `npm ci` before the `npm run build` check.
- Use a targeted Read with `offset`/`limit` or grep on `Port5176App.tsx` (~1240 lines) rather than reading it whole every time.
- Search results under `src/` include the untracked legacy code. Check `git -C <repo> ls-files` before assuming a file is part of the shipped prototype.
