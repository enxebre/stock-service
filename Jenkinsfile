podTemplate(label: 'stock-service-builder', containers: [
    containerTemplate(name: 'jnlp', image: 'jenkinsci/jnlp-slave:2.52', args: '${computer.jnlpmac} ${computer.name}', command: ''),
    containerTemplate(name: 'docker', image: 'docker:1.11.2', ttyEnabled: true, command: 'cat'),
  ],
  volumes: [hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')]) {

    node ('stock-service-builder') {

        stage 'Checkout'
        checkout scm
        
        container('docker') {
            stage 'Build Service'
            sh 'docker build -t enxebre/stock:v1 .'
            
            stage 'Push Service'
            sh "docker login -u enxebre -p ${dockerHubPass}"
            sh 'docker push enxebre/stock:v1'
            
            stage 'Build Self Contained Helm Repo'
            sh 'docker build -f DockerfileChart -t enxebre/stock-service-chart:v1 .'
            
            stage 'Push Self Contained Helm Repo'
            sh 'docker push enxebre/stock-service-chart:v1'
        }
    }
}