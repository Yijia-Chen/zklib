pragma circom 2.0.0;

template ArrayContains(len) {
    signal input array[len];
    signal input element;
    signal output out;

    var equals = 0;
    for (var i = 0; i < 10; i++) {
        equals += (array[i] == element);
    }

    out <-- (equals >= 1);
    out === 1;
}

component main = ArrayContains(10);