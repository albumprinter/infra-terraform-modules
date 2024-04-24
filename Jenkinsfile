pipeline {
  agent {
    label 'terraform-1.5'
  }
  parameters {    
    string(name: 'ACCOUNT_ID', defaultValue: '055974010211', description: 'eops-sandbox')
    booleanParam(name: 'FORCE_DESTROY', defaultValue: false, description: 'Forces the destruction of the provisioned infrastructure')
    
  }
  options { 
    disableConcurrentBuilds()
    disableResume()
    timeout(time: 1, unit: 'HOURS')
  }
  stages {
    stage('Apply') {
      when {
        expression {
          return !params.FORCE_DESTROY
        }
      }
      steps {
        script {
          terraform(accountId: params.ACCOUNT_ID, autoApprove: true, rootDir: 'examples/aws/1.5')
        }        
      }
    }
    stage('Destroy') {
      steps {
        script {
          terraform(accountId: params.ACCOUNT_ID, autoApprove: true, destroy: true, rootDir: 'examples/aws/1.5')
        }        
      }
    }
  }
}