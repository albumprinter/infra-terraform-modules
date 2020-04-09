pipeline {
  agent {
    label 'terraform-0.12'
  }
  parameters {    
    string(name: 'ACCOUNT_ID', defaultValue: '055974010211', description: 'eops-sandbox')
    booleanParam(name: 'FORCE_DESTROY', defaultValue: false, description: 'Forces the destruction of the provisioned infrastructure')
    
  }
  stages {
    stage('Apply') {
      steps {
        script {
          terraform(accountId: params.ACCOUNT_ID, destroy: params.FORCE_DESTROY, rootDir: 'examples/aws')
        }        
      }
    }
    stage('Destroy') {
      steps {
        script {
          terraform(accountId: params.ACCOUNT_ID, destroy: true, rootDir: 'examples/aws')
        }        
      }
    }
  }
}