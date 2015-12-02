
all:
	echo "Usage: make <build|run>"

build:
	docker build -t archlinux-unrealircd .

run:
	docker run -d -p 6697:6697 -p 7000:7000 --name ircd archlinux-unrealircd

.PHONY: all build run
.SILENT: all build run
