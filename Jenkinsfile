def getVersion(){
    def commitHash = sh returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}
currentBuild.displayName = "my-hello-world-#"+currentBuild.number
pipeline{
    agent  any
    environment {
      DOCKER_TAG = "getVersion()"
     }

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
                 sh 'scp  /home/jenkins/workspace/my-project/target/*.jar jenkins@172.31.28.16:/home/jenkins/workspace/'
              }
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

