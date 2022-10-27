pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
    environment {
        registry = '270488249115.dkr.ecr.us-east-1.amazonaws.com/geolocation_ecr_rep'
        registryCredential = 'jenkins-ecr'
        dockerimage = '' 
    }
    stages {
        stage('Checkout'){
            steps{
                git branch: 'master', url: 'https://github.com/dagzi/geolocation-ecr-eks.git'
            }
        }
        stage('Code Build') {
            steps {
                sh "mvn clean"
            }
        }
        stage('Test') {
            steps {
                sh 'make check || true'
            }
        }
        // Building Docker images
        stage('Building image') {
            agent any
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER "
                }
            }
        }
        // Uploading Docker images into AWS ECR
        stage('Pushing to ECR') {
            agent any
            steps{
                script {
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 270488249115.dkr.ecr.us-east-1.amazonaws.com'
                    sh 'docker push 270488249115.dkr.ecr.us-east-1.amazonaws.com/geolocation_ecr_rep:latest'
                }
            }
        }
    }
}