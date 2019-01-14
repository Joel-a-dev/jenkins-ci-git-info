// start - Auxiliary functions

def getCommitSha(){
    return sh(returnStdout: true, script: "git rev-parse HEAD")
}

def getCommitTimestamp(COMMIT_SHA){
 return sh(returnStdout: true, script: "git log --date=iso8601 --format='%cd' -1 ${COMMIT_SHA}")
}

// end - Auxiliary fuctions

pipeline {
    agent none

    environment {

        INIT_GENERATOR_SCRIPT='generate-init-py.sh'
        GIT_COMMIT = getCommitSha()
        GIT_TIMESTAMP = getCommitTimestamp('GIT_COMMIT')
    }

    options {
    }
    
    stages {
        stage('Test') {
                steps {
                    sh "bash ${INIT_GENERATOR_SCRIPT}"
                }
            }
        }
    }
    
    post {
        always {
                deleteDir()
        }
    }
}