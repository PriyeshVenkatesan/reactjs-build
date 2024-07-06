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
        stage('Deploy Locally') {
            steps {
                sh '''# Running Deploy.sh Script to deploy
                      ./deploy.sh'''
            }
        }
      
         stage('Deploying to remote EC2') {
            steps {
                script {
                    // Deploying to Remote EC2 instance
                    sh 'echo "Deploying to Remote EC2 Instance"'
                    
                    // Terraform Init
                    sh 'terraform init'
                    // Terraform Validate
                    sh 'terraform validate'
                    // terraform plan
                    sh 'terraform plan -out=tfplan'
                    
                    // terraform apply
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        
         stage('Monitoring remote EC2') {
            steps {
                script {
                    // Sleep 45s
                    sh 'sleep 20s' 
                    // Monitoring EC2 instance
                    sh 'echo "Monitoring Remote EC2 Instance"'                    
                    // installing node exporter on remote instance
                    sh 'ansible-playbook Node_Exporter.yaml'
                    // installing blackbox exporter on remote instance
                    sh 'ansible-playbook BlackBox_Exporter.yaml'
		    // Configuring Prometheus 
                    sh 'ansible-playbook Promethusconfigchange.yaml'
                    // Configuring Prometheus restart
                    sh 'ansible-playbook promtheus-restart.yml'
                }
            }
        }




    }
        
    
}
