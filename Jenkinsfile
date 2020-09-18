pipeline {
    agent none

    stages {
         stage ('Compile Stage') {

    agent {
        docker {
            image 'maven:3.5.0'
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
            image 'maven:3.5.0'
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
            image 'maven:3.5.0'
            args '-v /root/.m2:/root/.m2'
        }
    }
            steps {
                sh 'mvn clean install'
            }
        }
           stage('Docker Build') {                                                                                
            agent any                                                                                           
            steps {                                                                                             
                script {                                                                                        
                      sh "docker build -t casestudy.jfrog.io/my-docker-repo/lathika/spring-petclinic:latest . " 
}                                                                                                               
           }                                                                                                    
    }  

}
}
                                                                                                             

