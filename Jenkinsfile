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
               stage ('Push image to Artifactory') {                                                           
                                                                                                                
             agent {                                                                                            
                docker {                                                                                        
                  image 'openjdk:11.0.7'                                                                        
                 }                                                                                              
                }                                                                                               
            steps {                                                                                             
                rtDockerPush(                                                                                   
                    serverId: "art-1",                                                                          
                    image: "casestudy.jfrog.io/my-docker-repo/lathika/spring-petclinic:latest",                 
                    targetRepo: 'my-docker-repo',                                                               
                    properties: 'project-name=spring-petclinic;status=stable'                                   
                )                                                                                               
            }                                                                                                   
        }                                                                                                       
                                                                                                                
        stage ('Publish build info') {                                                                          
                                                                                                                
             agent {                                                                                            
                docker {                                                                                        
                  image 'openjdk:11.0.7'                                                                        
                 }                                                                                              
                }                                                                                               
            steps {                                                                                             
                rtPublishBuildInfo (                                                                            
                    serverId: "art-1"                                                                           
                )                                                                                               
            }                                                                                                   
        }  

}
}
                                                                                                             

