pipeline {
    agent any
    parameters {
        string(name: 'IMAGE_BUILD_TAG', defaultValue: latest, description: 'Docker image ')
        //tring(name: 'REGISTRY_URL', defaultValue: 'your-registry-url', description: 'Docker registry URL')
        //credentials(name: 'DOCKER_CREDENTIALS_ID', defaultValue: 'your-credentials-id', description: 'Credentials for Docker registry')
    }
    stages {
        stage('Build & Push to Docker hub') {
            steps {
                sh '''# Running Build.sh Script to build and push in to public dockerHub
                      ./build.sh ${params.IMAGE_BUILD_TAG}'''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test steps here
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Add your deploy steps here
            }
        }
    }
}
