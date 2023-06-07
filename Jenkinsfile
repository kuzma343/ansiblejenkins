pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.image('docker').withRun('-it', 'ansible') {
                        // Команда для збірки Docker образу
                        sh 'docker build -t ansible .'
                    }
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('docker').withRun('-it', 'ansible') {
                        // Команда для запуску Docker контейнера
                        sh 'docker run -it ansible'
                    }
                }
            }
        }
    }
}
