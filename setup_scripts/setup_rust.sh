#! /bin/bash

curl https://sh.rustup.rs -sSf | sh
source /home/samir/.cargo/env
rustup toolchain install nightly
# rustup target add wasm32-unknown-unknown --toolchain nightly
rustup component add clippy rls rust-analysis rust-src rustfmt
