pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Команда docker build
                    sh 'docker build -t ansible .'
                }
            }
        }
        
        stage('Run') {
            steps {
                script {
                    // Команда docker run
                    sh 'docker run -d ansible'
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
