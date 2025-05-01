FROM maven:3-eclipse-temurin-21-alpine AS build
WORKDIR /app
COPY . .
RUN mvn package

FROM alpine
WORKDIR /app
COPY --from=build /app/delivery/target/runtime ./
RUN /bin/sh -c 'chmod u+x ./entrypoint.sh ./bin/* ./lib/jspawnhelper'
ENTRYPOINT ["/bin/sh", "-c", "./entrypoint.sh"]