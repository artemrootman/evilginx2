TARGET=evilginx
PACKAGES=core database log parser

.PHONY: all build install clean
all: build install

build:
	@go build -o ./build/$(TARGET) -mod=vendor main.go

install:
	@mkdir -p /usr/share/evilginx
	@cp -r ./phishlets /usr/share/evilginx/
	@cp ./build/$(TARGET) /usr/local/bin/

clean:
	@go clean
	@rm -f ./build/$(TARGET)
