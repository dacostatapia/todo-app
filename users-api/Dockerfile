FROM maven:3.9.2-eclipse-temurin-8-alpine AS build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM maven:3.9.2-eclipse-temurin-8-alpine
WORKDIR /
COPY --from=build /app/target/users-api-0.0.1-SNAPSHOT.jar /users-api-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "users-api-0.0.1-SNAPSHOT.jar"]