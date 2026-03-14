# syntax=docker/dockerfile:1

FROM alpine AS base
ARG TARGETPLATFORM
ARG VERSION="unknown"
RUN echo "Hello, World! This is ${VERSION} running on ${TARGETPLATFORM}" > /hello.txt
ARG BUILDKIT_SBOM_SCAN_STAGE=true

FROM scratch
COPY --from=base /hello.txt /
