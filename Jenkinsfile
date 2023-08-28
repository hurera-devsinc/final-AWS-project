node {
    stage('Update EC2') {
        def remoteCommands = '''
            docker pull postgres
            docker pull hureradevsinc/aws-project
            echo "Pipeline successful."
        '''

        withCredentials([sshUserPrivateKey(credentialsId: 'jenkinsEC2privatekey', keyFileVariable: 'KEY_FILE')]) {
            writeFile text: remoteCommands, file: 'remote_commands.sh'
            sh "chmod +x remote_commands.sh"
            sh "ssh -o StrictHostKeyChecking=no -i ${KEY_FILE} ec2-user@54.251.164.47 'bash -s' < remote_commands.sh"
        }
    }
}
