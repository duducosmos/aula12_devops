pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/seu-usuario/seu-repositorio.git'
        DOCKER_IMAGE_NAME = 'flask-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: "${GIT_REPO_URL}"
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE_NAME}", '.')
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE_NAME}").inside {
                        sh 'curl -s http://localhost:5000 | grep "Hello, World!"'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d -p 5000:5000 --name flask-app ${DOCKER_IMAGE_NAME}'
                }
            }
        }
    }
    post {
        always {
            sh 'docker stop flask-app || true'
            sh 'docker rm flask-app || true'
        }
    }
}
