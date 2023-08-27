node {
    stage('Update EC2') {
        def remoteCommands = '''
            sudo yum update -y
            echo "Commands completed."
        '''

        def remoteCommandsFile  // Define the variable outside the withCredentials block
        
        withCredentials([sshUserPrivateKey(credentialsId: 'jenkinsEC2privatekey', keyFileVariable: 'KEY_FILE')]) {
            remoteCommandsFile = writeFile text: remoteCommands, file: 'remote_commands.sh'
            sshagent(['jenkinsEC2privatekey']) {
                sh "chmod +x ${remoteCommandsFile}"
                sh "ssh -o StrictHostKeyChecking=no -i ${KEY_FILE} ec2-user@18.141.164.40 'bash -s' < ${remoteCommandsFile}"
            }
        }

        echo "Remote commands file: ${remoteCommandsFile}"  // Just for debugging, remove this line later
    }
}
