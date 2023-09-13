# Model Agnostic Interpretation Methods
1. Model Agnostic
    - Can be applied to any model
    - Allows us to compare types of models for interpretability



# Global Methods
1. Describe the average behavior of a model
1. Permutation Feature Importance (FI)
    - Permute a feature and calculate the error
        * if increased => feature is important
        * else => feature is not important
    - Permute = nudge by a little bit
    - Computing on Training set
        * Tells us which features were important during training
    - Computing on Test set
        * FI depends on error -> should be measured on test set
    - Pros
        * Nice interpretation: FI = increase in error if feature is missing
        * Highly compressed, global insight into the model's behavior
        * Very simple
    - Cons
        * Requires ground truth
        * Results may vary depending on permutations
        * Can be biased by unrealistic data
1. Global Surrogate
    - Fit interpretable model (linear, decision tree) on data and prediction of a complex model
    - See how well the surrogate model can predict stuff
    - Interpret the surrogate model
    - Pros
        * Flexible: can use any interpretable model
        * Intuitive
        * R squared easily tells us how good the approximation is
    - Cons
        * Did we learn about the model or the data? (surrogate never sees ground truth)
        * Inherits the disadvantages of the surrogate



# Local Methods
1. Explain individual predictions
1. Local Interpretable Model-agnostic Explanations (LIME)
    - Train local surrogate
    - Find model from a set which minimizes a measure
    - Sth about finding closest points and weighing samples
    - Omega uses LASSO to fit g
    - Steps
        * select data instance to get explanation of
        * perturb dataset and get prediction for new points
        * weight based on distance to original
        * train an interpretable model on the perturbed dataset
        * explain the predictionby interpreting the surrogate
    - Pros
        * Short explanations
        * Works for all data (tabular, text, images)
        * Can use other features than what was trained on
    - Cons
        * Have to define complexity of explanation model in advance
        * Instability of explanations
1. Shapley Values (SVs)
    - Useful for finding out how much each player from a team contributes to the win
    - Naive approach
        * Use other values for the feature and average out the results
        * Problems
            + Unrepresentative instances lead to nonsense output
            + Does not consider interaction
    - Assumption: we can simply remove a feature
    - Calculation
        * Calculate the marginal contribution of each feature to each combination of features
            + for each feature
            + for each possible combination of features
            + marginal contribution = result including the feature - result without the feature
        * Shapley value of a feature = average of marginal contributions
    - Optimization
        * Calculation can be expensive, because operations scale exponentially with features
        * Can be approximated using a Monte-Carlo approach
            + Randomly replace some features with the values from another instance
    - Fair payout == reliable contribution estimate
    - Properties
        * Efficiency
            + Contributions add up to prediction - avg prediction
        * Symmetry
            * Contributions of two features are the same if they contribute equally to all possible combinations
        * Dummy
            * If adding a feature does not change the prediction => contribution = 0
        * Additivity
            * Contributions of an additively combined model = sum of contributions of individual models
    - Pros
        * Fairly distributes the difference between prediction and avg prediction among the features
        * Allows for contrastive predictions
        * Solid theory: 4 properties
    - Cons
        * Hard to compute
        * Can be misinterpreted (does not show change in prediction if feature was omitted during training)
        * No sparse explanations (always uses all features)
        * Includes unrealistic instances
1. Shapley Additive Explanations (SHAP)
    - = LIME + Shapley values
    - Steps
        * Maintain background dataset (represents the data during training)
        * iterate: frankenstein some samples using the features from the background dataset
        * Create new estimate (evaluate the new samples and average the result)
        *  linear regression over new data, weighted sums = shapley values
    - Pros
        * Solid theory
        * Inherits advantages of SV
        * Connects LIME & SV
        * Global model interpretation
        * Fast implementations exist (TreeSHAP)
    - Cons
        * KernelSHAP is slow and ignores feature dependencies
        * Inherits disadvantages of SV
