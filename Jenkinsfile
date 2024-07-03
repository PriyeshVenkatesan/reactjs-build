pipeline {
    agent any
    
    stages {
        stage('Build & Push to Docker hub') {
            steps {
                sh '''# Running Build.sh Script to build and push in to public dockerHub
                      ./build.sh "${env.BUILD_NUMBER}"'''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test steps here
                // add also step here
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
