# Activity Classification
1. CNN Models (temporal connectivity patterns)
    - Single Frame
        * No temporal information
    - Late Fusion
        * Look at 2 frames, separated by F frames
        * Both frames go into separate paths
        * Last layers see the temporal connection
    - Early Fusion
        * Convolutional filters also include temporal context
    - Slow Fusion
        * Higher layers have access to more context
        * Learn motion patterns at different scales
        * Frames overlapping in time
    - Multiresolution
        * Two paths: center and whole image
    - Evalutation
        * Not much better than just using single images

1. Two-stream ConvNet
    - Spatial stream = one image
    - Temportal stream
        * Optical flow = info about movement, movement vectors used (works with controlled background)
    - Not as good yet, because not enough annotated data

1. P-CNN (Pose-based CNN)
    - Focus on the people in the video
    - Try to detect their posture
    - Constructing features
        * Use RGB for appearance ones and estimated optical flow for motion ones
        * Extract RGB and optical flow from frame given corresponding body joints => use as input for the two CNN

1. C3D (3D Convolutional Networks)
    - 2D with space = stack frames and then convolute
    - 3D kernels which also convolute deeper into the input (also learns weights of temporal changes) => many more parameters
        * kernel depth < frame count

1. CNN-RNN (Recurrent ConvNet)
    - Feature extract with CNN & Sequence Learning with RNN

1. Choice of Action Recognition Architecture
    -



# Classification vs Detection
1. Detection
    - Extract parts which correspond to action X
    - 
