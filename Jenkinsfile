node {
    def remote = [:]
    remote.name = 'EC2_Instance'
    remote.host = '18.141.164.40' // Replace with your EC2 instance IP
    remote.user = 'ec2-user' // Replace with your EC2 instance user
    // remote.identityFile = credentials('EC2_SSH_KEY_ID') // Replace with your Jenkins credential ID for the EC2 SSH key
    remote.allowAnyHosts = true
    
    stage('Connect to EC2') {
        sshCommand remote: remote, command: '''
            yum update -y
            sudo amazon-linux-extras install docker -y
            sudo service docker start
            sudo usermod -aG docker ec2-user
        '''
    }
    
    stage('Install and Pull Docker Image') {
        sshCommand remote: remote, command: '''
            docker pull postgres:latest
        '''
    }
}
