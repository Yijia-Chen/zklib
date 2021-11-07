pragma circom 2.0.0;

template Multiplier2() {
    signal input b;
    signal input a;
    signal input prod;
    signal output out;

    out <-- a*b == prod;
    out === 1;
}

component main = Multiplier2();