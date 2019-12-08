# chmod u+x env.sh
# ./env.sh
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
pipenv sync
pipenv shell