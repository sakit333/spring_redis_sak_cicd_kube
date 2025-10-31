pipeline {
    agent any

    environment {
        PROJECT_NAME = 'spring-redis-sak-app'
        DEPLOY_ENV = 'production'
    }
    stages {
        stage("check the files and path") {
            steps {
                sh 'ls -al'
                sh 'pwd'
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