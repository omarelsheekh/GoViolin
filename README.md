# GoViolin

GoViolin is a web app written in Go that helps with violin practice.

Currently hosted on Heroku at https://go-violin.herokuapp.com/

GoViolin allows practice over both 1 and 2 octaves.

Contains:
* Major Scales
* Harmonic and Melodic Minor scales
* Arpeggios
* A set of two part scale duet melodies by Franz Wohlfahrt

## Before Running the Pipeline
before running the jenkins pipeline make sure of:
- docker is installed
- jenkins user is in docker group
- kubectl is installed
- helm chart is installed
- kubeconfig file and all credential files for k8s cluster are accessable by jenkins user 
- if you are using minikube make sure to enable the NGINX Ingress controller
    ```
    minikube addons enable ingress
    ```
- these Jenkins credentials are stored as secret text
    - `kube-config-path` the path of kubeconfig file
    - `docker-hub-username` the dockerhub username
    - `docker-hub-password` the dockerhub password
- Slack plugin for Jenkins is installed
    1.  Get a Slack account: <https://slack.com/>
    2.  Configure the Jenkins integration: <https://my.slack.com/services/new/jenkins-ci>
    3.  Install this plugin on your Jenkins server:
        1.  From the Jenkins homepage navigate to `Manage Jenkins`
        2.  Navigate to `Manage Plugins`,
        3.  Change the tab to `Available`,
        4.  Search for `slack`,
        5.  Check the box next to install.

## Access GoViolin App
after the pipeline is finished you can access the app using ingress ip
```
$ kubectl get ingress
NAME                     CLASS    HOSTS   ADDRESS        PORTS   AGE
goviolin-1-app-ingress   <none>   *       192.168.49.2   80      21m
```