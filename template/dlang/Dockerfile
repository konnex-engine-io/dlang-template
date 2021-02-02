FROM openfaas/of-watchdog:0.8.1 as watchdog

FROM alpine:3 AS builder

COPY --from=watchdog /fwatchdog /fwatchdog
RUN chmod +x /fwatchdog

WORKDIR /tmp/

RUN touch ./.lock


RUN \
  apk add --no-cache ldc gcc dub libgcc musl-dev zlib

COPY . /tmp/

RUN DFLAGS='-static' dub -v build
RUN chmod +x ./hello-d

FROM scratch

WORKDIR /

# Uncomment the lines below to use with Vibe-D aaplications
# COPY --from=build /tmp/public/css /app/css
# COPY --from=build /tmp/public/img /app/img
# COPY --from=build /tmp/public/js /app/js
COPY --from=builder /tmp/hello-d /bin/hello-d
COPY --from=builder /fwatchdog  /fwatchdog
COPY --from=builder /tmp/.lock  /tmp/.lock

ENV PATH "$PATH:/bin:/"

ENV fprocess="/bin/hello-d"

# Uncomment to write debug messages to STDOUT
# ENV write_debug=true
ENV mode=streaming
ENV content_type=text/html
# ENV http_upstream_url=http:127.0.0.1:5000

# ENV suppress_lock=true

HEALTHCHECK --interval=5s CMD [ -e /tmp/.lock ] || exit 1

CMD ["/fwatchdog"]