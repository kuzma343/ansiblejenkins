pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.image('docker').withRun('-d', 'ansible') {
                        // Команда для збірки Docker образу
                        sh 'docker build -t ansible .'
                    }
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('docker').withRun('-d', 'ansible') {
                        // Команда для запуску Docker контейнера
                        sh 'docker run -d ansible'
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
    }
    
}
