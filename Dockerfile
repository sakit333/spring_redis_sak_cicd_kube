############################################################
# Developed & Designed by: sak_shetty
# Project: Spring Boot + Redis Application
# Purpose: Multi-stage Docker build for optimized image
############################################################

###############################
# 1️⃣ Build Stage
###############################
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app

# Copy only pom first for dependency caching
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Copy source and build
COPY src ./src
RUN mvn -B clean package -DskipTests


###############################
# 2️⃣ Run Stage (Slim Java Runtime)
###############################
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copy jar from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose application port
EXPOSE 8084

# Default Redis variables (can be overridden in K8s)
ENV SPRING_REDIS_HOST=redis
ENV SPRING_REDIS_PORT=6379

# Start application
ENTRYPOINT ["java", "-jar", "app.jar"]
