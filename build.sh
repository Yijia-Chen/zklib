#!/bin/env sh

# specify circuit
while getopts c:n: flag
do
  case "${flag}" in
    c) circuit=${OPTARG};;
    n) name=${OPTARG};;
  esac
done

# compile circuit
circom ${circuit}.circom --r1cs --wasm --sym

# # compute witness
node ${circuit}_js/generate_witness.js ${circuit}_js/${circuit}.wasm input.json witness.wtns

# start phase generation
snarkjs powersoftau prepare phase2 ../../ceremony/pot12_0001.ptau pot12_final.ptau -v
snarkjs groth16 setup ${circuit}.r1cs pot12_final.ptau ${circuit}_0000.zkey
snarkjs zkey contribute ${circuit}_0000.zkey ${circuit}_0001.zkey --name="${name}" -v
snarkjs zkey export verificationkey ${circuit}_0001.zkey verification_key.json

# generate proof
snarkjs groth16 prove ${circuit}_0001.zkey witness.wtns proof.json public.json

# verify proof
snarkjs groth16 verify verification_key.json public.json proof.json