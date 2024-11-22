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
                    gcp_set_region.call ''
                }
            }
        }
    }
}
