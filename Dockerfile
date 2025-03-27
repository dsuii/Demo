# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven build file and dependencies first for efficient caching
COPY Spring1/pom.xml .
COPY Spring1/.mvn .mvn
COPY Spring1/mvnw .
RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline

# Copy the rest of the application source code
COPY Spring1/src ./src

# Build the application
RUN ./mvnw package -DskipTests

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/*.jar"]
