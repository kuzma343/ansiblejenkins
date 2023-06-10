// groovy Jenkinsfile
properties([
    disableConcurrentBuilds()
])

pipeline {
    agent {
        label ''
    }


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

        stage("Docker login") {
            steps {
                echo "============= Docker login ================"
                withCredentials([usernamePassword(credentialsId: 'DockerHub-Credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '''
                    docker login -u $USERNAME -p $PASSWORD
                    '''
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
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
