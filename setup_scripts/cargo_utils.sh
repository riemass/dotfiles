#! /bin/bash

source $HOME/cargo/env
cargo install ripgrep
cargo install tokei
cargo install cargo-edit 
cargo install diesel_cli --no-default-features --features sqlite
