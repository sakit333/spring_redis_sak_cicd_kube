# Spring Project with Redis

## 📌 Project Features

- Spring Boot (Java 17)
- Redis integration using Spring Data
- Docker Multi-Stage Build (Maven + JRE)
- Docker Compose (App + Redis)
- Thymeleaf UI
- Environment-based Redis host config
- Jenkins CI/CD ready

## Running the Docker container
- Start the services:
```bash
docker-compose up --build
```
- Visit your app: http://PUBLIC_IP:8084
- Redis is accessible inside Docker network at host redis:6379.
---
*Developed and Designed by Sak_shetty*