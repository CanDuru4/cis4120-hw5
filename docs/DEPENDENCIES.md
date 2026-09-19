# Dependencies and maintenance

Moved out of the README.

- No GitHub Actions workflows. CodeQL runs as GitHub's default setup, not from a workflow file
  in this repository.
- Dependencies are updated by hand; there is no Dependabot version-update config. A major
  bump still needs a deliberate `npm ci && npm run build` check before it is merged.
- `package.json` carries an `overrides` block that pins transitive packages
  (`@humanfs/node`, `brace-expansion`, `nanoid`, `postcss`, `react-router`) to versions at or
  above their first patched release. Do not lower those floors without checking the
  corresponding advisories; `npm audit` should report zero vulnerabilities.
