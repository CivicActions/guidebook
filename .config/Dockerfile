# This installs reviewdoc, mkdocs and remark for convenient usage in pre-commit hooks and Github actions.

FROM node:18-alpine

ENV REVIEWDOG_VERSION=v0.13.1

RUN \
  apk add --update \
  ca-certificates \
  bash \
  git \
  openssh \
  python3 \
  python3-dev \
  py3-pip \
  build-base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

# Install mkdocs and dependencies.
COPY requirements.txt /usr/src/
RUN pip3 install -r /usr/src/requirements.txt
RUN git config --global --add safe.directory .docs

# Install remark and dependencies.
COPY remark/* /usr/src/
RUN yarn install --production --non-interactive --cwd /usr/src && \
  yarn cache clean --force --cwd /usr/src \
  mkdir /src
ENV PATH="/usr/src/node_modules/.bin:${PATH}"

COPY scripts/*.sh /usr/bin/
WORKDIR /src

ENTRYPOINT ["/bin/bash"]
CMD []
