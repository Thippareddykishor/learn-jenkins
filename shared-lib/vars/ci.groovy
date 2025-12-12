def call(){
    pipeline {
        stages {
            stage('static-code-analysis'){
                steps{
                    sh 'echo static'
                }
            }
            stage('unit test'){
                steps {
                    sh 'echo test'
                }
            }
            stage('build container image'){
                steps{
                    sh 'echo build'
                }
            }
            stage('push to ecr'){
                steps{
                    sh 'echo push'
                }
            }
        }
    }
}