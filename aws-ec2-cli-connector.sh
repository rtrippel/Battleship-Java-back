set -o allexport
source deploy.env
set +o allexport

ssh -i "$SSH_KEY" "$REMOTE_USER@$SERVER_IP"