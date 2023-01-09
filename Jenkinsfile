pipeline {
  agent {label 'dockerbuildnode'}
  stages {
    stage ('my build') {
      steps {
        sh "echo ${BUILD_VERSION}"
        sh "docker build -t mytomcat ."
      }
    }
    stage ('publish stage') {
      steps {
        sh "echo ${BUILD_VERSION}"
        sh 'docker login -u mskoushik007 -p 4ad14me411'
        sh 'docker tag mytomcat mskoushik007/tomcat:${BUILD_VERSION}'
        sh 'docker push mskoushik007/tomcat:${BUILD_VERSION}'
      }
    }
    stage ('my deploy') {
      agent {label 'dockerdeploynode'}
      steps {
        sh 'docker pull mskoushik007/tomcat:${BUILD_VERSION}'
        sh 'docker rm -f mytomcat'
        sh 'docker run -d -p 9090:8080 --name mscontainer mskoushik007/tomcat:${BUILD_VERSION}'
      }
    } 
  }
}
