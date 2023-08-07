mage](/image](images//
# Random notes
mage](/image](images//
1. Currently in the praxis not just fully connected layers
mage](/image](images//
1. Notes on 3B1B Video
mage](/image](images//
    - Convolution = list of product sums
mage](/image](images//
    - Useful for combining lists of stuff or functions
mage](/image](images//
    - A smaller window calculates a value based on an area of the input
mage](/image](images//
        * Example: a 5-element array of 0.2 calculates the average value in an area of 5 elements
mage](/image](images//
    - Speed up computation by using Fast Fourier Transformations (FFTs)
mage](/image](images//
        * 
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# Intro
mage](/image](images//
1. Image = fully connected layer?
mage](/image](images//
    - Math: 200x200 pixels = 40K hidden units = 1.6B parameters (40K ^ 2)!
mage](/image](images//
    - a lot of parameters
mage](/image](images//
    - waste of resources
mage](/image](images//
    - no explicit recognition of local (surrounding pixels) correlation
mage](/image](images//
    - not enough data
mage](/image](images//
1. Convolutions
mage](/image](images//
    - Go over data with filter
mage](/image](images//
        * filter = nxn grid which calculates a value for a region of the image
mage](/image](images//
        * go over = move filter along image
mage](/image](images//
    - filter response = multiply function value with weights
mage](/image](images//
    - map each area of the image to a filter response (activation map)
mage](/image](images//
    - ![image](convolution_filter.png)
mage](/image](images//
    - padding
mage](/image](images//
        * Edge pixels not considered => pad image with extra pixels
mage](/image](images//
        * padding = 0 => constant mode, no changes
mage](/image](images//
        * padding = 2
mage](/image](images//
            + ![image](convolution_padding.png)
mage](/image](images//
            + replication mode = keep repeating last pixel in direction
mage](/image](images//
            + reflection mode = mirror the values along an axis
mage](/image](images//

mage](/image](images//
1. Convolution layer
mage](/image](images//
    - image with depth 3, because of RGB (= input channels)
mage](/image](images//
    - convolution operation
mage](/image](images//
        * slide filter / kernel over image with step (stride = X pixels)
mage](/image](images//
        * the filter is the same depth as the image (so that it considers all the data)
mage](/image](images//
        * compute dot product at each location
mage](/image](images//
        * use multiple filters to create multiple activation maps
mage](/image](images//
            + ![image](convolution_activation_maps.png)
mage](/image](images//
            + each filter can calculate a different feature of the image area
mage](/image](images//
            + stack all activation maps into an image
mage](/image](images//
            + this image is the input to the next layer
mage](/image](images//
        * weight sharing = use same weights when moving filter
mage](/image](images//
        * receptive field = area of the image which each neuron uses to generate data (position of filter when calculating neuron value)
mage](/image](images//
    - Math: 200x200 image, 96 filter kernels x 11x11 filter size = 11K parameters (96 * 11 * 11)!!!
mage](/image](images//
    - Reasoning
mage](/image](images//
        * Output size of convolution
mage](/image](images//
            + D = image dimension, K = kernel size, M = image channels (aka kernel depth)
mage](/image](images//
            + Output size = (D - K + 2 x padding) / stride + 1
mage](/image](images//
            + Params: N * M * K * K
mage](/image](images//
        * How many feature maps to use?
mage](/image](images//
            + Usually more than input
mage](/image](images//
    - Use non-linearity
mage](/image](images//
        * The network collapses without it (can't solve non-linear problems)
mage](/image](images//
        * Options:
mage](/image](images//
        * ![image](convolution_non_linearity.png)
mage](/image](images//
        * Use Rectified Linear Unit (ReLU)
mage](/image](images//
            + f(x) = max(0, x)
mage](/image](images//
            + simpler math
mage](/image](images//
            + very fast
mage](/image](images//
            + avoids saturation
mage](/image](images//
        * End result:
mage](/image](images//
        * ![image](formula_convolution.png)
mage](/image](images//

mage](/image](images//
1. Pooling
mage](/image](images//
    - a layer which shrinks the image
mage](/image](images//
        * basically sums up an area of pixels, effectively zooming out of the image
mage](/image](images//
        * sliding window which summarizes the content (similar to convolution)
mage](/image](images//
        * Sum / Average = calculate average of patch
mage](/image](images//
        * Max = calculate max value of patch
mage](/image](images//
    - Reduces computational complexity of next layer (since the image is smaller)
mage](/image](images//
    - introduces invariance to transformations (focuses on presence/absence of feature and not its precise location)
mage](/image](images//
    - improves robustness to noise and clutter
mage](/image](images//

mage](/image](images//
    - Overlapping pooling (stride < patch size)
mage](/image](images//
        * Recall pooling = introduces invariances to small variations
mage](/image](images//
        * s = stride, p = patch size, usually s=2, p=3
mage](/image](images//
        * patches of the image overlap
mage](/image](images//

mage](/image](images//
1. Normalization layer
mage](/image](images//
    - Used to normalize the activations and stuff
mage](/image](images//
    - Can be used on input image to fix high contrast
mage](/image](images//
    - Contrast normalization
mage](/image](images//
        * For each patch: subtract mean and divide by standard deviation
mage](/image](images//
        * Equal response regardless of local contrast
mage](/image](images//
        * Improves invariance, optimization, sparsity
mage](/image](images//
    - Used before, but now other solutions (batch normalization)
mage](/image](images//

mage](/image](images//
1. CNN Block
mage](/image](images//
    - Typical feed-forward CNN
mage](/image](images//
    - ![image](convolution_cnn_block.png)
mage](/image](images//
        1. convolve (filter)
mage](/image](images//
        1. non-linearity (ReLU)
mage](/image](images//
        1. pooling (local max)
mage](/image](images//
        1. normalization (contrast)
mage](/image](images//
        1. repeat
mage](/image](images//
    - Supervised learning
mage](/image](images//
    - Back propagate classification error
mage](/image](images//

mage](/image](images//
1. LeNet
mage](/image](images//
    - handwritten digit classification
mage](/image](images//
    - LeCun et al. 1989
mage](/image](images//
    - multiple convolution and fully connected layers
mage](/image](images//
    - subsampling = pooling
mage](/image](images//
    - ![image](LeNet.png)
mage](/image](images//

mage](/image](images//
1. MNIST
mage](/image](images//
    - Very popular dataset for handwritten digit recognition in the 1990's
mage](/image](images//

mage](/image](images//
1. ImageNet
mage](/image](images//
    - 14K annotated images
mage](/image](images//
    - WordNet hierarchy (cat -> feline -> mammal -> animal -> living thing -> physical entity -> entity)
mage](/image](images//
    - almost 22K classes
mage](/image](images//
    - ImageNet Large Scale Visual Recognition Challenge (ILSVRC)
mage](/image](images//
        * 1000 classes, no ancestry
mage](/image](images//
        * fine-grained categories (120 types of dogs)
mage](/image](images//
        * 1.2M training, 50K validation, 100K test images
mage](/image](images//
        * Metric
mage](/image](images//
            + top-5 error rate (is object in top 5 predictions)
mage](/image](images//
            + accounts for multiple objects in image
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# AlexNet
mage](/image](images//
![image](AlexNet.png)
mage](/image](images//
1. What?
mage](/image](images//
    - First CNN-based winner of the ILSVRC
mage](/image](images//
    - Multiple convolution layers
mage](/image](images//
    - Couple dense (fully connected) layers
mage](/image](images//
    - Final classification using soft-max layer (takes the previous raw input and turns it into probability distributions)
mage](/image](images//
    - Train end-to-end using backpropagation
mage](/image](images//
    - Math:
mage](/image](images//
    - ![image](AlexNet_math.png)
mage](/image](images//
    - filter size vs NW depth
mage](/image](images//
        * multi-GPU not so much these days
mage](/image](images//

mage](/image](images//
1. Implementation
mage](/image](images//
    - CNNs use simple add/multiply = use GPU
mage](/image](images//
    - model complexity is limited by GPU memory
mage](/image](images//
    - Multi-GPU implementations
mage](/image](images//
    - Data parallelism
mage](/image](images//
        * Train same model
mage](/image](images//
        * Share gradients and adjust weights
mage](/image](images//
        * Efficient when gradients are sparse
mage](/image](images//
    - Model parallelism
mage](/image](images//
        * Train different parts of the model on the same data
mage](/image](images//
        * Share neuron activations
mage](/image](images//
    - ZFNet
mage](/image](images//
        * AlexNet with some changes
mage](/image](images//
        * Improved hyperparam
mage](/image](images//
        * CONV 1 = 7x7, stride 2
mage](/image](images//
        * CONV 3,4,5 = 512,1024, 512
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# VGGNet
mage](/image](images//
![image](VGGNet.png)
mage](/image](images//
1. What?
mage](/image](images//
    - Smaller filters, deeper network
mage](/image](images//
    - 16-19 layers, 3x3 Conv stride 1 pad 1, 2x2 max pool stride 2
mage](/image](images//
        * More layers, more non-linearities
mage](/image](images//
        * stack of 3 3x3 conv stride 1 has same **effective receptive field** as 1 7x7 conv
mage](/image](images//
        * fewer parameters
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# Take home
mage](/image](images//
1. CNNs are great feature extractors when there is a lot of data
