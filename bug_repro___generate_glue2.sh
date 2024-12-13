#!/bin/sh
set -e

roc glue \
    ../../roc-lang/roc/crates/glue/src/RustGlue.roc \
    ./generated/ \
    ./platform/glue2.roc

glue_file='./crates/roc_host/src/glue2.rs'
mv \
    ./generated/roc_app/src/x86_64.rs \
    $glue_file

rm -rf \
    ./generated/

# Rust complains when these don't implement Copy.
for copyable_tag_union in SadPayloadfulTag SadPayloadfulTagFluffed
do
    before="\n\n\(#\[repr(C)\]\npub struct $copyable_tag_union {\)"
    after="\n\n#[derive(Copy)]\n\1"
    sed -z "s/$before/$after/g" -i $glue_file
    before="\n\n\(#\[repr(C, align([0-9]\+))\]\npub union union_$copyable_tag_union {\)"
    after="\n\n#[derive(Clone, Copy)]\n\1"
    sed -z "s/$before/$after/g" -i $glue_file
done

cargo fmt

