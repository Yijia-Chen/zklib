pragma circom 2.0.0;

template Multiplier2() {
    signal input b;
    signal input a;
    signal input prod;
    signal output out;

    // component eq = IsEqual();
    // eq.in[0] <-- prod;
    // eq.in[1] <-- a*b;

    out <-- a*b == prod;
    out === 1;
}

component main = Multiplier2();