#!/bin/sh
# Reserve local CPU/RAM for the existing package command without changing its recipe.
# Inputs: action (run or check), script name, forwarded package arguments.
# Returns: original command status. Example: sh scripts/capacity.sh run build
# Build and render commands always execute so their output is present and current.
set -eu
ROOT=$(dirname "$(dirname "$(realpath "$0")")")
ACTION=$1
SCRIPT=$2
shift 2
case "$ACTION" in run|check) ;; *) echo "invalid capacity action" >&2; exit 2 ;; esac
HELPER=${LOCAL_GATE_ROOT:-$HOME/Developer/personal/mac-mini/validation-economy}
if [ -f "$HELPER/entry.sh" ]; then
  . "$HELPER/entry.sh"
  local_gate_entry "$ACTION" "$ROOT" cis4120-hw5 "package:$SCRIPT" 2048 2 \
    npm --prefix "$ROOT" run "$SCRIPT:local" -- "$@"
fi
exec npm --prefix "$ROOT" run "$SCRIPT:local" -- "$@"
