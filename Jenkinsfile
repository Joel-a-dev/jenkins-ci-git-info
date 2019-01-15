def getCommit(){
    return sh(returnStdout: true, script: "git rev-parse HEAD").trim()
}

def getBuildTimestamp(){
    return sh(returnStdout: true, script: "date +'%Y-%m-%dT%H:%M:%SZ'").trim()
}

def getVersion(){
    sh(script: "git fetch --tags")
    return sh(returnStdout: true, script: "git describe --tags --abbrev=0").toString().trim()
}

pipeline {
  agent any

  environment {
      INIT_GENERATOR_SCRIPT='generate-init-py.sh'
      GIT_COMMIT = getCommit()
      BUILD_TIMESTAMP = getBuildTimestamp()
      TAGGED_VERSION= getVersion()
    }

  stages {
    stage("Test") {
      steps {
      
        sh "bash ${INIT_GENERATOR_SCRIPT}"
        echo sh(returnStdout: true, script: 'env')
        //echo "::::::::::::::::::::::"
        //echo "GIT COMMIT MANUAL ::: ${GIT_COMMIT_MANUAL}"
        echo "::::::::::::::::::::::"
        echo "GIT COMMIT ::: ${env.GIT_COMMIT}"
        echo "::::::::::::::::::::::"
        echo "GIT COMMIT ::: ${GIT_COMMIT}"
        echo "::::::::::::::::::::::"
        echo "BUILD TIMESTMAP ::: ${BUILD_TIMESTAMP}"
        echo "::::::::::::::::::::::"
        echo "LATEST TAG VERSION ::: ${TAGGED_VERSION}"
        echo "::::::::::::::::::::::"
        echo "CONTENTS OF GENERATED ___init.py___"
        echo "::::::::::::::::::::::"
        sh "cat api_server/___init___.py"
        echo "::::::::::::::::::::::"
        echo "Original Date ${BUILD_TIMESTAMP}"
        sh "echo Date conversion :: \$(git rev-parse HEAD | head -c 7)-\$(date -d${BUILD_TIMESTAMP} +'%Y%m%d%H%M%S')"
        sh "echo TEST SMTH      \$(${GIT_COMMIT} | head -c 7)-\$(date -d${BUILD_TIMESTAMP} +'%Y%m%d%H%M%S')  > .docker.tag" 
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
      }
    }
  }

  // All Stages and Pipeline can each have their own post section that is executed at different times
  post {
    always {
      echo "Pipeline is done"
      //delete_dir()
    }
  }
}