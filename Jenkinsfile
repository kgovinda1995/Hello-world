pipeline{
    agent  any
    stages{
        stage('git clone'){
            steps{
                sh 'rm -r Hello-world'
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
                 sh 'scp  /home/jenkins/workspace/hello-world/target/*.jar jenkins@172.31.28.16:/home/jenkins/'
              }
            }
        }
    agent { label 'docker'}
        stage('Docker'){
            steps{
                sh 'docker build -t hello:1.0 .'
                sh 'docker run -itd hello -p 8000:80 -i hello:.1.0'
            }
        }
    }
}

