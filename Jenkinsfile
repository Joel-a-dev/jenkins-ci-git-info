/* def getCommit(){
    return sh(returnStdout: true, script: "git rev-parse HEAD").trim()
}

def getBuildTimestamp(){
    return sh(returnStdout: true, script: "date +'%Y-%m-%dT%H:%M:%SZ'").trim()
}

def getVersion(){
    sh(script: "git fetch --tags")
    return sh(returnStdout: true, script: "git describe --tags --abbrev=0").toString().trim()
}
 */

 def run_bandit_test(){
  
  result = sh(returnStatus: true, script: "/usr/local/bin/bandit -r -f html -o bandit.report.html .")
  
  sh(returnStdout: true,script: "cat bandit.report.html")
  //if(result !=0){

      

    //error("Failed Bandit Test")
    //}
  }

  def cleanDocker(){
    sh "echo WIP"
  }

pipeline {
  agent any

  environment {
      INIT_GENERATOR_SCRIPT='generate-init-py.sh'
      DOCKER_SETUP_SCRIPT='mount_bandit.sh'
    }

  stages {
    stage("Test") {
      steps{
        sh "bash ${INIT_GENERATOR_SCRIPT}"
        //echo sh(returnStdout: true, script: 'env')
        //echo "::::::::::::::::::::::"
        //echo "GIT COMMIT MANUAL ::: ${GIT_COMMIT_MANUAL}"
        /* echo "::::::::::::::::::::::"
        echo "GIT COMMIT ::: ${env.GIT_COMMIT}"
        echo "::::::::::::::::::::::"
        echo "GIT COMMIT ::: ${GIT_COMMIT}"
        echo "::::::::::::::::::::::"
        echo "BUILD TIMESTMAP ::: ${BUILD_TIMESTAMP}"
        echo "::::::::::::::::::::::"
        echo "LAbandit -r -f html -o bandit.report.html .TEST TAG VERSION ::: ${TAGGED_VERSION}"
        echo "::::::::::::::::::::::"
        echo "CONTENTS OF GENERATED ___init.py___" */
        /* echo "::::::::::::::::::::::" 
        sh "cat api_server/___init___.py"
        echo "::::::::::::::::::::::" */
       /*  echo "Original Date ${BUILD_TIMESTAMP}"
        sh "echo Date conversion :: \$(git rev-parse HEAD | head -c 7)-\$(date -d${BUILD_TIMESTAMP} +'%Y%m%d%H%M%S')"
        sh "echo TEST SMTH \$(echo ${GIT_COMMIT} | head -c 7)-\$(date -d${BUILD_TIMESTAMP} +'%Y%m%d%H%M%S')"  */
      }
    }
      stage("Tests-inside-docker") {
        steps {
          sh "bash ${DOCKER_SETUP_SCRIPT}"

          if (fileExists('shared/bandit.report.html')) {
            BANDIT_RESULT='FAILED'
            publishHTML (target: [
              allowMissing: false,
              alwaysLinkToLastBuild: false,
              keepAll: true,
              reportDir: 'results',
              reportFiles: 'shared/bandit.report.html',
              reportName: "Bandit Report"
            ])
          }

        }
      }
  }
  // Post in Stage executes at the end of Stage instead of end of Pipeline
  post {
    failure {
      echo "Stage FAILED"
    }
    success {
      echo "Stage was Successful"
    }
    unstable {
      echo "Stage is Unstable"
    }
    always {
      echo "Pipeline is done"
      deleteDir()
      cleanDocker()
    }
  }
}
