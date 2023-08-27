node {
    stage('Update EC2') {
        def remoteCommands = '''
            sudo yum update -y
            echo "Commands completed."
        '''

        withCredentials([sshUserPrivateKey(credentialsId: 'jenkinsEC2privatekey', keyFileVariable: 'KEY_FILE')]) {
            sshagent(['jenkinsEC2privatekey']) {
                def remoteCommandsFile = writeFile text: remoteCommands, file: 'remote_commands.sh'
                sh "chmod +x ${remoteCommandsFile}"
                sh "ssh -o StrictHostKeyChecking=no -i ${KEY_FILE} ec2-user@18.141.164.40 'bash -s' < ${remoteCommandsFile}"
            }
        }
    }
}
