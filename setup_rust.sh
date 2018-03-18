#! /bin/bash

curl https://sh.rustup.rs -sSf | sh
source /home/samir/.cargo/env
rustup install nightly
rustup toolchain install nightly
rustup update
rustup target add wasm32-unknown-unknown --toolchain nightly

rustup component add rustfmt-preview
rustup component add rls-preview rust-analysis rust-src
