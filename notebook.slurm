#!/bin/sh
# use `sbatch notebook.sh` to launch a root notebook server in a worker node

# ssh back to the login node from the worker node
# -N do not execute a command, just forward ports
# -f send ssh to background
# -R forward remote (login) requests to 58888 to local (worker) port 8888
# -M and -S options are specified in ~/.ssh/config
ssh -N -f -R 58888:localhost:8888 $SLURM_SUBMIT_HOST

if [ -z $(command -v apptainer) ]; then module load apptainer; fi

# `apptainer pull docker://physino/root:notebook` creates root_notebook.sif
# --no-browser will avoid launching a browser
# --ip=0.0.0.0 allows connections from any ip address
~/bin/root_notebook.sif root --notebook --no-browser --ip=0.0.0.0

# send exit command to the background ssh process
ssh -O exit $SLURM_SUBMIT_HOST

