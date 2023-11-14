# Machine learning approaches to NLP
1. Traditional approaches: more hand-made/designed
1. Basics
    - Deep learning
        * Automates feature extraction
        * Uses smaller, but more dense representations
        * Representations can be reused between tasks (trained on lots of data and used where not as much data)
    - Perceptrons
        * TODO: image
        * Activation function lets us represent a series of sums as just one
        * Need fixed-size inputs, because other we don't know what weights to use
    - Multi-layer perceptron
        * TODO: image
        * Layers of perceptrons
    - Supervised learning
        * Calculate error function (output vs target)
        * Mean square error 
        * Cross entropy
        * TODO: images
    - Stochastic Gradient Descent
        * TODO: image
        * Try to minimize error function
        * Approach
            + Calculate current error
            + Calculate derivative with respect to parameter (weight) 
            + Update weight
        * Stochastic = only calculate for a subset of samples
    - Backpropagation
        * Needed to propagate the error back through the network
        * Calculates the contribution of each weight to the error
1. Input representation
    - Word encoding
        * 1 hot encoding
        * vector of length: vocabulary size
        * word has 1 at it's position in the vocabulary, otherwise - 0
        * Properties
            + All words are equally similar in the beginning (learned during training)
            + Large amount of features
    - Sparse vs dense vectors
        * TODO: explain
    - Motivation
        * Learn dense representation
        * Local view
        * Global view



# Local view of words
1. Language models
    - Goal: estimate next word, given previous ones
    - Problems:
        * TODO: explain
    - Neural networks
        * Map words to continuous word representation
        * TODO: what else?
    - Feed-forward neural network
        * TODO: image
            + Uses same parameters in all layers (less parameters + learns more about words)
            + Input order is important, it's not a bag-of-words representation
        * Self-supervised learning (no labels, custom learning goal)
        * Model = classification problem
        * Input = n-1 last words
        * Output: probability of each word in the vocabulary being next
        * Better, because continuous space
            + Count-based models work in discrete space (expect exact match)
            + Words with similar context occur in same context => can predict probability for new words
        * Learn mapping between spaces (TODO: image)
    - Word embeddings
        * TODO: explain
    - Neural Network Language Model
        * TODO: explain
    - Word2Vec
        * TODO: explain N-gram Language Models
        * TODO: explain
