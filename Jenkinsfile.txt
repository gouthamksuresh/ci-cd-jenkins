pipeline {
  agent any
  stages {
    stage('Checkout'){ steps{ checkout scm } }
    stage('Build'){ steps{ sh 'docker build -t ci-demo:${BUILD_ID} .' } }
    stage('Test'){ steps{ sh 'docker run --rm ci-demo:${BUILD_ID} npm test || true' } }
    stage('Deploy'){ steps{ sh 'docker run -d --name ci-demo-${BUILD_ID} -p 3000:3000 ci-demo:${BUILD_ID} || true' } }
  }
}
