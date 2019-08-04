.PHONY: all build run debug clean

NAME = dovecot
IMAGE = simonrupf/$(NAME)

all: build run

build:
	docker build -t $(IMAGE) .

run:
	docker run -d --init --name $(NAME) --read-only --restart=always $(IMAGE)

debug:
	docker run -ti --rm --init --name $(NAME) --read-only $(IMAGE) /bin/ash

clean:
	docker stop $(NAME)
	docker rm $(NAME)
