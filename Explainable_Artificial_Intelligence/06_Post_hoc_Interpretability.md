# Model Agnostic Interpretation Methods
1. Model Agnostic
    - Can be applied to any model
    - Allows us to compare types of models for interpretability



# Global Methods
1. Describe the average behavior of a model (over the whole data)
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
    - Steps
        * select data instance to get explanation of
        * perturb dataset and get prediction (from the complex model) for new points
        * weight the points based on their distance to the original chosen one
        * train an interpretable model on the perturbed dataset
        * explain the prediction by interpreting the surrogate
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
        * Calculate the marginal contribution of each feature to each permutation where it is present
            + for each feature
            + for each possible permutation of features where it is present
            + marginal contribution to permutation = result with the feature - result without the feature
        * Shapley value of a feature = average of marginal contributions to all permutations
    - Optimization
        * Calculation can be expensive, because operations scale exponentially with features
        * Can be approximated using a Monte-Carlo approach
            + Randomly replace some feature values with those from another instance
            + Calculate prediction(feature present) - prediction(feature not present)
            + Average out
    - Properties
        * Ensure that the values are fair and meaningful
        * Efficiency
            + Contributions sum = prediction for x - avg prediction
            + Makes sure nothing is missing or double counted
        * Symmetry
            * Contributions of two features are the same if they contribute equally to all possible combinations
            * Makes sure that contributions only depend on themselves and not on interactions
        * Dummy
            * If adding a feature does not change the prediction => contribution = 0
            * Helps identify useless features
        * Additivity
            * Contributions of an additively combined model = sum of contributions of individual models
            * Makes them usable with ensamble models
    - Pros
        * Fairly distributes the difference between prediction and avg prediction among the features
        * Allows for comparison of models on subsets of data (no need for avg prediction)
        * Solid theory: 4 properties
    - Cons
        * Hard to compute
        * Can be misinterpreted (does not show change in prediction if feature was omitted during training)
        * No sparse explanations (always uses all features)
        * Includes unrealistic instances
1. SHapley Additive eXplanations (SHAP)
    - Combines Shapley values in an additive model
    - = LIME + Shapley values
    - Additive Feature Attribution
        * Definitions
            + x = input
            + x' = binary vector (simplified local inputs)
            + f(x) = model
            + g(x') = explanatory model
            + p0 = null output of model (avg output)
            + pi = explained feature effect (feature attribution)
        * Definition: g(x') = p0 + Sum(pi * x'i)
    - Desirable Properties
        * Local accuracy
            + if x ~= x', then f(x) ~= g(x')
        * Missingness
            + if feature is exluded => attribution = 0
            + xi' = 0 => pi = 0
        * Consistency
            + if contribution of feature in original model changes
            + the feature effect in the explanatory model cannot change in the opposite direction
    - if feature effects are chosen to be the shapley values => all 3 properties hold
    - Steps (Shapley Kernel)
        * Maintain background dataset (represents the data during training)
        * Create frankenstein sets (foreach)
            + Choose a bunch of features to omit from the data
            + Frankenstein some samples by replacing the omitted features with values from data in the background dataset
            + Calculate new estimate for the set (evaluate the new samples and average the result)
        * Fit the additive model to the new sets
            + Using weighted linear regression over new data
            + weighted sums = shapley values
    - Pros
        * Solid theory
        * Inherits advantages of SV
        * Connects LIME & SV
        * Global model interpretation
        * Fast implementations exist (TreeSHAP)
    - Cons
        * KernelSHAP is slow and ignores feature dependencies
        * Inherits disadvantages of SV
