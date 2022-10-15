# get host environment variable to file
printenv > host.env

# add prefix to protect docker environment variables from being overwritten by host variables
sed -i 's/^/HOST_/' host.env

cat host.env

# run docker image
docker run --env-file=host.env --name threatrix-threat-agent -v $(pwd):/app threatrix/threat-agent $(pwd)

# deleting the temporary file
rm host.env
