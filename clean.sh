#!/bin/env sh

# remove generated files
find . -type d -name '*_js' -exec rm -r {} +
find . -type f -name '*.zkey' -delete
find . -type f -name '*.r1cs' -delete
find . -type f -name '*.sym' -delete
find . -type f -name '*_final.ptau' -delete
find . -type f -name 'proof.json' -delete
find . -type f -name 'public.json' -delete
find . -type f -name 'verification_key.json' -delete
find . -type f -name '*.wtns' -delete
