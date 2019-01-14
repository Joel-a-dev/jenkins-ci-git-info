def getCommitSha(){
    return sh(returnStdout: true, script: "git rev-parse HEAD")
}

def getCommitTimestamp(COMMIT_SHA){
 return sh(returnStdout: true, script: "git log --date=iso8601 --format='%cd' -1 ${COMMIT_SHA}")
}

pipeline {
  agent any

  environment {

        INIT_GENERATOR_SCRIPT='generate-init-py.sh'
        GIT_COMMIT = getCommitSha()
        GIT_TIMESTAMP = getCommitTimestamp( GIT_COMMIT )
    }

  stages {
    stage("Test") {
      steps {
         sh "bash ${INIT_GENERATOR_SCRIPT}"

        echo "::::::::::::::::::::::"
        echo "GIT COMMIT ::: ${GIT_COMMIT}"
        echo "::::::::::::::::::::::"
        echo "GIT TIMESTMAP ::: ${GIT_TIMESTAMP}"
        rcho "::::::::::::::::::::::"
      }
      // Post in Stage executes at the end of Stage instead of end of Pipeline
      post {
        aborted {
          echo "Stage 'Hello' WAS ABORTED"
        }
        always {
          echo "Stage 'Hello' finished"
        }
        changed {
          echo "Stage HAVE CHANGED"
        }
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
    }
  }
}