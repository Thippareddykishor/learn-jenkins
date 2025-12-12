pipeline {
    agent {label ''}

parameters{
    string(name: 'Person', defaultValue: 'test', description: 'who am i')
    text(name: 'BIOGRAPHY', defaultValue: '', description: 'who am i')
    booleanParam(name: 'TOGGLE', defaultValue: 'true', description: 'who am i')
    choice(name: 'CHOICE', choices:['one','two','three'])
    password(name: 'PASSWORD', defaultValue: 'SECRET',description:'enter password')

}

stages{
    stage('checkout'){
        steps{
            sh 'echo hellp'
        }
    }
    stage('Example'){
        input{
            message "should we continue"
            OK "yes we should"
            parameters{
                string(name: 'PERSON')
            }
        }
        steps{
            echo "Hello ${PERSON}"
        }
    }
}
post {
    always {
        cleanWs()
    }
}
}