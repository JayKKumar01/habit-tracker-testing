# Use an official OpenJDK 21 image
FROM eclipse-temurin:21-jdk-jammy

# Set working directory inside container
WORKDIR /app

# Copy Maven wrapper and pom.xml first (to leverage Docker cache)
COPY mvnw pom.xml ./
COPY .mvn .mvn

# Copy all source code
COPY src ./src

# Make Maven wrapper executable
RUN chmod +x mvnw

# Build the project (skip tests for faster build)
RUN ./mvnw clean package -DskipTests

# Expose default port (optional, Render uses $PORT anyway)
EXPOSE 8080

# Run the jar using Render's dynamic PORT environment variable
CMD ["sh", "-c", "java -Dserver.port=$PORT -jar target/app.jar"]
