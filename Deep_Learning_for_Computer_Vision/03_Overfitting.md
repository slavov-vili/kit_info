mage](/image](images//
# How do classifiers work?
mage](/image](images//
1. Generalization Error = How well the model performs on unseen data
mage](/image](images//

mage](/image](images//
1. Discriminative approach
mage](/image](images//
    - Learn on training data
mage](/image](images//
    - Test data might include values which are misclassified
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# Underfitting
mage](/image](images//
1. What is it?
mage](/image](images//
    - The model is too simple => can't accurately capture relationships between input and target
mage](/image](images//
    - Often leads to error on training data
mage](/image](images//
    - Performs poorly on new data
mage](/image](images//
1. Causes
mage](/image](images//
    - Unclean training data (high noise or outliers => model can't derive patterns)
mage](/image](images//
    - The model is too simple for the task (e.x. linear model, but complex task)
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# Overfitting
mage](/image](images//
1. What is it?
mage](/image](images//
    - The model is too closely aligned with training data => loses applicability to new data points
mage](/image](images//
    - Very good results on training data, but poor on new data
mage](/image](images//
1. Causes
mage](/image](images//
    - Unclean training data (high noise or outliers => model captures the noise)
mage](/image](images//
    - Not enough training data (model trains on limited data multiple epochs)
mage](/image](images//
    - Model architecture complex (optimized for a long time)
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# General idea
mage](/image](images//
1. ![image](graphs_overfitting_underfitting.png)
mage](/image](images//
1. Goal: Good generalization (performance on data points not seen during training)
mage](/image](images//
1. Challenge: optimizing a model on a finite set of training data to perform on new data points (validation/test set)
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# How to avoid overfitting
mage](/image](images//
1. General ideas
mage](/image](images//
    - Add more clean and diverse training data
mage](/image](images//
    - Reduce network capacity
mage](/image](images//
        * reduce the number of neurons and layers
mage](/image](images//
        * reduces the ability of the network to learn complex relationships
mage](/image](images//
        * improves performance
mage](/image](images//
        * too much capacity leads to memorizing training data
mage](/image](images//
    - Model ensembles
mage](/image](images//
        * combine the predictions of multiple (diverse) models
mage](/image](images//
    - Regularization
mage](/image](images//
        * Modification to the learning algorithm
mage](/image](images//
        * Intends to reduce generalization error, but **not** training error
mage](/image](images//

mage](/image](images//
# Regularization methods
mage](/image](images//
1. Weight decay
mage](/image](images//
    - Classical regularization
mage](/image](images//
    - Large weights are a sign of overfitting
mage](/image](images//
    - Shrinks weights during backpropagation by adding a penalty to the cost function
mage](/image](images//
    - The model has to balance between fitting the data and complexity (small weights = less complex?)
mage](/image](images//
    - Optimizes an Objective function (loss function + regularization factor (punishment for large weights))
mage](/image](images//
    - L1 regularization (Lasso)
mage](/image](images//
        * Drives some weights to 0 => Leads to sparse representations
mage](/image](images//
        * Can be used as a feature selector (sparsity eliminates irrelevant or redundant features)
mage](/image](images//
        * Penalty is proportional to the sum of absolute values of the weights
mage](/image](images//
            + L1 Loss = Original Loss + lambda * sum(|x_i|)
mage](/image](images//
            + lambda controls the strength of the regularization
mage](/image](images//
    - L2 regularization (Ridge)
mage](/image](images//
        * Forces the weights to be small, but not exactly 0
mage](/image](images//
        * More continuous shrinkage effect
mage](/image](images//
        * Penalty is proportional to the sum of squares of the weights
mage](/image](images//
            + L2 Loss = Original Loss + lambda * sum(x_i ^ 2)
mage](/image](images//
    - ![image](graphs_overfitting_underfitting.png)
mage](/image](images//

mage](/image](images//
1. Early Stopping
mage](/image](images//
    - Use Validation set to stop training before generalization error increases
mage](/image](images//
    - Effective and simple
mage](/image](images//
    - Costly because of periodically evaluating validation
mage](/image](images//
    - Train/Test/Validation Split
mage](/image](images//
        * Training set
mage](/image](images//
            + Used during the training process to fit the network
mage](/image](images//
            + In supervised learning - labeled data is used to calculate loss
mage](/image](images//
            + For self-supervised learning - no labels
mage](/image](images//
        * Validation set
mage](/image](images//
            + Aka dev(elopment) set
mage](/image](images//
            + A set of example data used to fine-tune the hyperparameters (the architecture)
mage](/image](images//
        * Test set
mage](/image](images//
            + Used to test the model
mage](/image](images//
            + Independent of the training set
mage](/image](images//
            + **but** follows the same probability distribution
mage](/image](images//

mage](/image](images//
1. (n-fold) Cross validation
mage](/image](images//
    - ![image](cross_validation.png)
mage](/image](images//
    - Split training data in subsets of roughly equal size (folds)
mage](/image](images//
    - Training and evaluation
mage](/image](images//
        * Choose a different fold for validation each iteration
mage](/image](images//
        * Train on n-1 folds, validate on the chosen one
mage](/image](images//
        * Evaluation metrics (accuracy or mean square error) are computed each iteration
mage](/image](images//
    - Performance aggregation
mage](/image](images//
        * The metrics from each iteration are averaged/aggregated
mage](/image](images//
        * The result is the estimated performance on new data
mage](/image](images//
    - Advantages
mage](/image](images//
        * Provides a robust and reliable estimate of the model's performance
mage](/image](images//
        * Helps mitigate under- and overfitting which might happen if evaluated on a limited subset
mage](/image](images//
        * Different subsets => more comprehensive evaluation => identify problems with model generalization
mage](/image](images//

mage](/image](images//
1. Data Augmentation
mage](/image](images//
    - Labeling training data is expensive and difficult
mage](/image](images//
    - For more data: alter existing labeled training data
mage](/image](images//
    - Examples
mage](/image](images//
        * Random crops
mage](/image](images//
        * Translations
mage](/image](images//
        * Horizontal reflections
mage](/image](images//
        * Scale
mage](/image](images//
        * Adding Gaussian noise ()
mage](/image](images//
    - **DO NOT DO FOR TESTING!!!**
mage](/image](images//

mage](/image](images//
1. Dropout
mage](/image](images//
    - Regularization technique
mage](/image](images//
    - Training: Disable a random fraction (p) of nodes in each iteration
mage](/image](images//
    - Tries to prevent the network from relying on specific neurons or their combinations
mage](/image](images//
    - Testing: Have to scale weights of un-dropped by factor p (because now more neurons are active)
mage](/image](images//
    - Effective against overfitting
mage](/image](images//
        * Suspected reason: breaks up situations where layers co-adapt to correct mistakes of previous ones
mage](/image](images//
        * Side-effect: activations of hidden units are sparse
mage](/image](images//

mage](/image](images//
1. Batch Normalization
mage](/image](images//
    - Not specifically to fix overfitting, but still very effective
mage](/image](images//
    - Enables:
mage](/image](images//
        * Higher learning rates (faster training)
mage](/image](images//
        * Less sensitive to weight initialization
mage](/image](images//
    - Problem: Internal Covariate Shift (ICS)
mage](/image](images//
        * Weights and biases are updated during backpropagation
mage](/image](images//
        * Input distribution at intermediate layers shifts
mage](/image](images//
            + Input distribution = statistical properties of the input (e.x. some features become more prominent)
mage](/image](images//
            + Shifts, because the weights and biases of the previous layer have been updated
mage](/image](images//
            + Can lead to slower convergence (generally faster if the inputs are normalized)
mage](/image](images//
        * High learning rates are problematic (layers need to continuously adapt to large changes)
mage](/image](images//
    - Solution: Obtain zero-mean unit-variance activations
mage](/image](images//
        1. Compute the mean (average) and the variance (spread / distance from mean) of the batch (independently in each dimension)
mage](/image](images//
        1. Normalize
mage](/image](images//
            + Subtracting the mean centers the distribution around 0
mage](/image](images//
            + Dividing by sqrt(variance) normalizes the distribution and ensures unit variance
mage](/image](images//
        1. Scale and shift through learnable gamma and beta:
mage](/image](images//
            + Forcing strict zero-mean unit-variance limits network expressiveness
mage](/image](images//
            + Learning extra parameters solves this
mage](/image](images//
    - At test time
mage](/image](images//
        * Problem: no batches + desired deterministic output
mage](/image](images//
        * Mean and variance **not** computed based on batch
mage](/image](images//
        * Compute mean and standard deviation during training and use that
mage](/image](images//
            + Using running average (Keep track of running sum and recalculate average each time)
mage](/image](images//

mage](/image](images//
# Model ensembles
mage](/image](images//
1. What?
mage](/image](images//
    - train multiple networks for same task
mage](/image](images//
    - merge results
mage](/image](images//
1. Types
mage](/image](images//
    - Homogeneous
mage](/image](images//
        * Same base learner, used multiple times
mage](/image](images//
        * Diversify training flow (i.e. no 2 models should make the same error on the same data sample)
mage](/image](images//
        * Train with different data samples / initializations / augmentations / regularizations
mage](/image](images//
    - Heterogeneous
mage](/image](images//
        * Use different base models (architecture, learning mechanism, input representation)
mage](/image](images//
        * Each model captures different aspects of the data
mage](/image](images//
        * Results in complementary strengths
mage](/image](images//
    - Sequential
mage](/image](images//
        * Model tries to improve its predecessor
mage](/image](images//
    - Non-sequential
mage](/image](images//
        * Independence between base learners
mage](/image](images//

