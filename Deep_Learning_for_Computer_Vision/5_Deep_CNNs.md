# Modern CNN Revolution
1. TODO: explain + going deeper



# CNN as feature extractors
1. Deep Convolutional Activation Feature for Generic Visual Recognition (DeCAF)
    - TODO: explain
    - if skip classifier -> feature extractor

1. DeepFace
    - TODO: explain
    - Without last layer -> very discriminative (similar faces - similar results)



# Further CNN Networks
1. GoogleNet
    - FC = fully connected
    - Inception module = network within network
    - Stack inception modules

    - Process previous output multiple times in parallel and concatenate results
    - TODO: image
    - Problem: lots of channels and computation ops
    - Solution: Bottleneck layers
        * 1x1 convolution layers (TODO: explain)
        * TODO: image
        * preserve spatial dimensions
        * reduce depth
        * TODO: before/after image
    - TODO: full architecture image
    - TODO: explain classifier
        * Global Average Pooling
            + average value of given area per channel
        * Auxiliary Loss Layers
            + calculate additional loss at given place in network and propagate back to previous layers



1. ResNet
    - Depth Revolution
    - Why?
        * Deep Networks perform better up until a certain point (TODO: image)
            + At some point no longer due to overfitting
        * Solution
            + Residual block passes input identity around convolutional layers
            + Then add output + identity element-wise
            + Hypothesis (TODO: explain)
    - TODO: explain Full architecture
    - TODO: training
    - TODO: improving
    - DenseNet



1. MobileNet
    - Splits depthwise and pointwise convolution
        * Convolute for each channel, then concatenate (1x1 convolution on all channels)
