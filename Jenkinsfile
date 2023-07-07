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
                 sh 'scp  /home/jenkins/workspace/hello-world/target/*.jar jenkins@172.31.28.16:/home/jenkins/workspace/'
              }
            }
        }
        stage ('delete'){
            steps{
            sh 'rm -rf hello-world@tmp hello-world'

           }
        }
           
    
        stage('Docker'){
            agent { label 'docker'}
            steps{
                sh 'docker rmi ${docker images -aq}'
                sh 'docker container rm -f ${docker ps -aq}'
                sh 'docker build -t hello:1.0 .'
                sh 'docker container run --name hello-world -d -p 8080:80 hello:1.0'
            }
        }
    }
}

