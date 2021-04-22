read -p "Enter tag name: " TAG_NAME

docker build -t fb/predator:${TAG_NAME} .
