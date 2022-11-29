pipeline {
  agent none
  stages {
    stage ('my build') {
      agent {label 'thirdnode'}
      steps {
        sh 'mvn package'
        sh 'pwd'
        sh 'ls'
      }
    }
  }
}
