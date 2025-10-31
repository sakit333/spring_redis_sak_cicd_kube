pipeline {
    agent any

    environment {
        PROJECT_NAME = 'spring_redis_sak_app'
        DOCKERHUB_USERNAME = 'sakit333'
    }
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'qa', 'prod'], description: 'Select deployment environment')
    }

    stages {
        stage("check docker is installed or not") {
            steps {
                script {
                    def dockerExists = sh(script: 'which docker', returnStatus: true) == 0
                    if (dockerExists) {
                        echo "Docker is installed."
                    } else {
                        error "Docker is not installed. Please install Docker to proceed."
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    if (ENVIRONMENT == 'dev') {
                        echo "Dev environment detected — Building Docker image"
                        sh "sudo docker build -t ${DOCKERHUB_USERNAME}/${PROJECT_NAME}:${env.BUILD_ID} ."
                    } else {
                        echo "Skipping Docker build — ENVIRONMENT=${ENVIRONMENT}"
                    }
                }
            }
        }
    }
    post {
        always {
            echo "Pipeline completed."
        }
        success {
            echo "Pipeline succeeded."
        }
        failure {
            echo "Pipeline failed."
        }
    }
}