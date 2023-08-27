pipeline {
    agent any

    stages {
        stage('Update EC2') {
            steps {
                script {
                    sshagent(credentials: ['jenkinsEC2privatekey']) {
                        def remoteCommands = '''
                            sudo yum update -y
                            echo "Commands completed."
                        '''

                        sh "ssh -o StrictHostKeyChecking=no ec2-user@18.141.164.40 << EOF\n${remoteCommands}\nEOF"
                    }
                }
            }
        }
    }
}
