pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                // Wipes the workspace to prevent Git 'not in a directory' errors
                deleteDir() 
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Builds your image using the Dockerfile we just fixed
                sh 'docker build -t my-react-app .'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Stop and remove old versions so the name 'react-container' is free
                    sh 'docker stop react-container || true'
                    sh 'docker rm react-container || true'
                    
                    // Run the container mapping the Vite port 5173
                    sh 'docker run -d --name react-container -p 5173:5173 my-react-app'
                }
            }
        }
    }
}
