pipeline{
    agent { label 'maven' }

    stages{
        stage('git clone'){
            steps{
                sh 'git clone https://github.com/kgovinda1995/Hello-world.git'
            }
        }
        agent { label 'maven' }

        stage('maven build'){
            steps{
                sh 'mvn clean install'
            }
        }
    }
}