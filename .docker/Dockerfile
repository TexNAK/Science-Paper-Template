FROM debian:bullseye-slim

# Set correct environment
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

COPY install_dependencies.sh ./
RUN ./install_dependencies.sh

RUN mkdir -p /project
WORKDIR /project

ENTRYPOINT ["./build.sh"]
CMD ["build"]
