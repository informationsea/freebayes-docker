FROM alpine:3.10 AS build
RUN apk add curl
RUN curl -OL https://github.com/ekg/freebayes/releases/download/v1.3.1/freebayes-v1.3.1
RUN chmod +x freebayes-v1.3.1

FROM alpine:3.10
RUN apk add --no-cache bash
COPY --from=build /freebayes-v1.3.1 /usr/local/bin/freebayes