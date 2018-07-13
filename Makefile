build:
	cargo rustc --release -- -C "link-arg=-undefined" -C "link-arg=dynamic_lookup"
	mv target/release/libhello.dylib target/release/hello.so
	@echo "* Build complete!";

clean:
	rm -rf target/
	rm Cargo.lock

test:
	PYTHONPATH=target/release ipython -c"import hello;hello.run_me({'this_is_a_key': 12345});"
