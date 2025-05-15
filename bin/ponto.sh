#!/usr/bin/env bash
set -euo pipefail

# 1. Deixe o Conda “aparecer” para o script
source "$HOME/anaconda3/etc/profile.d/conda.sh"   # agora a função conda existe

# 2. Use o Conda normalmente
conda activate ponto_ecosocial_env

# 3. Rode o seu programa
cd ~/Documents/repos/ponto-ecosocial
python main.py
