pipeline {
  agent { label 'terraform' }
  environment {
    KUBECONFIG_CRED_ID = 'k3s-kubeconfig'
  }
  stages {
    stage('Debug shell') {
  steps {
    sh 'echo $PATH'
    sh 'which terraform || echo "BRAK terraform"'
    sh 'ls -l /usr/local/bin/terraform || echo "nie ma /usr/local/bin/terraform"'
    sh 'whoami'
    sh 'env'
  }
}
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
