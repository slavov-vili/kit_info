# Generative Models
1. Goal: Given training data: generate new samples from the same distribution
1. Density estimation
    - A core problem in unsupervised learning
    - Explicit: define and solve for Pmodel(x)
    - Implicit: learn model that can sample without learning it
        * Train a network which models the distribution
        * The generated distribution should be close to the target one
        * General idea
            + Sample a code vector from a fixed, simple distribution (e.g. spherical Gaussian or uniform distribution)
            + The network computes a differentiable function which maps the vector to an instance in data space (a similar image)
            + Training data: samples which originate from the true data distribution
            + Loss function: how likely is the output to the true data distribution
        * Advantage
            + we have a criterion for evaluating the quality of the output => gradient can be computed
            + this allows for network parameters to be updated to generate better samples



# Generative Adversarial Networks (GANs)
1. Idea
    - Train two different neural networks
    - The generator network tries to produce realistic-looking samples
    - The discriminator network tries to distinguish between images from the training data and the generator network
    - Aka: the generator tries to fool the discriminator
1. Training
    - Train jointly in minmax game
    - Discriminator tries to maximize its objective (real = 1, from generator = 0)
    - Generator tries to minimize its objective (output to discriminator leads to 1)
    - Alternating between gradient ascent and descent
    - Notes
        * In practice, optimizing the generator does not work well
        * The gradient signal is dominated by good samples => cannot improve bad samples
        * Better solution:
            + Generator goal = maximize likelihood of discriminator being wrong
            + Same objective of fooling, but with higher gradient signal for bad samples => works better
1. Evaluating GANs
    - If used for some downstream task - use the metrics in the task (e.g. classification accuracy)
    - What we want from the model
        * Sample quality (generated images should look real)
        * Diverse samples (model should generate a variety of images)
        * Generalization (model should generate new stuff, but just sample data)
    - Inception Score
        * Classify samples using pre-trained classifier model
        * Compare the label distributions of the dataset and the generated output
        * Bad score means
            + the GAN does not generate images of a certain class (no class diversity)
            + the GAN produces bad samples => classification data is useless (bad sample quality)
        * Problem
            + Catches class diversity, but not sample diversity (1 image from a class is enough)
        * Frechet Inception Score
            + Generate features using a pre-trained model
            + Compare them using the Frechet distance
            + Compare the feature distributions of the dataset and the generated output
            + Should solve sample diversity
    - Nearest neighbor
        * Compute features using a pre-trained model
        * Find closest neighbors of the generated images in the training data
            + closest in feature space
        * Should test whether the model memorizes training data
1. Deep Convolutional GANs (DCGANs)
    - Training traditional GANs resulted in 2 pathological behaviors
        * The loss oscillates without converging
        * "mode collapse": the model concentrates on a small subset of the data
    - Performance is hard to assess
    - Radford et al. to solve convolution
        * Replace pooling layers with
            + in Discriminator: strided convolutions
            + in Generator: strided transposed convolutions
        * Use Batchnorm
        * Remove FC hidden layers
        * ReLU in Generator + output uses Tanh
        * LeakyReLU in Discriminator for all
    - Interpretable Vector Math
        * Can add and subtract images to produce outcome (man with glasses - man + woman = woman with glasses)
1. Conditional GANs
    - Until now: model density in high dimension and allow sampling => only useful for synthesis
    - Most use cases require sampling from conditional distribution
        * Examples: next frame prediction, image in-painting, semantic segmentation, image-to-image translation



# Image-to-image Translation
1. Pix2Pix
    - Translates: edges -> realistic photo, image -> segmentation map, gray-scale image -> color image
    - Generator: DCGAN architecture with skip connections (concatenate channels)
    - Discriminator: convnet which scores overlapping patches and averages the final one
1. Cycle GAN
    - Motivation
        * Pix2Pix requires pairs of samples with pixel correspondence
        * Often want to translate between 2 samples (e.g. image of apples -> image of oranges)
        * If we have paired data -> supervised learning. Paired data is hard to find
    - This learns to do that from unpaired data
        * Train 2 generators (1 for each direction)
            + The output of each should be indistinguishable from its real life equivalent
            + => use 2 discriminator networks too
        * Generators should be cycle-consistent
            + mapping A -> B -> A should return the original image
        * Total loss = discriminator loss + reconstruction loss (squared error between original and reconstruction)
1. Advanced GANs (recent development)
    - BigGAN
        * Brock et al.: How do you scale up models?
            + Batch size 2048 => better performance, but unstable in later iterations
            + Models with 160M parameters
            + Sth with noise
        * Able to synthesize diverse 512x512 images
        * In training: class leakage => mix properties of different classes (dog + ball = dogball)
    - SPADE
        * Goal: Semantic Image Synthesis (generate an image which follows a semantic structure)
            + Pix2Pix washes away semantic information
            + encode the semantic mask and then decode the natural image
        * Explanation
            + omit the encoder, inject the semantic mask at different scales into the generator
            + spatially-adaptive (de)normalization (use semantic map to modulate the activations)
