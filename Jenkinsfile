pipeline {
  agent { label 'terraform' }
  environment {
    KUBECONFIG_CRED_ID = 'k3s-kubeconfig'
    TF_CLI_ARGS = "-no-color"
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
            terraform plan -var="kubeconfig=$KUBECONFIG_PATH"
          '''
        }
      }
    }
    stage('Manual approval') {
      steps {
        input message: 'Czy zatwierdzasz apply?', ok: 'Tak, jedziemy!'
      }
    }
    stage('Terraform apply') {
      steps {
        sh 'terraform apply -no-color -auto-approve -var="kubeconfig=$KUBECONFIG_PATH"'
      }
    }
  }
}
