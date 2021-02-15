FROM node:15-alpine

ENV REVIEWDOG_VERSION=v0.11.0-nightly20201213+85edbc6

RUN apk --no-cache add bash~=5.0

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/nightly/master/install.sh | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

RUN apk --no-cache -U add git

COPY entrypoint.sh /entrypoint.sh

COPY config/* /src/
RUN yarn install --production --non-interactive --cwd /src/ && \
  yarn cache clean --force --cwd /src/
COPY entrypoint.sh ./
ENV PATH="/src/node_modules/.bin:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]
CMD []
