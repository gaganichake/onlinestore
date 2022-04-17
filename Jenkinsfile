pipeline {
  agent { dockerfile true }
  stages {
    stage('Build') {
      steps {
        sh '''docker build -t onlinestore/product:SNAPSHOT-0.1.0 .

docker stop product�

rm -f product'''
      }
    }

  }
}
