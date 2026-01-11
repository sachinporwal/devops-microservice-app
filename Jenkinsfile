pipeline {
    agent any

    stages {
        stage("Checkout") {
            steps {
                git branch: "develop", url: "https://github.com/sachinporwal/devops-microservice-app.git"
            }
        }

        stage("Build Docker Image") {
            steps {
                sh "docker build -t microservice:ci ."
            }
        }

        stage("Run Tests Inside Container") {
            steps {
                sh """
                docker run --rm microservice:ci pytest
                """
            }
        }
    }
}
