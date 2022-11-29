pipeline {
  agent {label 'thirdnode'}
  stages {
    stage ('my build') {
      steps {
        sh 'mvn package'
        sh 'pwd'
        sh 'ls'
      }
    }
    stage ('my deploy') {
      steps {
        sh 'sudo cp -R /home/slave/workspace/declarative pipeline/target/hello-world-war-1.0.0.war /opt/tomcat/webapps'
        sh 'sudo sh /opt/tomcat/apache-tomcat-10.0.27/bin/shutdown.sh'
        sh 'sleep 3'
        sh 'sudo sh /opt/tomcat/apache-tomcat-10.0.27/bin/startup.sh'
        sh 'ls'
      }
    }
  }
}
