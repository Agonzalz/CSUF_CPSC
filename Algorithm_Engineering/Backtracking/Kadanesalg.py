def max_subarray_sum(arr):
    max_so_far = arr[0]
    max_ending_here = arr[0]
    
    for i in range(1, len(arr)):
        max_ending_here = max(arr[i], max_ending_here + arr[i])
        max_so_far = max(max_so_far, max_ending_here)
        
    return max_so_far

# Test the function with the given list
arr = [-2, 3, -1, 2]
max_sum = max_subarray_sum(arr)
print(max_sum)  # Output: 4
