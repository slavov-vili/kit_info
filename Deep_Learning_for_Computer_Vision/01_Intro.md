# Computer Vision basics
1. Classic approach
    - Image -> Feature Extraction -> Classification
    - Features = colors, edges, optical flow
    - Classification = Machine Learning



# Machine Learning in Computer Vision
1. Classification = What is this object?
1. ^ + Localization = What and where is the object?
1. Object Detection = Recognize multiple classes of objects
1. Instance Segmentation = detect objects and differentiate instances



# Deep Neural Network
1. Basics
    - Input layer -> N Hidden layers -> Output layer
    - Fully connected neurons between layers
    - Each neuron weights the input

1. Process
    - Stochastic Gradient Descent
    - Backpropagation
    - Error function minimization

1. Explanations
    - Deep, because each layer seems small part of previous layer (preserves locality)
    - Each layer learns more high-level (complex) features

# Pros and Cons of Deep Learning
1. Pros
    - Good performance for many problems
    - Straightforward architecture
    - Reasonable training times (on GPUs)
    - Human-like behavior

1. Cons
    - Need DATA!
    - Need GPUs!
    - Slower inference than decision trees
    - Difficult to integrate
    - Difficult to debug

