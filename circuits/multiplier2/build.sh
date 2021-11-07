#!/bin/env sh

# specify file prefix
while getopts p:n: flag
do
  case "${flag}" in
    p) prefix=${OPTARG};;
    n) name=${OPTARG};;
  esac
done

# compile circuit
circom ${prefix}.circom --r1cs --wasm --sym

# # compute witness
node ${prefix}_js/generate_witness.js ${prefix}_js/${prefix}.wasm input.json witness.wtns

# start phase generation
snarkjs powersoftau prepare phase2 ../../ceremony/pot12_0001.ptau pot12_final.ptau -v
snarkjs groth16 setup ${prefix}.r1cs pot12_final.ptau ${prefix}_0000.zkey
snarkjs zkey contribute ${prefix}_0000.zkey ${prefix}_0001.zkey --name="${name}" -v
snarkjs zkey export verificationkey ${prefix}_0001.zkey verification_key.json

# generate proof
snarkjs groth16 prove ${prefix}_0001.zkey witness.wtns proof.json public.json

# verify proof
snarkjs groth16 verify verification_key.json public.json proof.json