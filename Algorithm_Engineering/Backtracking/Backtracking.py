def subset_sum_helper(nums, target, start, path, res):
    """Helper function to find all subsets of nums that add up to target"""
    if sum(path) == target:
        res.append(path[:])
        return
    if sum(path) > target:
        return
    for i in range(start, len(nums)):
        # Avoid duplicates
        if i > start and nums[i] == nums[i-1]:
            continue
        path.append(nums[i])
        subset_sum_helper(nums, target, i + 1, path, res)
        path.pop()

def subset_sum(nums, target):
    """Main function to find all subsets of nums that add up to target"""
    nums.sort()
    res = []
    subset_sum_helper(nums, target, 0, [], res)
    return res

# Example usage
nums = [1, 2, 2, 3, 4, 4]
target = 6
res = subset_sum(nums, target)
print(res)

#Example of a tree with duplicates
#      {1,1,2,3}
#         /   \
#    {1,3}   {2}       
#      /    /   \
# {1,2,3} {2,3} {3}
#   /       \
# {1,2}     {}
