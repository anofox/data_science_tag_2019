#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

conda env update --name base --file "$DIR/conda_env_r.yaml"
eval "$(conda shell.bash hook)"
conda activate r-timeseries
R -e "source('$DIR/install_r_pkgs.R')"
jupyter nbextension enable --py widgetsnbextension
jupyter labextension enable @jupyter-widgets/jupyterlab-manager
