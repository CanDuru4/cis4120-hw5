@AGENTS.md

## Claude Code

- `node_modules` is usually absent in this checkout; run `npm ci` before the `npm run build` check.
- Use a targeted Read with `offset`/`limit` or grep on `Port5176App.tsx` (~1240 lines) rather than reading it whole every time.
- Search results under `src/` include the untracked legacy code. Check `git -C <repo> ls-files` before assuming a file is part of the shipped prototype.
