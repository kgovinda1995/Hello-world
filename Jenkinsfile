pipeline{
    agent  any
    stages{
        stage('git clone'){
            steps{
                sh 'git clone  https://github.com/kgovinda1995/Hello-world.git'
            }
        }
        stage('maven build'){
            steps{
                sh'mvn clean install'
            }
        }
        stage('copy build'){
            steps{
                sshagent(credentials: ['docker'], ignoreMissing: true) {
                 sh 'ssh -o StrictHostKeyChecking=no jenkins@172.31.28.16'
                 sh 'scp  /home/jenkins/workspace/hello-world/target/*.jar jenkins@172.31.28.16:/home/jenkins/workspace/helloworld'
              }
            }
        }
    }
}








https://www.sonarsource.com/products/sonarqube/downloads/success-download-community-edition/