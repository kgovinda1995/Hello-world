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
                sh " rm -rf Hello-world"
                sh 'git clone  https://github.com/kgovinda1995/Hello-world.git'
            }
        }
        stage('maven build'){
            steps{
                sh'mvn clean install'
            }
        }
        
        stage('Docker'){
            
            steps{
               
                sh 'docker rmi ${docker images -aq}'
                sh 'docker container rm -f ${docker ps -aq}'
                sh 'docker build -t hello:1.0 .'
                sh 'docker container run --name hello-world -d -p 8080:80 hello:1.0'
            }
        }
    }
}

