pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                git branch: 'main', url: 'https://github.com/rdx289/Learn01.git'
            }
        }

        stage('Deploy to Webserver') {
            steps {
                sshPublisher(publishers: [
                    sshPublisherDesc(
                        configName: 'WebServer',
                        transfers: [
                            sshTransfer(
                                sourceFiles: '**/*',
                                removePrefix: '',
                                remoteDirectory: '/var/www/html',
                                execCommand: 'sudo systemctl restart apache2'
                            )
                        ]
                    )
                ])
            }
        }
    }
}
