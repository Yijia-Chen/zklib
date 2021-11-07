pragma circom 2.0.0;

template ArrayEquals() {
    var len = 16;
    signal input a1[len];
    signal input a2[len];
    signal output out;

    var equals = 0;
    for (var i = 0; i < len; i++) {
        equals += (a1[i] == a2[i]);
    }

    out <-- (equals \ len);
    out === 1;
}

// component main = ArrayEquals();