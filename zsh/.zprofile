# Corrige suporte de apps para Wayland (Ex: Firefox, OBS, etc)
export MOZ_ENABLE_WAYLAND=1

# PATHs de programas manuais (usados por scripts, Flatpak, etc)
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/npm-global/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Caminhos padrão do Rust
export RUSTUP_HOME="$HOME/.rustup"
export CARGO_HOME="$HOME/.cargo"

# Se estiver usando Conda fora do terminal
export CONDA_EXE="/home/varani/anaconda3/bin/conda"
export _CE_M=""
export _CE_CONDA=""
export CONDA_PYTHON_EXE="/home/varani/anaconda3/bin/python"

# Caso scripts fora do terminal precisem do ambiente Conda ativado
# (opcional, pode comentar se não quiser)
# eval "$($HOME/anaconda3/bin/conda shell.zsh hook)"
# conda activate base
