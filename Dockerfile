ARG rundeck_tag="SNAPSHOT"
ARG rundeck_ansible_plugin=""

FROM rundeck/rundeck:${rundeck_tag}

ARG rundeck_ansible_plugin

USER root

RUN apt-get update -y && \
    apt-get install -y pipx

USER rundeck

RUN pipx install ansible
ENV PATH="${PATH}:/home/rundeck/.local/pipx/venvs"
