# Decision Trees
1. What?
    - Axis-aligned lines split the data
    - Each split = node in binary tree (true, false)
    - Nodes contains a decision (feature value is compared to threshold)
    - Leaves = outcome / predicted value
    - Pruning = removing nodes which don't contribute significantly (prevents overfitting)
1. Thresholds
    - A value used to make a decision
    - Finding the optimal one:
        * Foreach feature:
        * sort values 
        * average of each 2 consecutive ones is a potential boundary
        * each pair (feature and candidate threshold) is a potential boundary
1. Boundaries
    - The lines that separate the data in the feature space
1. Training
    - Pick the feature which best splits the data in half (measured using purity measures)
    - Foreach subset: if not pure enough - recurse
1. Purity Measures
    - Information Gain
        * Measures the increase in information (decrease in entropy) due to the split
            + Higher is better
        * = Entropy before split - Weighted Average of entropy after split
        * Entropy before split = E_node = - sum_class(p(class|node) * log2(p(class|node)))
            + e.g. p(class|node) = objects of class / all objects in current subset
        * Weighted average = I_node = E_node - sum_child((N_child / N_node) * E_child)
            * N_node = number of data points in the node's subset
    - Gini Index
        * Measures the probability that a random selection is misclassified (based on class distribution)
            + Lower is better
        * = Sum of weighted Gini indices after the split (children)
        * Sum = S_node = sum_child((N_child/N_node) * G_node)
        * G_node = 1 - sum(p(class|node)^2)
    - Mean Squared Error (MSE)
        * For Regression Trees
1. Stopping?
    - When: purity, max tree depth, min samples per leaf
    - And then: each leaf holds a prediction or a value (classification = majority class, regression = mean/median of target values)
1. Random forests
    - Many trees with different splits = more robust to new data at the edge
    - Train on subset of data points and features (with replacement => can occur multiple times)
1. Decision Trees
    - Interpretation
        * Walk down the tree to find prediction (look at boundary conditions)
        * Edges mean "and" connection
    - Feature Importance
        * Measure how much a feature contributes to the decision (use InfoGain, Gini)
    - Pros
        * captures interactions (only simple ones, interaction = series of splits, can't do non-linear)
        * data grouped by understandable behavior
        * trees make good explanations
    - Cons
        * Have to approximate linear relationships with splits
        * fragile / lack of smoothness: small changes in features cause big changes in prediction
        * unstable: change in data can result in very different tree
        * size/depth is essential for interpretability



# Neural Networks
1. Downsides of previous models
    - Not very expressive
    - Not very scalable (in input dimensions)
    - Manual feature selection
1. Do NNs solve them?
    - Yes, but no longer implicitly interpretable
