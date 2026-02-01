pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Jenkins automatically pulls code from your GitHub repo
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                // Build your React Docker image
                sh 'docker build -t my-react-app .'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // 1. Stop the old container if it exists (so port 3000 is free)
                    sh 'docker stop react-container || true'
                    sh 'docker rm react-container || true'
                    
                    // 2. Run the new container
                    sh 'docker run -d -p 3000:3000 --name react-container my-react-app'
                }
            }
        }
    }
}
