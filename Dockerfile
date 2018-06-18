FROM alpine:3.7@sha256:e1871801d30885a610511c867de0d6baca7ed4e6a2573d506bbec7fd3b03873f

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

WORKDIR /usr/src/app

ONBUILD COPY --from=builder /usr/local/bin/node /usr/local/bin/
ONBUILD COPY --from=builder /usr/lib/ /usr/lib/
ONBUILD COPY --from=builder /usr/local/lib/ /usr/local/lib/
ONBUILD RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
  ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx
ONBUILD COPY --from=builder /usr/src/app/ /usr/src/app/
ENV PATH /usr/src/app/node_modules/.bin:$PATH
