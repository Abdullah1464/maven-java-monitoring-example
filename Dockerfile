# Stage 1: Build the application
FROM maven:latest AS ApplicationBuilder
WORKDIR /app
COPY . .
RUN mvn package

# Stage 2: Create the final image
FROM openjdk:latest
WORKDIR /app
COPY --from=ApplicationBuilder /app/target/actuator-demo-0.0.1-SNAPSHOT.jar ./actuator-demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "actuator-demo-0.0.1-SNAPSHOT.jar"]