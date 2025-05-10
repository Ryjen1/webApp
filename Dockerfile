# Use Eclipse Temurin JDK 21
FROM eclipse-temurin:21-jdk-jammy

# Set working directory
WORKDIR /app

# Install Maven
RUN apt-get update && \
    apt-get install -y maven

# Copy files
COPY pom.xml .
COPY src ./src

# Build with tests skipped
RUN ./mvnw clean package -DskipTests

# Run the app
ENTRYPOINT ["java", "-jar", "target/*.jar"]