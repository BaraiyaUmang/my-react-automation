pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                // Cleans up any leftover files from previous failed builds
                deleteDir()
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the image using the Dockerfile in your folder
                sh 'docker build -t my-react-app .'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // 1. Force stop and remove the old container so the name is free
                    sh 'docker stop react-container || true'
                    sh 'docker rm react-container || true'
                    
                    // 2. Start the new container on port 5173
                    sh 'docker run -d --name react-container -p 5173:5173 my-react-app'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Deployment successful! Visit http://localhost:5173'
        }
        failure {
            echo 'Build failed. Check the console output above for errors.'
        }
    }
}
