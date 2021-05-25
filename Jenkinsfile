pipeline {
  agent any
  environment {
    DOCKER_USERNAME = credentials('docker-hub-username')
    DOCKER_PASSWORD = credentials('docker-hub-password')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t $DOCKER_USERNAME/goviolin .'
      }
    }
    stage('Docherhub Login') {
      steps {
        sh 'docker login --username $DOCKER_USERNAME --password $DOCKER_PASSWORD'
      }
    }
    stage('Push to the registry') {
      steps {
        sh 'docker push $DOCKER_USERNAME/goviolin'
      }
    }
    stage('Release the image') {
      steps {
        sh 'helm install --set app.image=$DOCKER_USERNAME/goviolin  goviolin-${env.BUILD_ID} helm-chart/'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
      deleteDir()
    }
    success {
      sh 'echo success'
    }
    failure {
      sh 'ehco fail'
    }
  }
}