ARMV8_URL=https://nodejs.org/dist/v5.9.1/node-v5.9.1-linux-arm64.tar.xz
ARMV8_SRC=node-v5.9.1-linux-arm64

ARMV7_VER=5.9.1
ARMV7_URL=https://nodejs.org/dist/v$(ARMV7_VER)/node-v$(ARMV7_VER)-linux-armv7l.tar.xz
ARMV7_SRC=node-v$(ARMV7_VER)-linux-armv7l

build-armv7: download
	test -e src/$(ARMV7_SRC).tar.xz || wget $(ARMV7_URL)
	docker build --build-arg NODE_VER=$(ARMV7_SRC) -t linkerlab/rpi-node:$(ARMV7_VER)-armv7l .
	docker push linkerlab/rpi-node:$(ARMV7_VER)-armv7l

download:
ifeq (, $(wildcard ./src))
	@mkdir src
endif
ifeq (, $(wildcard ./src/$(ARMV7_SRC).tar.xz))
	@echo "src file not exist, start to download..."
	@curl $(ARMV7_URL) -o src/$(ARMV7_SRC).tar.xz
endif	
ifeq (, $(wildcard ./src/$(ARMV7_SRC)))
	@echo "unzip file..."
	@tar -xJf src/$(ARMV7_SRC).tar.xz -C src/
endif

clean:
	-rm -vf src/*

tt:
	echo 123
