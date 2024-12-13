#!/bin/sh
set -e

roc glue \
    ../../roc-lang/roc/crates/glue/src/RustGlue.roc \
    ./generated/ \
    ./platform/glue2.roc

mv \
    ./generated/roc_app/src/x86_64.rs \
    ./crates/roc_host/src/glue2.rs

rm -rf \
    ./generated/

cargo fmt
