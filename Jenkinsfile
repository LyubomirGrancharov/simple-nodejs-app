pipeline {
    agent any

    environment {
        PROJECT_ID = 'galvanic-cirrus-437510-m8' 
        REGION = ' europe-west3'
        REPOSITORY_NAME = 'test-repo' 
        IMAGE_NAME = 'nodejs-app' 
        CREDENTIALS_ID = 'gcloud-service-key' 
        IMAGE_TAG = "build-${env.BUILD_NUMBER}"

    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out repository...'
                checkout scm
            }
        }

        stage('Authenticate with Google Cloud') {
            steps {
                echo 'Authenticating with Google Cloud...'
                withCredentials([file(credentialsId: "${CREDENTIALS_ID}", variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                    sh 'gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS'
                    sh 'gcloud config set project $PROJECT_ID'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    sh "docker build -t $REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY_NAME/$IMAGE_NAME:$IMAGE_TAG ."
                }
            }
        }

        stage('Push Docker Image to Google Artifact Registry') {
            steps {
                echo 'Pushing Docker image to Google Artifact Registry...'
                script {
                    sh "gcloud auth configure-docker $REGION-docker.pkg.dev --quiet"
                    sh "docker push $REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY_NAME/$IMAGE_NAME:$IMAGE_TAG"
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up Docker images...'
            sh 'docker rmi $REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY_NAME/$IMAGE_NAME:$IMAGE_TAG || true'
        }
    }
}
