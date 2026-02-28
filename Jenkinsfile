pipeline {
    agent any

    environment {
        SERVER = "ubuntu@172.31.246.219"
        DEPLOY_PATH = "/var/www/html"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy to Apache') {
            steps {
                sshagent(['apache-server-ssh']) {
                    sh '''
                    echo "Cleaning old files..."
                    ssh $SERVER "sudo rm -rf $DEPLOY_PATH/*"

                    echo "Copying new files..."
                    scp -o StrictHostKeyChecking=no -r * $SERVER:$DEPLOY_PATH/

                    echo "Restarting Apache..."
                    ssh $SERVER "sudo systemctl restart apache2"

                    echo "Deployment Done"
                    '''
                }
            }
        }
    }
}