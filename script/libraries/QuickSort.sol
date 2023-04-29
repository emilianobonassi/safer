// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

function quickSortAddress(address[] memory arr, int256 left, int256 right) pure {
    int256 i = left;
    int256 j = right;
    if (i == j) return;

    address pivot = arr[uint256(left + (right - left) / 2)];
    while (i <= j) {
        while (arr[uint256(i)] < pivot) i++;
        while (pivot < arr[uint256(j)]) j--;

        if (i <= j) {
            (arr[uint256(i)], arr[uint256(j)]) = (arr[uint256(j)], arr[uint256(i)]);
            i++;
            j--;
        }
    }

    if (left < j) quickSortAddress(arr, left, j);
    if (i < right) quickSortAddress(arr, i, right);
}

library QuickSort {
    function sort(address[] memory data) internal pure {
        quickSortAddress(data, int256(0), int256(data.length - 1));
    }
}
