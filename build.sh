DEPLOYMENT="./deployments"

cd $DEPLOYMENT
echo "Running docker compose file..."

docker compose -f production.yml up -d 