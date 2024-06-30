ARG rundeck_tag="SNAPSHOT"
ARG rundeck_ansible_plugin="https://github.com/rundeck-plugins/ansible-plugin/releases/download/v4.0.1/ansible-plugin-4.0.1.jar"

FROM rundeck/rundeck:${rundeck_tag}
ARG rundeck_ansible_plugin

USER root

RUN apt-get update -y && \
    apt-get install -y pipx

COPY ./rootfs/ /

USER rundeck

RUN pipx install ansible
ADD --chown=rundeck:users "${rundeck_ansible_plugin}" /var/lib/rundeck/libext/
ENV PATH="${PATH}:/home/rundeck/.local/pipx/venvs/ansible/bin"
