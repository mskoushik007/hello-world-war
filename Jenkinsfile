pipeline {
  agent {label 'dockerbuildnode'}
  stages {
    stage ('my build') {
      steps {
        sh "echo ${BUILD_VERSION}"
        sh "docker build -t mytomcat ."
        sh 'helm package ./helm/tomcat --version=${BUILD_VERSION}'
      }
    }
    stage ('publish stage') {
      steps {
         sh "echo ${BUILD_VERSION}"
         withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {      
         sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
         sh 'docker tag mytomcat mskoushik007/tomcat:${BUILD_VERSION}'
         sh 'docker push mskoushik007/tomcat:${BUILD_VERSION}'
           
         sh 'curl -umskoushikshivanna@gmail.com:4AD14me411 -T tomcat-${BUILD_VERSION}.tgz \"https://helmjfrog.jfrog.io/artifactory/helm/tomcat-${BUILD_VERSION}.tgz\"'
         }
      }
    }
    stage ('my deploy') {
      agent {label 'dockerdeploynode'}
      steps {
        sh 'helm repo add helm https://helmjfrog.jfrog.io/artifactory/api/helm/helm --username mskoushikshivanna@gmail.com --password 4AD14me411@'
        sh 'helm repo update'
        sh 'helm repo list'
        sh 'helm upgrade --install mytomcat helm/tomcat --version=${BUILD_VERSION} --set selector_label=tomcat --set deployment_name=tomcat --set replicas=2 --set registry_name=ebenneelpinto --set docker_repo_name=tomcat --set image_tag=${BUILD_VERSION} --set port_name=tomcat --set target_port=8080 --set port=8080'
      }
    } 
  }
}
