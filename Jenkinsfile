node {
    stage('Update EC2') {
        def remoteCommands = '''
            docker pull hureradevsinc/aws-project:latest
            echo "Pipeline successful."
        '''

        withCredentials([sshUserPrivateKey(credentialsId: 'jenkinsEC2privatekey', keyFileVariable: 'KEY_FILE')]) {
            writeFile text: remoteCommands, file: 'remote_commands.sh'
            sh "chmod +x remote_commands.sh"
            sh "ssh -o StrictHostKeyChecking=no -i ${KEY_FILE} ec2-user@18.141.139.185 'bash -s' < remote_commands.sh"
        }
    }
}
