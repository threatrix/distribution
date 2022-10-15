# Threatrix Variables
printenv | grep 'THREATRIX_' >> host.env
# AWS CodeBuild
printenv | grep CODEBUILD >> host.env
# Bitbucket
printenv | grep BITBUCKET >> host.env
# Azure
printenv | grep 'BUILD_SOURCEBRANCH\|SYSTEM_TEAMPROJECT\|SYSTEM_COLLECTIONURI' >> host.env
# CircleCI
printenv | grep 'CIRCLE_' >> host.env
# GitLab
printenv | grep 'CI_' >> host.env

cat host.env
