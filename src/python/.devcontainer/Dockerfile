FROM mcr.microsoft.com/devcontainers/python:2-3.12-bullseye

RUN wget https://github.com/colonyos/colonies/releases/download/v1.9.0/colonies_1.9.0_linux_amd64.tar.gz -O /tmp/colonies.tar.gz \
    && tar -xzf /tmp/colonies.tar.gz -C /usr/local/bin/ colonies \
    && rm /tmp/colonies.tar.gz

CMD ["sleep", "infinity"]