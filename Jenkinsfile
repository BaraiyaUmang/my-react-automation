pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-react-app .'
            }
        }

        // --- REPLACE YOUR OLD DEPLOY STAGE WITH THIS ---
        stage('Deploy') {
            steps {
                script {
                    // This cleans up the old container so the name "react-container" is free
                    sh 'docker stop react-container || true'
                    sh 'docker rm react-container || true'
                    
                    // The --network host flag connects the app to your laptop's localhost
                    sh 'docker run -d --name react-container --network host my-react-app'
                }
            }
        }
        // -----------------------------------------------
    }
}
