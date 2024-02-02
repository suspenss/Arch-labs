.PHONY: build-docker exec

build-docker:
	docker run -dit -P \
	    --name arch \
	    -w /home/ubuntu \
	    --mount type=bind,source=/Users/epoche/Desktop/learn/arch-labs,target=/home/ubuntu/arch-labs \
	    kazutoiris/connectal:latest

exec:
	docker exec -it arch bash
