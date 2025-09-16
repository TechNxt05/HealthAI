#!/usr/bin/env bash
# Exit immediately if a command fails
set -e

# Install pyenv to manage Python versions
if ! command -v pyenv &> /dev/null
then
    curl https://pyenv.run | bash
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Install desired Python version
pyenv install -s 3.12.6
pyenv local 3.12.6

# Upgrade pip
pip install --upgrade pip

# Install dependencies
pip install -r requirements.txt

pip install gunicorn eventlet