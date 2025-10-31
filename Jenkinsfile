pipeline {
    agent any

    environment {
        PROJECT_NAME = 'spring-redis-sak-app'
        DEPLOY_ENV = 'production'
    }
    stages {
        stage("check docker is installed or not") {
            steps {
                script {
                    def dockerExists = sh(script: 'which docker', returnStatus: true) == 0
                    if (dockerExists) {
                        echo "Docker is installed."
                        sh 'docker images'
                        sh 'docker ps -a'
                    } else {
                        error "Docker is not installed. Please install Docker to proceed."
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