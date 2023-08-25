node {
    stage('Test Stage') {
        echo 'Running the test...'
        sh 'echo "Test Passed"'
    }
    
    try {
        currentBuild.resultIsBetterOrEqualTo('SUCCESS')
        echo 'Test successful!'
    } catch (Exception e) {
        echo 'Test failed!'
    } finally {
        echo 'Cleaning up...'
    }
}
