# registry-docker
This is our wrapper container for the docker registry v2. 

We pass in some variables from cloudformation and some are pulled from consul to setup our config.yml file. This allows us to setup newrelic, redis cache, and other nice things.
