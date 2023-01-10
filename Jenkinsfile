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
         withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {      
         sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
         sh 'docker tag mytomcat mskoushik007/tomcat:${BUILD_VERSION}'
         sh 'docker push mskoushik007/tomcat:${BUILD_VERSION}'
         }
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
