#!/usr/bin/env bash
set -euo pipefail

source "$HOME/anaconda3/etc/profile.d/conda.sh"   # agora a função conda existe

conda activate control_panel_env
cd ~/Documentos/repos/control-panel
python main.py
