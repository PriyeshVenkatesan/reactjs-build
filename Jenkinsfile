pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "priyeshshinav/public-dev-guvi"
        DOCKER_CREDENTIALS_ID = "dockerhub"
        REGISTRY_URL = "registry.hub.docker.com"
    }
    stages {
        stage('Build') {
            steps {
                sh '''# Running Build.sh Script to build 
                      ./build.sh ${BUILD_NUMBER}'''
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to the registry
                    docker.withRegistry("https://${REGISTRY_URL}", "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${DOCKER_IMAGE}:${BUILD_NUMBER}").push()
                        // Optionally, push the 'latest' tag as well
                        docker.image("${DOCKER_IMAGE}:${BUILD_NUMBER}").push('latest')
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh '''# Running Deploy.sh Script to deploy
                      ./deploy.sh'''
            }
        }
    }
}
