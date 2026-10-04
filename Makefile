format:
	cargo fmt --quiet

lint:
	cargo clippy --quiet

test:
	cargo test --quiet

build:
	cargo build --release

check:
	cargo check

run:
	cargo run

rrun:
	cargo run --release

all: format lint test build run rrun
