pipeline {
    agent none

    stages {
         stage ('Compile Stage') {

    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
            steps {
                sh 'mvn clean compile '
            }
                        }
        stage('Testing Stage ') {

    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }

            steps {
                sh 'mvn test'
            }
        }
         stage('Maven Install') {

    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
            steps {
                sh 'mvn clean install'
            }
        }


}
}
                                                                                                             

