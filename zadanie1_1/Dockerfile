FROM alpine
RUN apk update && apk add git
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
