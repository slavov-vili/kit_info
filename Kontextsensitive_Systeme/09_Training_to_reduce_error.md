# Evaluation Function
1. Example: COVID classification
1. Accuracy
    - Very meaningful when 2 disjoint classes
    - TODO: explain
1. Problem
    - Not everything can be used as a metric
    - Needs to be differentiable
    - 



# Loss Function
1. Introduction
    - TODO: explain
    - Why not optimize on accuracy?
        * Gradient becomes flat
1. Cross Entropy (CE) loss
    - TODO: explain
1. Data Sampling
    - Above methods bad when classes are imbalanced (NW learns the majority class)
    - TODO: explain
1. Sample Weights in Loss Function
    - TODO: explain
1. Cost-sensitive classification
    - FIXME: Already seen?
1. Focal loss
    - TODO: explain
1. Loss Function with Constraints
    - TODO: explain all
    - Regularization
    - Network pruning
    - Hardware aware Neural Architecture Search (NAS)
    - Center Loss Function
        * Data in classes very close to boundaries (irrelevant for training)
        * We want to pull them together around a learned center
    - Why not optimize on precision and recall?
1. Contrastive loss function
    - TODO: explain



