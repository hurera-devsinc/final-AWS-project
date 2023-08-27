node {
    stage('Update EC2') {
        def remoteCommands = '''
            sudo yum update -y
            sudo yum install -y docker
            sudo systemctl start docker
            sudo systemctl enable docker
            sudo systemctl status docker
            sudo usermod -aG docker $USER
            newgrp docker
            docker pull postgres
            echo "Commands completed."
        '''

        withCredentials([sshUserPrivateKey(credentialsId: 'jenkinsEC2privatekey', keyFileVariable: 'KEY_FILE')]) {
            writeFile text: remoteCommands, file: 'remote_commands.sh'
            sh "chmod +x remote_commands.sh"
            sh "ssh -o StrictHostKeyChecking=no -i ${KEY_FILE} ec2-user@18.141.164.40 'bash -s' < remote_commands.sh"
        }
    }
}