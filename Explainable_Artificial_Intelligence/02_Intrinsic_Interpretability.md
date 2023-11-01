# Interpretable Models
1. Simple models



# Linear Models
1. Linear Regression
    - regression = train model to learn a function which predicts y given x
    - y = linear combination of features (x)
    - Interpretation
        * How does small change in a feature affect the outcome?
            + Assumes no interaction between features
            + Change by 1 shows affect of weight on output
1. Training
    - Train using Ordinary Least Squares (OLS)
        * OLS = vertical distance from datapoint to line
        * = algorithm interpretation (how was the model learned)
        * Assumes there is noise (epsilon)
        * Alternative: Total Least Squares (TLS)
            + Also considers uncertainty along the features (minimize distance to line)
            + = distance is calculated perpendicularly to the line
1. Evaluating
    - R^2 = shows how well the model matches the data
        * Interpretation
            + proportion of variance in the y which is explained by x
            + e.x. 0.8 = 80% is explained, 20% isn't
            + -> 1 = better match
            + -> 0 = worse match
            + < 0 = learning the complete opposite
        * = 1 - (SSE / SST)
        * Sum of Squared Errors (SSE)
            + = Total error between data and line
            + = Sum (residual)^2
            + Residual = y - y^ (actual - prediction)
            + Least squares = find line with min SSE
        * Total Sum of Squares (SST)
            + = Total variability in y
            + Sum (y - avg y)^2
    - t-statistic
        * interprets importance of feature
        * = weight / StandardError(weight)
1. Assumptions
    - Linearity = Data is linear in the features
    - Normality = prediction follows a normal distribution
    - Homoscedasticity = prediction error has constant variance
    - Independence = data in independent (no random effects = accidentally measure same person twice)
    - Fixed features = no measurement error in given features
    - Absence of multicollinearity = strong correlations cause singularity
        * The weights cancel each other out (high + low = infinite solutions)
1. Regularization
    - Many features = more correlation => try to encourage sparsity
    - Represented as ellipsis
        * = Set of all solutions, center = best
    - Ridge Regression
        * Adds lambda = penalty for the Sum of squared residuals (green circle)
        * lambda = L2 regularization term
        * Try to find where the circle and the ellipsis meet
        * Optimal values shift towards 0, but are never 0
    - LASSO Regression (Least Absolute Shrinkage and Selection Operator)
        * Introduces L1 regularization term
        * We want the intersection to be on one of the axes (one of the weights)
        * Encourages sparsity (of feature vectors)
            + Because some coefficients manage to go all the way to 0
        * Uses sum of abs values instead of sum of squares
        * Optimal values shift towards 0 and end up at 0
    - Pros
        * Easy to understand
        * Widely applied => well understood
        * Easy to asses how individual features contribute
        * Guarantees the optimal solution
    - Cons
        * Can only model linear relationships (between features and output)
        * Limited predictive performance
        * Weights can be unintuitive (can be negative in order to cancel a co-relating)
1. Generalized Linear Models (GLM)
    - Representation of stuff as GLMs
    - Allows the modelling of non-normal distributions
    - Uses link function to adjust to distributions
        * Link function = transforms the expected value to the linear prediction
            + The function needs to be chosen in a way that the expected value follows the distribution of the data
        * Examples
            + Identity link: used when the data follows a Gaussian (normal) distribution (g(y) = y)
            + Logit link: used for binomial distribution (binary classification); transforms predictor to probability (0-1) (g(y) = log(y / (1-y)))
            + Log link: used for Poisson distribution (count data); assures positive output (g(y) = log(y))
            + Softmax link: used for multinomial distribution (multi-class classification); transforms predictor to probabilities for each class (g(y) = exp(x) / Sum(exp(y)))
    - Interpretation
        * Of weights depends heavily on the link function
        * Example: Log-link
            + g(m) = ln(m) = Sum(bi * xi)
            + => m = exp(Sum(bi * xi)) = Multiply(exp(bi * xi))
            + = E[y|x] = Expected y given x
            + Increase of feature xi by 1 unit increases the prediction by exp(bi)
    - Pros
        * No longer restricted by normality assumption
        * Can train on non-linear data, while retaining linear relationship between data and weights
    - Cons
        * Link function complicates interpretability of weights and features
        * Still restricted to linear relationships
1. Logistic Regression
    - Allows to use linear models for classification
    - Uses the sigmoid function (logistic function) to transform the prediction into a probability value
        * = 1 / (1 + e^(- linear combination))
    - Assigns classes to the input based on a threshold (usually 0.5)
    - Why can't we just regress on the data?
        * The slope of the line changes as new data is added
    - Interpretation
        * Not as simple: odds of sth happening
    - Pros
        * Widely applied => well understood
        * Weights somewhat interpretable
        * Provides probabilities for the classification
    - Cons
        * No automatic feature interaction
        * Theoretically infinite weight for a feature which perfectly separates the data
            + Makes fitting impossible
            + Paradox: a single great feature makes it unusable
    - Basically a perceptron which uses sigmoid as activation
        * Usually another activation is used (ReLU)



# Generalized Additive Models (GAMs)
1. What?
    - Y = additive predictor (sum of fi(xi) terms + bi)
    - fi = smooth functions
        * can be any function instead of just weight coefficients
        * fi used to model non-linear relationship between predictor (Y) and response
    - Models interactions by adding interaction terms to additive predictors
    - Don't have to specify fi precisely
        * Rather estimate them
        * Define a natural cubic spline for each f
    - Why restrict fs to a class?
        *
    - For each feature: keep others fixed and fit
    - Can look at separate feature contributions to outcome
    - Pros
        * Model complex relationships
        * Smooth functions can capture non-linear, non-monotonic and interactive effects
        * Provide valuable insight into the direction of feature effects
    - Cons
        * Interpretation can be challenging because of smooth functions
        * Selecting suitable smooth function can be challenging