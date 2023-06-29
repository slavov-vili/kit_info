# Parallelization
1. Lambda Architecture
1. Kappa Architectures
1. ML-Architectures

1. Scoring
    - Predictive Model Markup Language (PMML)
    - ONNX

1. Batch / Parallel Learning


# Trading accuracy for parallelization



# Batches in Gradient Descent
1. Useful for parallelization
    - Initially: batches improve performance
    - Parameter server = split data in batches and calculate in parallel
1. Parameter servers
    - Duplicate nodes and push the mini batches through (TODO: image)
    - Trends
        * Data parallelism more common than model
        * Models often too big for a single GPU
        * Pipelining
            + Similar to process optimization (TODO: image)
            + Ideally: different nodes/workers can process different batches
1. PipeDream
    - Forward and backwards passes (next layer - on next system)
1. Parameter Servers
    - Classical
        * Everyone sends their result to one machine
        * It calculates a result and sends it back to everyone
    - All Reduce
        * Everyone sends to everyone
        * Each machine calculates for itself
    - Ring reduce (Aggregation)
        * Iterate in a circle: Send to next and average

