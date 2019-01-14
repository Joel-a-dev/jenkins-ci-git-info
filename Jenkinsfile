/* def getCommitSha(){
    return sh(returnStdout: true, script: "git rev-parse HEAD").trim()
} */

def getBuildTimestamp(){
    return sh(returnStdout: true, script: "date -u +'%Y-%m-%dT%H:%M:%SZ'").trim()
}

def getLatestReleaseTag(){
    sh(script: "git fetch --tags")
    return sh(returnStdout: true, script: "git describe --tags --abbrev=0").toString().trim()
}

pipeline {
  agent any

  environment {
      INIT_GENERATOR_SCRIPT='generate-init-py.sh'
      //GIT_COMMIT_MANUAL = getCommitSha()
      BUILD_TIMESTAMP = getBuildTimestamp()
      TAGGED_VERSION= getLatestReleaseTag()
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