// @Library('SharedLibraries') _

// pipeline {
//     agent {
//         node {
//             label ""
//         }
//     }
//     stages {
//         stage ('Test') {
//             steps {
//                 script {
//                     simple.call 'Kai Nguyen'
//                 }
//             }
//         }
//     }
// }

pipeline {
    agent any
    // environment {
    //     CLOUDSDK_CORE_PROJECT='x:y'
    //     CLIENT_EMAIL='a@a.com'
    //     GCLOUD_CREDS=credentials('gcloud-creds')
    // }
    stages {
        stage('test') {
            steps {
                sh '''
                    echo "Test Jenkins with GCP"
                    gcloud version
                    gcloud run deploy nginx --image nginx
                '''
            }
        }
    }
}