mage](/image](images//
# Modern CNN Revolution
mage](/image](images//
1. Networks are getting deeper
mage](/image](images//
    - Getting good results in the ILSVRC
mage](/image](images//
1. How deep?
mage](/image](images//
    - 16-19 weight values
mage](/image](images//
    - small, simple filters: reduces number of weights
mage](/image](images//
    - small receptive fields: 3x3
mage](/image](images//
    - Receptive field = area of the image to which a given neuron is sensitive to
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# CNN as feature extractors
mage](/image](images//
1. Deep Convolutional Activation Feature for Generic Visual Recognition (DeCAF)
mage](/image](images//
    - Goal: describe the image, not just classification
mage](/image](images//
    - Deep networks automatically learn good features
mage](/image](images//
    - Hierarchy of filters: simple edges -> parts of objects -> objects
mage](/image](images//
    - Last layer is typically the softmax
mage](/image](images//
    - Train network end-to-end on classification
mage](/image](images//
    - Use pre-trained network
mage](/image](images//
        * classification for other tasks on the images (scene recognition)
mage](/image](images//
        * for different tasks: switch last layer and train for a few epochs
mage](/image](images//
        * for feature extraction: remove last layer and use the hidden unit values
mage](/image](images//

mage](/image](images//
1. DeepFace
mage](/image](images//
    - Deep networks as face feature extractors
mage](/image](images//
        * ![image](DeepFace.png)
mage](/image](images//
        * Input = 3D aligned face image
mage](/image](images//
        * L4,L5,L6: 4096 dim representation (locally connected filters)
mage](/image](images//
        * F7,F8: feature representation (fully-connected)
mage](/image](images//
        * No more max pooling, since the images are only faces and already aligned
mage](/image](images//
    - Without last layer -> very discriminating (similar faces -> similar results)
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# Further CNN Networks
mage](/image](images//
1. GoogleNet
mage](/image](images//
    - ![image](GoogleNet.png)
mage](/image](images//
        * Stem Network
mage](/image](images//
        * Stacked Inception Modules
mage](/image](images//
        * 2x Auxiliary Loss layers
mage](/image](images//
        * Output = Average pooling + 1 linear layer
mage](/image](images//
    - FC = fully connected
mage](/image](images//
    - Features:
mage](/image](images//
        * 22 layers
mage](/image](images//
        * No FC layers
mage](/image](images//
        * Inception module = network within network
mage](/image](images//
        * Only 5M parameters (12x less than AlexNet!)
mage](/image](images//
    - Stack inception modules
mage](/image](images//
    - Naive inception module:
mage](/image](images//
        * Apply multiple convolutions (filters) in parallel
mage](/image](images//
            + multiple receptive fields: 1x1, 3x3, 5x5
mage](/image](images//
        * Concatenate the outputs with pooling depth-wise
mage](/image](images//
        * ![image](naive_inception_module.png)
mage](/image](images//
        * Problem: lots of channels and computation ops
mage](/image](images//
            + pooling preserves depth
mage](/image](images//
    - Solution: Bottleneck layers
mage](/image](images//
        * Reduce the depth of the previous layer's output
mage](/image](images//
            + 1x1 convolution layers with smaller depth
mage](/image](images//
    - Classifier architecture
mage](/image](images//
        * Average pooling + 1 linear layer instead of FC layers
mage](/image](images//
        * Global Average Pooling
mage](/image](images//
            + Calculate average value for each feature map and store as vector
mage](/image](images//
            + Use softmax on that
mage](/image](images//
            + less parameters & better performance than FC
mage](/image](images//
    - Auxiliary Loss Layers
mage](/image](images//
        * Tries to fix the vanishing gradient problem
mage](/image](images//
            + During backpropagation, the gradients might get too small and not be useful for changing the weights
mage](/image](images//
        * The auxiliary layers are basically small classifiers
mage](/image](images//
            + They predict a label based on the previous layers
mage](/image](images//
            + Their loss and gradient are propagated backwards
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
1. ResNet
mage](/image](images//
    - Depth Revolution
mage](/image](images//
        * Deep networks with residual connections
mage](/image](images//
    - Why?
mage](/image](images//
        * Deep Networks perform better up until a certain point
mage](/image](images//
            + At some point no longer due to overfitting
mage](/image](images//
        * Solution
mage](/image](images//
            + Residual block passes input identity around convolutional layers
mage](/image](images//
            + Then add output + identity element-wise
mage](/image](images//
            + ![image](residual_block.png)
mage](/image](images//
        * Idea:
mage](/image](images//
            + Instead of learning the whole transformation (input -> output)
mage](/image](images//
            + Learn small changes between current state and expected value
mage](/image](images//
    - Full architecture
mage](/image](images//
        * Stack residual blocks
mage](/image](images//
        * Each has two 3x3 layers
mage](/image](images//
        * Periodically double the number of filters and downsample by 2
mage](/image](images//
        * Extra conv layer at the beginning
mage](/image](images//
        * No FC at the end
mage](/image](images//
        * Global average pooling after last conv layer
mage](/image](images//
    - Improving
mage](/image](images//
        * Identity Mappings in Deep Residual Networks
mage](/image](images//
            + Improves block design, more direct path for propagating information
mage](/image](images//
        * Wide Residual Networks
mage](/image](images//
            + ![image](wide_resnet_block.png)
mage](/image](images//
            + More shallow network, but wider
mage](/image](images//
            + Argues that residuals are more important than depth
mage](/image](images//
            + Outperforms the original, more performant (parallelization)
mage](/image](images//
        * ResNeXt
mage](/image](images//
            + ![image](resnext_block.png)
mage](/image](images//
            + Increases width through multiple parallel pathways
mage](/image](images//
            + Similar to the Inception module
mage](/image](images//
    - DenseNet
mage](/image](images//
        * ![image](densenet_block.png)
mage](/image](images//
        * Densely connected layers (every layer connected to every other one)
mage](/image](images//
        * Alleviates vanishing gradient
mage](/image](images//
        * Strenghtens feature propagation
mage](/image](images//
        * Encourages feature reuse
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
1. MobileNet
mage](/image](images//
    - Properties
mage](/image](images//
        * Useful for mobile and embedded vision applications
mage](/image](images//
        * Smaller models (fewer params)
mage](/image](images//
        * Less complexity (fewer multiplications and additions)
mage](/image](images//
    - Splits depthwise and pointwise convolution
mage](/image](images//
        * depthwise = convolve for each channel with wider, but shallow filter: depth x depth x 1
mage](/image](images//
        * pointwise = convolve with a narrow, but deep filter 1x1xdepth
mage](/image](images//
        * Convolve for each channel, then concatenate (1x1 convolution on all channels)
mage](/image](images//
    - ![image](MobileNet.png)
mage](/image](images//
    - Math
mage](/image](images//
        * Example:
mage](/image](images//
            + Input = 12x12x3
mage](/image](images//
            + Output = 8x8x256
mage](/image](images//
        * Usually: 256 5x5x3 kernels = 256x5x5x3x8x8 = 1.228M multiplications
mage](/image](images//
        * Depthwise: 3 5x5x1 kernels = 3x5x5x1x8x8 = 4800
mage](/image](images//
        * Pointwise: 256 1x1x3 kernels = 256x1x1x3x8x8 = 49K
mage](/image](images//
        * Total: ~54K multiplications
