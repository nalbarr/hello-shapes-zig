help:
	@@ echo make build
	@@ echo make run
	@@ echo make test

build:
	zig build 

run: build
	./zig-out/bin/hello_shapes_zig

clean:
	rm -fr ./zig-out

test:
	zig build test
