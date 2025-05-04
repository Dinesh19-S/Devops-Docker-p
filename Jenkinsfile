pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = 'dinesh1910'
        APP_NAME = 'nodejs-demo'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Dinesh19-S/Devops-Docker-p.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_REGISTRY}/${APP_NAME}:latest")
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-creds') {
                        docker.image("${DOCKER_REGISTRY}/${APP_NAME}:latest").push()
                    }
                }
            }
        }
        stage('Deploy to Staging') {
            steps {
                sh "docker run -d -p 3000:3000 --name staging-app ${DOCKER_REGISTRY}/${APP_NAME}:latest"
            }
        }
    }
}
