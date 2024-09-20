//
//  SourceCode.swift
//  TimeLineView
//
//  Created by Aruna Udayanga on 20/09/2024.
//

import Foundation

// Simulate external sorting by splitting a large array into chunks
func externalMergeSort(data: [String], chunkSize: Int) -> [String] {
    var sortedChunks: [[String]] = []
    
    // Step 1: Split the data into chunks and sort each chunk
    for i in stride(from: 0, to: data.count, by: chunkSize) {
        let chunk = Array(data[i..<min(i + chunkSize, data.count)])
        sortedChunks.append(chunk.sorted()) // Sort each chunk
    }
    
    // Step 2: Merge the sorted chunks
    return mergeSortedChunks(sortedChunks: sortedChunks)
}

// Helper function to merge sorted chunks using a k-way merge
func mergeSortedChunks(sortedChunks: [[String]]) -> [String] {
    var result: [String] = []
    var chunkPointers: [Int] = Array(repeating: 0, count: sortedChunks.count) // To track indices in each chunk
    
    // Continue until all chunks are exhausted
    while true {
        var minString: String? = nil
        var minIndex: Int? = nil
        
        // Find the smallest element among the current elements of each chunk
        for i in 0..<sortedChunks.count {
            if chunkPointers[i] < sortedChunks[i].count {
                let currentString = sortedChunks[i][chunkPointers[i]]
                
                if minString == nil || currentString < minString! {
                    minString = currentString
                    minIndex = i
                }
            }
        }
        
        // If no more elements are left in any chunk, we are done
        if minString == nil {
            break
        }
        
        // Add the smallest string to the result and advance the pointer
        result.append(minString!)
        chunkPointers[minIndex!] += 1
    }
    
    return result
}

// Binary Search to find a string in a sorted array
func binarySearch(data: [String], target: String) -> Int? {
    var low = 0
    var high = data.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        if data[mid] == target {
            return mid // Found target
        } else if data[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return nil // Target not found
}

// Example usage:

// Simulating 100 million strings with a smaller dataset
let largeDataSet: [String] = (1...100).map { "String\($0)" }.shuffled()

// Assume we can only sort chunks of size 20 in memory
let sortedDataSet = externalMergeSort(data: largeDataSet, chunkSize: 20)

// Print sorted result
print("Sorted Data Set:")
print(sortedDataSet)

// Search for a string using Binary Search
if let index = binarySearch(data: sortedDataSet, target: "String50") {
    print("Found 'String50' at index \(index)")
} else {
    print("'String50' not found")
}



