pragma circom 2.0.0;
include "../arrayEquals/arrayEquals.circom";

/*************************** WARNING ***************************/
/* Sort is still work in progress. It DOES NOT WORK as of now. */

template Sort(len) {
    signal input array[len];
    signal input sorted[len];
    signal output out;

    var result = mergeSort(array, len);
    component equals = ArrayEquals(len);
    equals.in[0] = sorted;
    equals.in[1] = result;

    out <-- equals.out;
    out === 1;
}

function mergeSort(array, len) {
    if (len < 2) {
        return array;
    }

    var lenL = len \ 2;
    var lenR = len - lenL;
    
    var left[lenL];
    var right[lenR];
    for (var i = 0; i < lenL; i++) {
        left[i] = array[i];
    }
    for (var i = 0; i < lenR; i++) {
        right[i] = array[lenL+i];
    }

    return merge(mergeSort(left, lenL), mergeSort(right, lenR), lenL, lenR);
}

function merge(left, right, lenL, lenR) {
    var len = lenL + lenR;
    var merged[len];
    var idxL = 0;
    var idxR = 0;
    for (var i = 0; i < len; i++) {
        if (idxR == len) {
            merged[i] = left[idxL];
            idxL++;
        } else if (idxL == len) {
            merged[i] = right[idxR];
            idxR++;
        } else if (left[idxL] < right[idxR]) {
            merged[i] = left[idxL];
            idxL++;
        } else {
            merged[i] = right[idxR];
            idxR++;
        }
    }
    return merged;
}

component main = Sort(16);