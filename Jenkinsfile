pipeline {
  agent any

  stages {
    stage('Code') {
      steps {
        git url: 'https://github.com/', branch: 'master'
      }
    }
stage('Build and Test'){
            steps{
                sh 'docker build . -t suhas1116/node-app:latest'
            }
        }
        stage('Push'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	     sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                 sh 'docker push suhas1116/node-app:latest'
                }
            }
        }


    stage('Deploy') {
      steps {
        sh "docker-compose down && docker-compose up -d"
      }
    }
  }
}