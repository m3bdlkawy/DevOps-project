pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS-Credentials')   // Correct credentials name
        AWS_SECRET_ACCESS_KEY = credentials('AWS-Credentials')
        GITHUB_TOKEN          = credentials('github-token')
        DOCKER_IMAGE          = "m3bdlkawy/depi-project"
    }

    options {
        retry(1)
        timestamps()
    }

    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'github-token', branch: 'master', url: 'https://github.com/Mahmoudshookry/DevOps-Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }

        /*
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        dockerImage.push("${env.BUILD_NUMBER}")
                        dockerImage.push("latest")
                    }
                }
            }
        }
        */

        stage('Terraform Init & Apply') {
            steps {
                dir('aws-k8s-terraform') {
                    script {
                        sh 'terraform init && terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Wait for EC2 Initialization') {
            steps {
                script {
                    echo "Waiting for EC2 initialization..."
                    sleep(time: 120, unit: 'SECONDS')
                }
            }
        }

        stage('Run Ansible Playbook for Infrastructure Setup') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'private-key', keyFileVariable: 'SSH_KEY_PATH', usernameVariable: 'SSH_USER')]) {
                    dir('ansible') {
                        script {
                            sh """
                            ansible-playbook -i inventory_aws_ec2.yaml playbook.yml \
                            --private-key $SSH_KEY_PATH \
                            -u $SSH_USER
                            """
                        }
                    }
                }
            }
        }

        stage('Run Ansible Playbook for Helm Deployment') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'private-key', keyFileVariable: 'SSH_KEY_PATH', usernameVariable: 'SSH_USER')]) {
                    dir('ansible') {
                        script {
                            sh """
                            ansible-playbook -i inventory_aws_ec2.yaml helm-playbook.yaml \
                            --private-key $SSH_KEY_PATH \
                            -u $SSH_USER
                            """
                        }
                    }
                }
            }
        }

        stage('Run Ansible Playbook for Monitoring Stack Deployment') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'private-key', keyFileVariable: 'SSH_KEY_PATH', usernameVariable: 'SSH_USER')]) {
                    dir('ansible') {
                        script {
                            sh """
                            ansible-playbook -i inventory_aws_ec2.yaml monitoring-playbook.yaml \
                            --private-key $SSH_KEY_PATH \
                            -u $SSH_USER
                            """
                        }
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
