pipeline {
  agent any
  stages {
    stage('error') {
      steps {
        parallel(
          "integration test": {
            sh 'chef exec rspec --color -fd'
            
          },
          "unit test": {
            sh '''kitchen converge
kitchen verify'''
            
          }
        )
      }
    }
  }
  environment {
    test = ''
  }
}