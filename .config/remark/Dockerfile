# This installs reviewdoc, mkdocs and remark for convenient usage in pre-commit hooks and Github actions.

FROM node:18-alpine

ENV REVIEWDOG_VERSION=v0.18.1

RUN \
  apk add --update \
  ca-certificates \
  bash \
  git \
  openssh \
  build-base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

# Install remark and dependencies.
COPY * /usr/src/
RUN yarn install --production --non-interactive --cwd /usr/src && \
  yarn cache clean --force --cwd /usr/src && \
  mkdir /src && \
  git config --system --add safe.directory /src
ENV PATH="/usr/src/node_modules/.bin:${PATH}"

COPY *.sh /usr/bin/
WORKDIR /src

ENTRYPOINT ["/bin/bash"]
CMD []
