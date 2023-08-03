# Model Agnostic Interpretation Methods
1. Global Methods
    - Permutation Feature Importance
        * Permute = nudge by a little bit
    - Global Surrogate
        * Fit interpretable model on data and prediction of another model
        * See how well the surrogate model can predict stuff
1. Local Methods
    - Local Interpretable Model-agnostic Explanations (LIME)
        * Train local surrogate
        * Find model from a set which minimizes a measure
        * Sth about finding closest points and weighing samples
        * Omega uses LASSO to fit g
        * Steps
            + select instance, perturb dataset, weight based on distance to original, train, explain by interpreting
        * 
    - Shapley Values (SVs)
        * 
    - Shapley Additive Explanations (SHAP)
        * g(z') = local function that we want to fit to sth
        * f^(hx(z')) = model output / Shapley value?
        * bg dataset, frankenstein, average, new dataset
        * regress over new data, weighted sums = shapley values
        * Consistency so that the SVs are fair
