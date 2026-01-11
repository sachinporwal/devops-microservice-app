pipeline {
    agent any

    stages {
        stage("Checkout") {
            steps {
                git branch: "develop", url: "https://github.com/sachinporwal/devops-microservice-app.git"
            }
        }

        stage("Build and Push") {
          steps {
            withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
              sh """
              docker build -t $USER/microservice:latest .
              echo $PASS | docker login -u $USER --password-stdin
              docker push $USER/microservice:latest
              """
           }
         }
        }


        stage("Run Tests") {
            steps {
                sh "docker run --rm microservice:ci pytest app/tests"
            }
        }
    }
}
