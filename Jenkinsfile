pipeline {
  agent {
    label 'terraform-1.5'
  }
  parameters {    
    string(name: 'ACCOUNT_ID', defaultValue: '055974010211', description: 'eops-sandbox')
    booleanParam(name: 'FORCE_DESTROY', defaultValue: false, description: 'Forces the destruction of the provisioned infrastructure')
    booleanParam(name: 'RUN_VPC_EXAMPLE', defaultValue: false, description: 'Runs the VPC example (takes a long time to run)')
    
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
          terraform(accountId: params.ACCOUNT_ID, extraArgs: '-var="run_vpc_example='params.RUN_VPC_EXAMPLE'"', autoApprove: true, rootDir: 'examples/aws/1.5')
        }        
      }
    }
    stage('Destroy') {
      steps {
        script {
          terraform(accountId: params.ACCOUNT_ID, extraArgs: '-var="run_vpc_example='params.RUN_VPC_EXAMPLE'"', autoApprove: true, destroy: true, rootDir: 'examples/aws/1.5')
        }        
      }
    }
  }
}