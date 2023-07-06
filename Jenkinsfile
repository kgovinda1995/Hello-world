pipeline{
    agent {label 'maven'}
    stages{
        stage('maven build'){
            steps{
                sh 'git clone  https://github.com/kgovinda1995/Hello-world.git'
            }
        }
        stage('maven build'){
            steps{
                sh'mvn clean install'
            }
        }
    }
}