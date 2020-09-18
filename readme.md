Devops casestudy for a maven spring boot application and integration with jfrog artifactory 

The spring-petclinic project mentioned below is forked from the project https://github.com/spring-projects/spring-petclinic

The forked project is then build using a docker image and uploaded into jfrog artifactory 

Tools used are :
1) Amazon linux instance t2.large (as t2.micro may have memory issue ) 2 vcpu and used 16GB storage
2) Open TCP,ssh ports 8081,8080,22 for my IP (only ) in security groups 
2) Install docker using ---> yum  install docker -y
3) Run Jenkins as a docker image 
docker run --rm --detach   --net host -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home  -v $(which docker):/usr/local/bin/docker -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home  jenkinsci/blueocean
4) Run a docker inside the above docker image so that we can call the docker build commands inside the jenkins container 
5) Configure artifactory plugin in jenkins with details 
![Artifcatory config jenkins](../src/artifactoryconfig.png)
The above image will run on port 8080 so the application should use another port , in my case I did use 8081

6) Add various stages for Jenkins file and include docker file as well 

```
git clone https://github.com/lathikakodoth/spring-petclinic.git

Jenkins file consist of stages :
1) compile the code 
2) Test the code
3) Maven install 
4) Docker build using teh docker file 
5) Docker push the image to artifactory 
6) Docker publish the image 
![Artifcatory image](../src/imageDocker.png)
![Build info](../src/buildinfo.png)

