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

                sh 'gcloud run deploy nginx --image nginx --allow-unauthenticated --region=asia-southeast1'
            }
        }
    }
}
