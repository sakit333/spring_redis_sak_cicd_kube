pipeline {
    agent any

    environment {
        PROJECT_NAME = 'spring_redis_sak_app'
        DEPLOY_ENV = 'production'
        DOCKERHUB_USERNAME = 'sakit333'
    }
    stages {
        stage("check docker is installed or not") {
            steps {
                script {
                    def dockerExists = sh(script: 'which docker', returnStatus: true) == 0
                    if (dockerExists) {
                        echo "Docker is installed."
                        sh "sudo docker images"
                        sh "sudo docker ps -a"
                    } else {
                        error "Docker is not installed. Please install Docker to proceed."
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "sudo docker build -t ${DOCKERHUB_USERNAME}/${PROJECT_NAME}:${env.BUILD_ID} ."
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