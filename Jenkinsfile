pipeline {
    agent any
    stages {
        stage('Cleanup & Checkout') {
            steps {
                // This clears the folder to make sure Git starts fresh
                deleteDir() 
                checkout scm
            }
        }
        stage('Build & Deploy') {
            steps {
                sh 'docker build -t my-react-app .'
                sh 'docker stop react-container || true'
                sh 'docker rm react-container || true'
                sh 'docker run -d -p 3000:3000 --name react-container my-react-app'
            }
        }
    }
}
