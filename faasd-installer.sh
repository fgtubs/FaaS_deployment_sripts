# Install the lightweight version of faas. 

git clone https://github.com/openfaas/faasd --depth=1
cd faasd
./hack/install.sh

# to log in: sudo cat /var/lib/faasd/secrets/basic-auth-password | faas-cli login -s

# to check store functions: faas-cli store list

# to deploy functions: faas-cli deploy --image fcarp10/hello-world --name hello-world // faas-cli store deploy nodeinfo

# to run functions: curl http://127.0.0.1:8080/function/hello-world // curl http://127.0.0.1:8080/function/nodeinfo
