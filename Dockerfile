FROM continuumio/miniconda3
MAINTAINER DataZoo GmbH <contact@data-zoo.de>

## Declares build arguments
ARG NB_USER
ARG NB_UID

ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}/

SHELL ["bash", "-c"]
WORKDIR $HOME

COPY ./*.ipynb ${HOME}
COPY ./*.RData ${HOME}
COPY ./environment/* ${HOME}/environment/

# Install libraries needed by R packages
RUN apt-get update \
    && apt-get install -y gawk make \
    && rm -rf /var/lib/apt/lists/*

# Install neccessary packages and build R libs
RUN $HOME/environment/create_env_r.sh

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
