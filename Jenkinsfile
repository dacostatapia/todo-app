/* Requires the Docker Pipeline plugin */
pipeline {
    agent any
    stages {
        stage('code-style') {
            steps {
                echo 'Code Style ok'
            }
        }
        stage('build') {
            steps {
                echo 'Build ok'
            }
        }
        stage('unit-test') {
            steps {
                echo 'Unit Test OK'
            }
        }
        stage('component-test') {
            steps {
                echo 'Component Test OK'
            }
        }
        stage('deploy') {
            steps {
                echo 'Deploy OK'
            }
        }
    }
}