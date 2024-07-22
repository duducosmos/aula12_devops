pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo 'Clonando o repositório...'
                git url: 'https://github.com/duducosmos/aula12_devops.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                echo 'Construindo a imagem Docker...'
                sh 'docker build -t flask-app .'
            }
        }
        stage('Test') {
            steps {
                echo 'Executando os testes...'
                // Adicione aqui seus comandos de teste
                
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy da aplicação...'
                // Remove qualquer container existente antes de rodar um novo
                sh 'docker ps -q --filter "ancestor=flask-app" | xargs -r docker stop'
                sh 'docker ps -q --filter "ancestor=flask-app" | xargs -r docker rm'
                
                // Executa a aplicação
                sh 'docker run -d -p 5000:5000 flask-app'
            }
        }
    }
}
