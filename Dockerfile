# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy Maven wrapper scripts
COPY mvnw mvnw
COPY mvnw.cmd mvnw.cmd
COPY .mvn .mvn

# Copy the pom.xml to download dependencies
COPY Spring1/pom.xml pom.xml

# Download dependencies (cache layer)
RUN ./mvnw dependency:go-offline

# Copy the entire Spring Boot application source
COPY Spring1 /app

# Build the application
RUN chmod +x mvnw && ./mvnw package -DskipTests

# Expose the application port (change if needed)
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "target/*.jar"]
