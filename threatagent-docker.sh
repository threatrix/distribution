# Threatrix Variables
printenv | grep 'THREATRIX_' >> host.env
# AWS CodeBuild
printenv | grep CODEBUILD >> host.env
# Bitnucket
printenv | grep BITBUCKET >> host.env
# Azure
printenv | grep 'BUILD_SOURCEBRANCH\|SYSTEM_TEAMPROJECT\|SYSTEM_COLLECTIONURI' >> host.env
# CircleCI
printenv | grep 'CIRCLE_' >> host.env
# GitLab
printenv | grep 'CI_' >> host.env


# add prefix to protect docker environment variables from being overwritten by host variables
#sed -i 's/^/HOST_/' host.env

cat host.env

# run docker image
#docker run --env-file=host.env --name threatrix-threat-agent -v $(pwd):/app threatrix/threat-agent --oid=$HOST_THREATRIX_OID --eid=$HOST_THREATRIX_EID --api-key=$HOST_THREATRIX_API_KEY ./

# deleting the temporary file
#rm host.env
