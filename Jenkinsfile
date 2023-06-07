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
        
        stage('Tag Docker Image') {
            steps {
                script {
                    // Команда для тегування Docker образу
                    sh 'docker tag ansible:latest kuzma343/ansible:latest'
                }
            }
        }
        
        stage('Docker Login and Push') {
            steps {
                script {
                    // Команда для входу в Docker та публікації образу
                    sh 'docker login'
                    sh 'docker push kuzma343/ansible:latest'
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    // Команда для запуску Docker контейнера з /bin/ban командою та передачею вхідного терміналу
                    sh 'docker run -it ansible /bin/ban'
                }
            }
        }
    }
}

