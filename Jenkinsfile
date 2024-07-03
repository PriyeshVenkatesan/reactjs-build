pipeline {
    agent any
    stages {
        stage('Build & Push to Docker hub') {
            steps {
                sh '''# Running Build.sh Script to build and push in to public dockerHub
                      ./build.sh 1.5'''
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
