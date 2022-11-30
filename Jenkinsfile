pipeline {
  agent {label 'build-slave'}
  stages {
    stage ('my build') {
     steps {
        sh 'mvn package'
        sh 'whoami'
        sh 'scp -R target/hello-world-war-1.0.0.war koushik@172.31.3.80:/opt/tomcat/webapps'
        sh 'pwd'
        sh 'ls'
      }
    }
    
    stage ('my deploy') {
     agent {label 'deploynode'} 
      steps {
        sh 'pwd'
        sh 'whoami'
        sh 'sudo sh /opt/tomcat/bin/shutdown.sh'
        sh 'sleep 3'
        sh 'sudo sh /opt/tomcat/bin/startup.sh'
        sh 'ls'
      }
    }
  }
}
