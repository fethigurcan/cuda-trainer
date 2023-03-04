FROM nvidia/cuda:12.0.1-runtime-ubuntu22.04

RUN apt update && \
    apt install git curl wget python3 pip -y

RUN groupadd --gid 1000 app && \
    useradd --uid 1000 --gid 1000 -m app

USER app
WORKDIR /home/app 

#miniconda start
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.1.0-1-Linux-x86_64.sh && \
    bash Miniconda3-py310_23.1.0-1-Linux-x86_64.sh -b && \
    rm Miniconda3-py310_23.1.0-1-Linux-x86_64.sh 

ENV MLFLOW_CONDA_HOME=/home/app/miniconda3
#miniconda end

#py env start
RUN curl https://pyenv.run | bash

ENV PYENV_ROOT="/home/app/.pyenv"
ENV PATH="$PYENV_ROOT/bin:/home/app/.local/bin:$PATH"
#pyenv end

RUN pip install --no-cache-dir torch
RUN pip install --no-cache-dir scikit-learn scikit-learn-intelex
RUN pip install --no-cache-dir mlflow
