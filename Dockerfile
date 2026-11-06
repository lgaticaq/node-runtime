FROM alpine:3.24@sha256:3f4d6b32e26703c6082839234f43769d5046b3ac7c910033911d1e71d8cd630a

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

WORKDIR /usr/src/app

ONBUILD COPY --from=builder /usr/local/bin/node /usr/local/bin/
ONBUILD COPY --from=builder /usr/lib/ /usr/lib/
ONBUILD COPY --from=builder /usr/local/lib/ /usr/local/lib/
ONBUILD RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
  ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx
ONBUILD COPY --from=builder /usr/src/app/ /usr/src/app/
ENV PATH /usr/src/app/node_modules/.bin:$PATH
