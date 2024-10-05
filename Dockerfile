FROM openjdk:17-alpine

WORKDIR /app

COPY target/ms-save-car.jar app.jar

EXPOSE 8070

ENTRYPOINT [ "java", "-jar", "app.jar" ]