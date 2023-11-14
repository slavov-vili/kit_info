# Fast Inefficient Ranking
1. Algorithm Notes
    - Idea: compare each element with all others
    - Rank of A[i] = number of elements which are smaller
    - first for: compare to all others and store in matrix
    - second for: sum rows = calculate rank
1. Sorting Larger Datasets Notes
    - if n > p, split data among processors (n/p)
    - output = sort processors (all elements are smaller than all in other)
1. Fast Ranking Again Notes
    - PEs ordered in an axb matrix
    - sort = each PE sorts its data
    - Algorithm Notes
        * all-gather-merge
            * each processor should know the data in its row and col
            * merge, because we sort what we receive
        * ranks
            * calculate the rank of each row element with respect to the col elements
        * reduce = sum ranks in row (global rank)
    - Local Ranking Notes
    ```
        foreach y in r do
          j=1
          while y < c[j] do
              j++
          output j-1
    ```
        * works in linear time
    - Analysis Notes
        * 



# Quicksort
