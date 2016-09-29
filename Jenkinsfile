#!groovy

IMAGE_NAME = 'camptocamp/mapserver'

node('docker') {
  // make sure we don't mess with another build by using latest on both
  env.DOCKER_TAG = env.BUILD_TAG

  stage('Update docker') {
    checkout scm
    sh 'make pull'
  }
  stage('Build') {
    checkout scm
    sh 'make build'
  }
  stage('Test') {
    checkout scm
    sh 'make acceptance'
  }

  if (env.BRANCH_NAME == 'master') {
    finalTag = 'latest'
  } else {
    finalTag = env.BRANCH_NAME
  }


  if (finalTag ==~ /\d+(?:\.\d+)*/) {
    parts = finalTag.tokenize('.')
    tags = []
    for (int i=1; i<=parts; ++i) {
        tags << parts.subList(0, i).join('.')
    }
  } else {
    tags = [finalTag]
  }

  stage("Publish ${tags}") {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub',
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
      sh 'docker login -u "$USERNAME" -p "$PASSWORD"'
      for (String tag: tags) {
        //give the final tag to the image
        sh "docker tag ${IMAGE_NAME}:${env.DOCKER_TAG} ${IMAGE_NAME}:${tag}"
        //push it
        docker.image("${IMAGE_NAME}:${tag}").push()
        sh 'rm -rf ~/.docker*'
      }
    }
  }
}

