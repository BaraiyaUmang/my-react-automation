pipeline {
    agent any
    stages {
        stage('Pull Code') {
            steps {
                // This deletes everything in the workspace folder first
                deleteDir() 
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-react-app .'
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker stop react-container || true'
                    sh 'docker rm react-container || true'
                    // We use --network host to ensure you can see it on localhost:3000
                    sh 'docker run -d --name react-container --network host my-react-app'
                }
            }
        }
    }
}
