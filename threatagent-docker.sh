# get host environment variable to file
printenv | grep CODEBUILD host.env >> host.env
printenv | grep CODEBUILD host.env >> host.env

# add prefix to protect docker environment variables from being overwritten by host variables
sed -i 's/^/HOST_/' host.env

cat host.env

# run docker image
#docker run --env-file=host.env test test_sh

# deleting the temporary file
rm host.env
