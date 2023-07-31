# Interpretable Models
1. Simple models



# Linear Models
1. Linear Regression
    - y = linear combination of features
    - Draw line across data to split it
    - Solve using Ordinary Least Squares (OLS)
        * = algorithm interpretation (how was the model learned)
        * Assumes there is noise (epsilon)
    - Alternative: Total Least Squares (TLS)
        * Also considers uncertainty along the features (minimize distance to line)
    - Interpretation
        * How does small change in a feature affect the outcome?
            + Assumes no interaction between features
            + Change by 1 shows affect of weight on output
    - R^2 = shows how well the model matches the data
        * < 0 = learning the complete opposite
    - t-statistic
        * interprets importance of feature
    - Useful when:
        * Linearity = Data is linear in the features
        * Normality = prediction follows a normal distribution
        * Homoscedasticity = prediction error has constant variance
        * Independence = data in independent (no random effects = accidentally measure same person twice)
        * Fixed features = no measurement error in given features
        * Absence of multicollinearity = strong correlations cause singularity
            + The weights cancel each other out (high + low = infinite solutions)
    - Represented as ellipsis
        * = Set of all solutions, center = best
    - Ridge Regression
        * Adds lambda = green circle
        * Try to find where the circle and the ellipsis meet
    - LASSO Regression (Least Absolute Shrinkage and Selection Operator)
        * We want the intersection to be on one of the axes (one of the weights)
        * Encourages sparsity (of feature vectors)
    - Pros
        * 
    - Cons
1. Generalized Linear Models (GLM)
    - Representation of stuff as GLMs
    - Allows the modelling of non-normal distributions
    - Interpretation
        * Of weights depends heavily on the link function
    - Pros
    - Cons
1. Logistic Regression
    - Allows to use linear models for classification
    - Why can't we just regress on the data?
        * The slope of the line changes as new data is added
    - Interpretation
        * Not as simple: odds of sth happening
        * 
    - Perceptrons
        * 



# Generalized Additive Models (GAMs)
1. What?
    - Any function instead of weight coefficients (f = smooth function)
    - Don't have to specify fs precisely
    - Define a natural cubic spline for each f
    - Why restrict fs to a class?
        *
    - For each feature: keep others fixed and fit
    - Can look at separate feature contributions to outcome
