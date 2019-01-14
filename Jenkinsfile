def getCommitSha(){
    return sh(returnStdout: true, script: "git rev-parse HEAD").trim()
}

def getBuildTimestamp(COMMIT_SHA){
    return sh(returnStdout: true, script: "git log --date=iso8601 --format='%cd' -1 ${COMMIT_SHA}").trim()
}

def getLatestReleaseTag(){
    sh(script: "git fetch --tags")
    return sh(returnStdout: true, script: "git describe --tags").toString().trim()
}

pipeline {
  agent any

  

  environment {

      INIT_GENERATOR_SCRIPT='generate-init-py.sh'
      GIT_COMMIT = getCommitSha()
      BUILD_TIMESTAMP = getBuildTimestamp(GIT_COMMIT)
      TAGGED_VERSION= getLatestReleaseTag()
    }

  stages {
    stage("Test") {
      steps {
        sh "git fetch --tags"

        sh "echo \$SHELL"
        //sh "echo \$(git rev-parse HEAD | head -c 7)-\$(date +%Y%m%d%H%M%S)"
        //sh "\$(git rev-list --tags --max-count=1)"
      
        sh "bash ${INIT_GENERATOR_SCRIPT}"

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