FROM jupyter/minimal-notebook
ARG KPT_VERISON="v1.0.0-beta.9"
ARG HELM_VERISON="v3.7.2"
ARG KUSTOMIZE_VERISON="v4.4.1"
USER root
RUN wget https://github.com/GoogleContainerTools/kpt/releases/download/${KPT_VERISON}/kpt_linux_amd64 -O /usr/bin/kpt && \
    chmod a+x /usr/bin/kpt
RUN wget https://get.helm.sh/helm-${HELM_VERISON}-linux-amd64.tar.gz && \
    tar -zxvf helm-${HELM_VERISON}-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-amd64 && \
    rm helm-${HELM_VERISON}-linux-amd64.tar.gz
RUN wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/${KUSTOMIZE_VERISON}/kustomize_${KUSTOMIZE_VERISON}_linux_amd64.tar.gz && \
    tar -zxvf kustomize_${KUSTOMIZE_VERISON}_linux_amd64.tar.gz && \
    mv kustomize /usr/local/bin/kustomize && \
    rm kustomize_${KUSTOMIZE_VERISON}_linux_amd64.tar.gz
USER ${NB_UID}
RUN mamba install --quiet --yes \
    'pandas' \
    'pyyaml' \
    'python-kubernetes==21.7.0' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
