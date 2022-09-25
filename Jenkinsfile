pipeline {

    agent { label 'linux'}

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = "ap-southeast-2"
    }

    options {
        buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))
        timeout(time: 12, unit: 'HOURS')
        timestamps()
    }

    parameters {
        choice(name: 'ACTION',
            choices: ['APPLY' , 'DESTROY'],
            description: 'Choose the Action')
    }

    stages{
        stage ('source'){
            steps{
                cleanWs()
                git 'https://github.com/Prashanna313/fastapi-docker.git'
            }
        }

        stage ('setup'){
            steps{
                sh 'chmod +x ./scripts/jenkins_setup.sh'
                sh './scripts/jenkins_setup.sh'
            }
        }

        stage ('pythonTests'){
            when {
                expression { params.ACTION != 'DESTROY' }
            }

            steps{
                sh './venv/bin/pylint'
                sh './venv/bin/pytest'
            }
        }

        stage ('terraformInit'){
            steps{
                dir("${env.WORKSPACE}/terraform"){
                    sh 'terraform --version'
                    sh 'terraform init -backend-config=backend_env.conf'
                }
            }
        }

        stage ('terraformTests'){
            when {
                expression { params.ACTION != 'DESTROY' }
            }

            steps{
                dir("${env.WORKSPACE}/terraform"){
                    sh 'terraform --version'
                    sh 'terraform fmt'
                    sh 'terraform validate'
                }
            }
        }

        stage ('build'){
            when {
                expression { params.ACTION != 'DESTROY' }
            }

            steps{
                dir("${env.WORKSPACE}/terraform"){
                    sh 'terraform --version'
                    sh 'terraform plan -var-file="env.tfvars" -lock=true -out "planfile"'
                    archiveArtifacts artifacts: './planfile', followSymlinks: false
                }
            }
        }

        stage ('deploy'){
            when {
                expression { params.ACTION != 'DESTROY' }
            }

            steps{
                dir("${env.WORKSPACE}/terraform"){
                    input message: 'Confirm deployment...', ok: 'Deploy'
                    sh 'terraform apply -lock=true -input=false "planfile"'
                }
            }
        }

        stage ('destroy'){
            when {
                expression { params.ACTION == 'DESTROY' }
            }

            steps{
                dir("${env.WORKSPACE}/terraform"){
                    input message: 'Confirm destroy...', ok: 'Destroy'
                    sh 'terraform destroy -var-file="env.tfvars" -auto-approve'
                }
            }

        }

    post {
        always {
            echo 'Deleting workspace!'
            cleanWs()
            }
        }
    }
}