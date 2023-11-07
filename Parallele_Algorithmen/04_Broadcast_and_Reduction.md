# Introduction
1. ![image](images/broadcast_and_reduce.png)
1. Broadcast (one to all)
    - 1 PE sends a message of length n to ALL other PEs
1. Reduction (one from all)
    - 1 PE receives the sum of p messages of length n
1. Convert broadcast to reduction
    - TODO: explain
1. Assumptions
    - Fully-connected, Full Duplex



# Broadcast
1. Naive Broadcast
    - TODO: explain
1. Binomial Tree Broadcast
    - Notes
        * trailingZeroes = to how many processors should we send
        * Use men cos sometimes too big? (bzw. infinite if i=0)
        * iterating downwards, because more efficient? else log(p)^2?
            + because child with highest index has the most kids? (binomial tree)
1. Linear Pipeline Broadcast
    - Notes
        * split message into pieces, each PE send a piece further in each step
        * p-1 until arrives at last PE
        * x axis: message size = x * (beta / alpha)
        * y axis: wtf?
1. Binary Tree Broadcast
    - Notes
        * 2j, because each has 2 children
        * log(p), because binary tree
        * 3 steps further, because receive, send, send
1. TODO: further tree algorithms
1. Disadvantage of Tree-based broadcasts
    - Leaves only receive (apart from that - unproductive)
    - Inner nodes send more than they receive
        * => full-duplex is not fully exploited
