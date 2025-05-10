# Use OpenJDK 21
FROM eclipse-temurin:21.0.3_9-jdk

# Set working directory
WORKDIR /app

# Install Maven
RUN apt-get update && \
    apt-get install -y maven

# Copy Maven files
COPY pom.xml .
COPY src ./src

# Build the app inside the container
RUN mkdir -p target && \
    mvn clean package

# Run the app
ENTRYPOINT ["java", "-jar", "target/*.jar"]

