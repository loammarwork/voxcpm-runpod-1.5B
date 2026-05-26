#!/bin/sh
set -eu

if [ "${VOXCPM_MODEL:-}" = "openbmb/VoxCPM-1.5B" ]; then
    echo "[startup] Remapping deprecated VOXCPM_MODEL '${VOXCPM_MODEL}' to 'openbmb/VoxCPM1.5'."
    export VOXCPM_MODEL="openbmb/VoxCPM1.5"
fi

if [ -z "${VOXCPM_MODEL:-}" ]; then
    export VOXCPM_MODEL="openbmb/VoxCPM1.5"
fi

exec "$@"