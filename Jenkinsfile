pipeline {
  agent { label 'terraform' }
  environment {
    KUBECONFIG_CRED_ID = 'k3s-kubeconfig'
  }
  stages {
    stage('Terraform Init & Apply') {
      steps {
        withCredentials([file(credentialsId: env.KUBECONFIG_CRED_ID, variable: 'KUBECONFIG_PATH')]) {
          sh '''
            terraform init
            terraform apply -auto-approve -var="kubeconfig=$KUBECONFIG_PATH"
          '''
        }
      }
    }
  }
}
