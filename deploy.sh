#!/bin/bash

set -o allexport
source deploy.env
set +o allexport

echo "Copying files to AWS server..."
scp -i "$SSH_KEY" -r "$DOCKER" "$REMOTE_USER@$SERVER_IP:$REMOTE_PATH"
scp -i "$SSH_KEY" "$ENV" "$REMOTE_USER@$SERVER_IP:$REMOTE_PATH"
echo "Successfully copied files to AWS server."

echo "Connecting to AWS server and starting Docker Compose..."
ssh -i "$SSH_KEY" "$REMOTE_USER@$SERVER_IP"  << EOF

#sudo docker stop my-postgres-container || true
#sudo docker rm my-postgres-container || true

cd ./docker
docker-compose --env-file ../.env -f docker-compose.yml up -d

# ./run_migrations.sh || true

exit
EOF

echo "Successfully deployed and started Docker Compose on AWS server."