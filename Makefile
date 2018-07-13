build:
	cargo rustc --release -- -C "link-arg=-undefined" -C "link-arg=dynamic_lookup"
	mv target/release/libpycrust.dylib target/release/pycrust.so
	@echo "* Build complete!";

clean:
	rm -rf target/
	rm Cargo.lock

test:
	PYTHONPATH=target/release python -c"import pycrust;pycrust.run_me({'this_is_a_key': 12345});"
