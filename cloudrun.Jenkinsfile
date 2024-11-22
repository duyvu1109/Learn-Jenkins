@Library('SharedLibraries') _

pipeline {
    agent {
        node {
            label ""
        }
    }
    stages {
        stage ('Init') {
            steps {
                script {
                    gcp.set_region()
                }
            }
        }
    }
}
