pipeline {
    agent any

    stages {
        stage("Checkout") {
            steps {
                git branch: "develop", url: "https://github.com/sachinporwal/devops-microservice-app.git"
            }
        }

        stage("Run Tests") {
            steps {
                sh """
                cd app
                python3 -m venv venv
                ./venv/bin/pip install -r requirements.txt
                ./venv/bin/pytest
                """
            }
        }

        stage("Build Docker Image") {
            steps {
                sh "docker build -t microservice:latest ."
            }
        }
    }
}
