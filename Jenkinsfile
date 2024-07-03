pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh '''# Running Build.sh Script to build 
                      ./build.sh ${BUILD_NUMBER}'''
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
