# Modern CNN Revolution
1. Networks are getting deeper
    - Getting good results in the ILSVRC
1. How deep?
    - 16-19 weight values
    - small, simple filters: reduces number of weights
    - small receptive fields: 3x3



# CNN as feature extractors
1. Deep Convolutional Activation Feature for Generic Visual Recognition (DeCAF)
    - Goal: describe the image, not just classification
    - Deep networks automatically learn good features
    - Hierarchy of filters: simple edges, parts of objects, objects
    - Last layer is typically the softmax
    - Train network end-to-end on classification
    - Use pre-trained network
        * classification for other tasks on the images (scene recognition)
        * for different tasks: switch last layer and train for a few epochs
        * for feature extraction: remove last layer and use the hidden unit values

1. DeepFace
    - Deep networks as face feature extractors
        * 3D aligned face image
        * C1: 32 filters, 11x11x3 (3 = RGB layers)
        * M2: 3x3, stride 2 (max pooling)
        * C3: 16 filters, 9x9x32
        * L4,L5,L6: 4096 dim representation (locally connected filters)
        * F7,F8: feature representation (fully-connected)
        * No more max pooling, since the images are only faces and already aligned
    - Without last layer -> very discriminating (similar faces -> similar results)



# Further CNN Networks
1. GoogleNet
    - FC = fully connected
    - Inception module = network within network
    - Stack inception modules

    - Naive inception module:
        * Apply multiple convolutions (filters) in parallel
            + multiple receptive fields: 1x1, 3x3, 5x5
        * Use pooling to concatenate the outputs depth-wise
        * TODO: image
        * Problem: lots of channels and computation ops
            + pooling preserves depth
    - Solution: Bottleneck layers
        * 1x1 convolution layers with smaller depth
            + each filter calculates a depth-dimensional dot product
        * preserves spatial dimensions, but reduces depth
    - TODO: full architecture image
    - TODO: explain classifier
        * Global Average Pooling
            + average last feature maps to 1x1
            + 1 linear layer and softmax for classification
            + less parameters & better performance than FC
        * Auxiliary Loss Layers
            + calculate additional loss at given place in network and propagate back to previous layers



1. ResNet
    - Depth Revolution
        * Deep networks with residual connections
    - Why?
        * Deep Networks perform better up until a certain point (TODO: image)
            + At some point no longer due to overfitting
        * Solution
            + Residual block passes input identity around convolutional layers
            + Then add output + identity element-wise
            + TODO: image
    - Full architecture
        * Stack residual blocks
        * Each has two 3x3 layers
        * Periodically double the number of filters and downsample by 2
        * Extra conv layer at the beginning
        * No FC at the end
        * Global average pooling after last conv layer
    - Improving
        * Identity Mappings in Deep Residual Networks
            + Improves block design, more direct path for propagating information
        * Wide Residual Networks
            + More shallow network, but wider
            + Outperforms the original, more performant (parallelization)
        * ResNeXt
            + Increases width through multiple parallel pathways
            + Similar in spirit to the Inception module
    - DenseNet
        * Densely connected layers
        * Alleviates vanishing gradient
        * Strenghtens feature propagation
        * Encourages feature reuse



1. MobileNet
    - Properties
        * Useful for mobile and embedded vision applications
        * Smaller models (fewer params)
        * Less complexity (fewer multiplications and additions)
    - Splits depthwise and pointwise convolution
        * depthwise = convolve for each channel with wider, but shallow filter: depth x depth x 1
        * pointwise = convolve with a narrow, but deep filter 1x1xdepth
        * Convolute for each channel, then concatenate (1x1 convolution on all channels)
