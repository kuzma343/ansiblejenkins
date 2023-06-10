// groovy Jenkinsfile
properties([
    disableConcurrentBuilds()
])

pipeline {
    agent {
        label ''
    }

    environment {
       
        DOCKER_IMAGE = 'ansible'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DockerHub-Credentials') {
                        // Build Docker image
                        sh 'docker build -t $DOCKER_IMAGE .'
                    }
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    // Tag Docker image
                    sh "docker tag $DOCKER_IMAGE:latest kuzma343/ansible:latest"
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
                    // Run Docker container
                    sh 'docker run -it $DOCKER_IMAGE /bin/ban'
                }
            }
        }
    }
}
