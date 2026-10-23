FROM alpine:3.24@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

WORKDIR /usr/src/app

ONBUILD COPY --from=builder /usr/local/bin/node /usr/local/bin/
ONBUILD COPY --from=builder /usr/lib/ /usr/lib/
ONBUILD COPY --from=builder /usr/local/lib/ /usr/local/lib/
ONBUILD RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
  ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx
ONBUILD COPY --from=builder /usr/src/app/ /usr/src/app/
ENV PATH /usr/src/app/node_modules/.bin:$PATH
