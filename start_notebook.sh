source conf.sh

read -p "Enter Tag: " TAG_NAME
docker run --gpus ${CUDA_VISIBLE_DEVICES} \
           --rm \
           --network host \
           --name predator \
           --env-file conf.sh \
           -v $(pwd)/data:/data \
           --shm-size 8G \
           -v $(pwd):/tf \
	   -v $(data):/tf/data \
           fb/predator:${TAG_NAME}
