# Evaluation Function
1. Example: COVID classification
    - True Positive (TP)
    - True Negative (TN)
    - False Positive (FP) = Type 1 error
    - False Negative (FN) = Type 2 error
1. Accuracy
    - = How often the classifier predicts correctly
    - Useful when the class is well balanced
    - = (TP + TN) / (TP + TN + FP + FN)
1. Problem
    - Not everything can be used as a metric
    - Needs to be differentiable



# Loss Function
1. Introduction
    - Measures the quality of a set of parameters based on the difference between prediction and ground truth
    - Does **not** measure entire performance
    - Used to guide the training process (to find parameters which minimize it)
    - Why not optimize on accuracy?
        * Accuracy = 1 - avg(truth - round(prediction))
            + truth = 0-1, prediction = 0-1 (softmax)
        * Rounding is **not** differentiable
        * Max accuracy = min residual error => Gradient becomes flat
1. Cross Entropy (CE) loss
    - Decreases as the prediction gets closer to the actual label
1. Data Sampling
    - Above methods bad when classes are imbalanced (NW learns the majority class)
    - How to fix?
        * Undersampling for majority class
            + Removes samples => model can miss out on learning important features
        * Oversampling for minority class
            + Intriduces duplicates => slows down training and leads to overfitting
1. Sample Weights in Loss Function
    - Higher weights to the loss for samples from the minority class
    - Lower weights to the loss from the samples from the majority class
    - Variations
        * Inverse of Number of Samples (INS)
            + weight = 1 / number of samples
        * Inverse of Square Root of Number of Samples (ISNS)
            + weight = 1 / sqrt(number of samples)
        * Effective Number of Samples (ENS)
            + weight = 1 / En
            + En = (1 - beta ^ n) / (1 - beta)
            + n = number of samples of class
            + beta = 1 - 1 / N
1. Cost-sensitive classification
    - Only predict high-cost classes if very confident
    - Prediction cost = dot product of class probability vector and cost matrix (1 if wrong)
    - Training: oversample or weight costly confusions
1. Focal loss
    - Other functions are distracted by easy samples (imbalance in difficulty, not in sample size)
    - Adds factor which reduces loss for easy examples => network focuses on learning the hard ones
        * (1 - prediction) ^ gamma
1. Loss Function with Constraints
    - Regularization
        * Goal: Control overfitting prevention, reduce model complexity
        * Idea: Add complexity penalty to loss function
        * L2: complexity = sum of squares of weights
        * L1: complexity = sum of abs values of weights
        * L1 = sparser solutions (less important features get coefficient 0)
    - Network pruning
        * Goal: decrease
            + run-time memory footprint
            + model size
            + number of computations, without compromising accuracy
        * Idea: assign scaling factor to a specific convolutional channel
    - Hardware aware Neural Architecture Search (NAS)
        * Goal: design accurate and efficient networks for edge devices
        * Try to find an architecture which achieves minimal loss after training
            + Use a factor which takes into account latency and whatnot
    - Center Loss Function
        * Data in classes very close to boundaries (irrelevant for training)
        * We want to pull them together around a learned center
    - Why not optimize on precision and recall?
        * Not differentiable
1. Two-Stage Training: Contrastive loss function
    - Makes the network learn an embedding which places samples with same labels together
    - Stage 1 = Use the contrastive loss function to teach an encoder to embed samples given their labels
    - Stage 2 = Learn a classifier on the learned embeddings to predict the labels using cross-entropy loss

