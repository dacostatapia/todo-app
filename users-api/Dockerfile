FROM maven:3.9.2-eclipse-temurin-8-alpine
WORKDIR /app
COPY . .
RUN mvn clean install
CMD ["java", "-jar", "target/users-api-0.0.1-SNAPSHOT.jar"]