def call(String ENV, String ENVTYPE) {
    withCredentials ([
        usernamePassword(credentialsId: 'SVC-TF-CREDS', usernameVariable: 'TF_AK', passwordVariable: 'TF_SK'),
        string(credentialsId: "demo-${ENV}-public-key", variable: 'envPublicKey')
    ]){
    sh '''
        export PATH=$PATH:"/usr/local/bin":"/.local/bin":
        export AWS_ACCESS_KEY_ID=${TF_AK}
        export AWS_SECRET_ACCESS_KEY=${TF_SK}
        export AWS_DEFAULT_REGION=${REGION}
        cd ${WORKSPACE}/Infra.TF.${ENVTYPE}/Infrastructure
            terraform-compliance -p tfplan -n -f terraform-compliance
    '''
    }
}
