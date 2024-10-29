function factorial(n) {
    if (n === 0 || n === 1) return 1;
    return n * factorial(n - 1);
}

function permutation(n, r) {
    if (n < r) return 0;
    return factorial(n) / factorial(n - r);
}

function combination(n, r) {
    if (n < r) return 0;
    return factorial(n) / (factorial(n - r) * factorial(r));
}

function multiPermutation(n, r) {
    return Math.pow(n, r);
}

function multiCombination(n, r) {
    return factorial(n + r - 1) / (factorial(r) * factorial(n - 1));
}

module.exports = {
    permutation,
    combination,
    multiPermutation,
    multiCombination
}

const n = 8;
const r = 3;

console.log(`n = ${n}, r = ${r}`);
console.log(`Permutation: ${permutation(n, r)}`);
console.log(`Combination: ${combination(n, r)}`);
console.log(`Multi Permutation: ${multiPermutation(n, r)}`);
console.log(`Multi Combination: ${multiCombination(n, r)}`);