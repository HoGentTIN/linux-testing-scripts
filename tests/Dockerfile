# Container image for testing Bash scripts

FROM almalinux:9

RUN mkdir /app; \
    dnf install -y epel-release; \
    dnf install -y bats ShellCheck

WORKDIR /app