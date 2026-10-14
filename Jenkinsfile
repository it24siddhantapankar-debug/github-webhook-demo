pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Verify') {
            steps {
                bat 'build.bat'
            }
        }
    }

    post {
        success {
            echo 'SUCCESS: GitHub webhook-triggered pipeline completed.'
        }
        failure {
            echo 'FAILURE: Check the Jenkins Console Output for details.'
        }
    }
}
