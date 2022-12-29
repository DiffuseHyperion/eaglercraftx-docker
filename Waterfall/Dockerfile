FROM eclipse-temurin:8-jdk-jammy

ENV MIN_RAM=128M
ENV MAX_RAM=128M

VOLUME /server
WORKDIR /
EXPOSE 25577

COPY ./start.sh start.sh

CMD sh start.sh