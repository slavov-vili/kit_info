mage](/image](images//
# Traditional Computer Vision
mage](/image](images//
1. Input -> hand-crafted features -> learning algorithm
mage](/image](images//
1. Popular features
mage](/image](images//
    - ![image](images/popular_features.png)
mage](/image](images//
    - Scale-Invariant Feature Transformation (SIFT)
mage](/image](images//
        * Use reference images to extract keypoints and store them in a database
mage](/image](images//
        * Compare features from a new image to the database and find potential candidates
mage](/image](images//
        * Matches need to agree on the object's shape, location, scale and orientation
mage](/image](images//
        * Probability of an object's presence is calculated based on fit and probable false matches
mage](/image](images//
    - Gabor Filter
mage](/image](images//
        * Linear filter used for texture analysis
mage](/image](images//
    - Histogram of Orient Gradients (HoG)
mage](/image](images//
        * Counts occurrences of gradient orientations
mage](/image](images//

mage](/image](images//
# Machine Learning concepts
mage](/image](images//
1. Learning feature hierarchy
mage](/image](images//
    - Input (pixels) -> low-level features (edges) -> mid-level (object parts) -> high-level (objects) -> Trainable Classifier
mage](/image](images//
    - Feature Learning Compass
mage](/image](images//
    - ![image](images/feature_learning_compass.png)
mage](/image](images//
1. Train/Test/Validation Splits
mage](/image](images//
    - Supervised = labeled data is used for loss calculation
mage](/image](images//
    - Self-Supervised = no labeled data
mage](/image](images//
1. Single-Layer Perceptron
mage](/image](images//
    - ![image](images/single_layer_perceptron.png)
mage](/image](images//
    - Inspired by information processing in biological nervous system
mage](/image](images//
    - Input -> Process -> Output
mage](/image](images//
    - Weighted sum & activation function (non-linear: binary step, Sigmoid, ReLU)
mage](/image](images//
    - Without activation function = linear regression model
mage](/image](images//
1. Multi-Layer Perceptron (MLP)
mage](/image](images//
    - ![image](images/multi_layer_perceptron.png)
mage](/image](images//
    - Combining layers allows the representation of non-linear functions
mage](/image](images//
    - Single-layer cannot implement simple functions like NOT or XOR
mage](/image](images//
    - Neural Network = MLP with multiple hidden layers?
mage](/image](images//
    - What is a good classification network?
mage](/image](images//
        * ![image](images/softmax_layer_example.png)
mage](/image](images//
        * Final softmax layer
mage](/image](images//
            + Takes the output of the last layer (logits) and converts them to probabilities for each class
mage](/image](images//
            + The probabilities sum up to 1
mage](/image](images//
            + Probability of class c_i given input image x (o = logits)
mage](/image](images//
            + ![image](images/formula_class_probability_softmax.png)
mage](/image](images//
    - Reasoning
mage](/image](images//
        * Q: Why need non-linearity? | A: Composition of linear functions = linear => network collapses to regression.
mage](/image](images//
        * Q: How many layers / hidden units? | A: Hyper-parameters, best set using cross-validation. Wider and deeper = complicated function mapping.
mage](/image](images//
        * Q: Why many layers? | A: Data with hierarchical structure => hierarchical model architecture allows to reuse intermediate feature (vehicles have wheels).
mage](/image](images//
        * Q: Why deeper and not wider? | A: Wider networks memorize data => overfitting. Deeper learn and generalize.
mage](/image](images//
    - Training
mage](/image](images//
        * Initialize weights and biases for every layer
mage](/image](images//
        * Calculate the loss L(x,y; Theta)
mage](/image](images//
            + x = input, y = labels, Theta = model
mage](/image](images//
        * Update weights and biases based on loss gradient ![image](images/formula_loss_gradient.png)
mage](/image](images//
            + How do you compute the gradient? **Backpropagation**!
mage](/image](images//
        * Forward propagation
mage](/image](images//
        * Compute network output given the input
mage](/image](images//
        * Non-linearity = ReLU
mage](/image](images//
    - Backpropagation
mage](/image](images//
        * Explanation
mage](/image](images//
            + Allows us to calculate the gradient of the loss function at each layer
mage](/image](images//
            + Gradient = direction in which the function changes most quickly (generalization of the derivative)
mage](/image](images//
            + Does this using the chain rule
mage](/image](images//
        * Chair Rule
mage](/image](images//
            + (f(g(x)))' = f'(g(x)) * f(g'(x))
mage](/image](images//
            + Derivatives of loss in first layer:
mage](/image](images//
            + ![image](images/chain_rule_first_layer.png)
mage](/image](images//
            + Doable, because we started from the last one backwards (see computation graph)
mage](/image](images//
            + Derivatives of loss in last layer:
mage](/image](images//
            + ![image](images/chain_rule_last_layer.png)
mage](/image](images//
        * Using Gradient Descent
mage](/image](images//
            + Use the previously calculated gradient to adjust the various weights and biases
mage](/image](images//
            + ![image](images/formula_gradient_descent_update.png)
mage](/image](images//
            + eta = learning rate
mage](/image](images//
        * Classic / Batch Gradient Descent
mage](/image](images//
            + Update parameters based on the gradient of the loss function
mage](/image](images//
            + Converges to global minimum for convex surfaces and local minimum for non-convex surfaces
mage](/image](images//
            + Sum is expensive for large N (memory size!)
mage](/image](images//
        * Stochastic / Mini-Batch Gradient Descent
mage](/image](images//
            + Incremental training: Break data into mini batches and update based on those
mage](/image](images//
            + Almost certainly global for convex, same for non-convex
mage](/image](images//
1. Challenges to Gradient Descent
mage](/image](images//
    - Choosing the learning rate
mage](/image](images//
        * Crucial hyperparameter for weight updates
mage](/image](images//
        * too large = fluctuate around minimum OR diverge
mage](/image](images//
        * too small = converges very slowly
mage](/image](images//
    - Non-convex loss functions
mage](/image](images//
        * Most error functions highly non-convex
mage](/image](images//
        * => Problem: Many sub optimal local minima
mage](/image](images//
    - Momentum
mage](/image](images//
        * Hyperparameter (usually 0.9)
mage](/image](images//
        * Takes gradient from previous steps into account
mage](/image](images//
        * Gradient changes in same direction => accelerate => faster convergence
mage](/image](images//
        * Gradient changes direction => reduce updates => less fluctuations
mage](/image](images//
1. Annealing the learning rate
mage](/image](images//
    - Gradually reducing the learning rate helps with training
mage](/image](images//
    - Nesterov accelerated gradient descent
mage](/image](images//
        * Modification of the Momentum update
mage](/image](images//
        * Calculate the gradient at approximate future position and then update
mage](/image](images//
    - Adagrad
mage](/image](images//
        * Adapt the learning rate depending on the weights
mage](/image](images//
        * Each weight is modified with a different learning rate, depending on past gradients (high gradient = reduced learning rate)
mage](/image](images//
    - Adadelta
mage](/image](images//
        * Adagrad with less aggressive decay
mage](/image](images//
        * Fixed size of window of past gradients
mage](/image](images//
    - Adam
mage](/image](images//
        * Adadelta with momentum
mage](/image](images//
1. Activation functions
mage](/image](images//
    - Non-linear functions
mage](/image](images//
    - Decide when the neuron will "fire".
mage](/image](images//
    - Take as input the linear sum from the previous layer
mage](/image](images//
    - Should be differentiable (because of backpropagation)
mage](/image](images//
    - Classics: Sigmoid, Tanh
mage](/image](images//
    - Modern: ReLU, Leaky ReLU, Maxout, ...
mage](/image](images//
    - Sigmoid function
mage](/image](images//
    - ![image](images/sigmoid_function.png)
mage](/image](images//
        * = 1 / (1 + e ^ -x)
mage](/image](images//
        * Large negative numbers = 0, large positive ones = 1
mage](/image](images//
        * Common in the past, rarely today
mage](/image](images//
        * Drawbacks
mage](/image](images//
            + Vanishing gradient: almost zero at either tail
mage](/image](images//
            + Output non-zero centered. Bad, because input often non-zero centered.
mage](/image](images//
            + All positive input => weight gradients either all positive or all negative => zigzagging movement
mage](/image](images//
    - Tanh function
mage](/image](images//
    - ![image](images/tanh_function.png)
mage](/image](images//
        * Similar to sigmoid: large nagative numbers = -1, large positive ones = 1
mage](/image](images//
        * Zero-centered
mage](/image](images//
        * Drawback: vanishing gradient
mage](/image](images//
    - Rectified Linear Unit (ReLU)
mage](/image](images//
    - ![image](images/relu_function.png)
mage](/image](images//
        * = max(0, x)
mage](/image](images//
        * Simple, inexpensive (comparison, addition, multiplication)
mage](/image](images//
        * Efficient gradient propagation (no vanishing gradient)
mage](/image](images//
        * Greatly accelerates the convergence of stochastic gradient descent (compared to sigmoid and tanh)
mage](/image](images//
        * Drawback: Dying ReLU Problem
mage](/image](images//
            + Large gradient flow can cause the neuron to never fire again (weights and biases always result in 0)
mage](/image](images//
        * Leaky ReLU
mage](/image](images//
            + Tries to fix the Dying ReLU Problem
mage](/image](images//
            + Instead of 0, have small slope for negative values
mage](/image](images//
            + = max (a * x, x)
mage](/image](images//
            + a = small constant, defines the slope for negative values
mage](/image](images//
    - Maxout
mage](/image](images//
        * Fixes the Dying ReLU Problem
mage](/image](images//
        * Generalizes ReLU and Leaky ReLU
mage](/image](images//
        * = max (w1 * x + b1, w2 * x + b2)
mage](/image](images//
        * Drawback: doubles the number of parameters
mage](/image](images//
    - Tips
mage](/image](images//
        * Choice of function can affect performance
mage](/image](images//
        * Use ReLU and take care of the learning rate (because else - dead units)
mage](/image](images//
        * Alternatively Leaky ReLU or Maxout
mage](/image](images//
        * Tanh is fun, but worse
mage](/image](images//
        * Don't use Sigmoid
mage](/image](images//
1. Loss Functions
mage](/image](images//
    - Quantifies how good the model is
mage](/image](images//
    - Depends on the task
mage](/image](images//
        * Classification
mage](/image](images//
            + Predicting a discrete (distinct / separate) class label
mage](/image](images//
            + Loss: negative log-likelihood
mage](/image](images//
            + ![image](images/formula_negative_log_likelihood.png)
mage](/image](images//
            + Used in multi class classification methods for NN training
mage](/image](images//
            + Hinge loss: used in Support Vector Machines
mage](/image](images//
            + ![image](images/formula_hinge_loss.png)
mage](/image](images//
        * Regression
mage](/image](images//
            + Minimize the distance between the predicted and the true value
mage](/image](images//
            + Predicting continuous numerical values
mage](/image](images//
            + L1-Loss (Mean Average Error)
mage](/image](images//
            + ![image](images/formula_mean_average_error.png)
mage](/image](images//
            + L2-Loss (Mean Square Error)
mage](/image](images//
            + ![image](images/formula_mean_square_error.png)
mage](/image](images//
        * Metric / Similarity Learning
mage](/image](images//
            + Measure distance (similarity) between objects
mage](/image](images//
            + Input: 3 images: anchor, similar, dissimilar
mage](/image](images//
            + Output: A model which produces a representation as a triplet
mage](/image](images//
            + ![image](images/formula_triplet_loss.png)
