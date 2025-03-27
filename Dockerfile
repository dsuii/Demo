# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven wrapper and pom.xml
COPY Spring1/pom.xml ./
COPY demo1/.mvn .mvn
COPY demo1/mvnw .

# Build the application inside the container
RUN chmod +x mvnw && ./mvnw dependency:resolve

# Copy the project source code
COPY demo1/Spring1/src ./src

# Package the application
RUN ./mvnw clean package -DskipTests

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/*.jar"]
