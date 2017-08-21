FROM hypriot/rpi-alpine-scratch

RUN apk update
RUN apk add curl

ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.2/supercronic-linux-arm \
  SUPERCRONIC=supercronic-linux-arm \
  SUPERCRONIC_SHA1SUM=5f2dc51893e0360083894fdedc70e2ec55cbd3e3

RUN curl -fsSLO "$SUPERCRONIC_URL" \
  && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
  && chmod +x "$SUPERCRONIC" \
  && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
  && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic

ADD crontab /crontab

ENTRYPOINT ["supercronic"]

CMD ["/crontab"]
