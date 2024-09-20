# External Merge Sort and Binary Search in Swift

This project demonstrates the use of External Merge Sort and Binary Search in Swift for handling large datasets. It simulates sorting and searching through a dataset of strings, focusing on memory efficiency and performance with large-scale data.

## Introduction

When working with large datasets (e.g., 100 million entries), sorting and searching efficiently becomes a critical challenge. This project provides an implementation of the External Merge Sort algorithm, allowing you to sort large datasets in manageable memory chunks, followed by Binary Search to efficiently find string values in the sorted data.


## Usage

```Swift
// Example usage:

// Simulating 100 million strings with a smaller dataset for demonstration
let largeDataSet: [String] = (1...100).map { "String\($0)" }.shuffled()

// Sort the data using External Merge Sort (chunk size = 20)
let sortedDataSet = externalMergeSort(data: largeDataSet, chunkSize: 20)

// Print sorted result
print("Sorted Data Set:")
print(sortedDataSet)

// Perform Binary Search for a specific string
if let index = binarySearch(data: sortedDataSet, target: "String50") {
    print("Found 'String50' at index \(index)")
} else {
    print("'String50' not found")
}
```

## Features

- **External Merge Sort**: Sort large datasets in chunks that fit in memory, simulating disk-based sorting.
- **K-Way Merge**: Efficiently merge sorted chunks using a k-way merge algorithm.
- **Binary Search**: Quickly search for a string in the sorted dataset in O(log n) time.
- Handles large datasets in memory-limited environments.

## Usage

**Sorting Large Datasets:**
- Split the data into chunks.
- Sort each chunk individually in memory.
- Merge sorted chunks into a final sorted dataset using a k-way merge.

**Searching in a Sorted Dataset:**
- Use the provided binarySearch() function to find specific string values in the sorted dataset.

## Algorithm Explanation

**External Merge Sort**
1. **Chunking:** The dataset is broken down into smaller chunks that can be sorted in memory. Each chunk is sorted independently.
2. **Merging:** The sorted chunks are merged into a final sorted list using a k-way merge algorithm. This process ensures that memory is used efficiently, and the final result is sorted.

**Binary Search:** 
- After sorting, a binary search algorithm is used to quickly search for a specific string in the sorted data. The binary search algorithm works by repeatedly dividing the search interval in half, making it highly efficient with O(log n) time complexity.

