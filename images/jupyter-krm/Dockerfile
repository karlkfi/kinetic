FROM jupyter/minimal-notebook
USER root
RUN wget https://github.com/GoogleContainerTools/kpt/releases/download/v1.0.0-beta.9/kpt_linux_amd64 -O /usr/bin/kpt && \
    chmod a+x /usr/bin/kpt
USER ${NB_UID}
RUN mamba install --quiet --yes \
    'pandas' \
    'pyyaml' \
    'python-kubernetes==21.7.0' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
