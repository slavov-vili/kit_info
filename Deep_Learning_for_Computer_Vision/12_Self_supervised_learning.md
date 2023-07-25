# Problem
1. Motivation
    - Supervised learning requires x and y for forward pass and loss
    - labels y can be very expensive
    - Enormous amount of unlabeled data on the internet
1. Idea
    - Data = supervision
    - Use the inherent structure of the data
    - Give the network dummy tasks which help it understand the data



# Possible proxy objectives
1. Reconstruction 
    - Autoencoders (encoder/decoder structure)
        * Goal: reconstruct the input image
        * Loss = error between input and output
        * The network is forced to learn a compact representation of the image
        * Advantages
            + Free labels (every input)
            + No need for special setup
        * Disadvantages
            + Difficult for large images with small details
            + Proxy losses often cannot model the real objective (lead to trivial outputs)
    - Colorization
        * Similar, but input != label
        * Input = grayscale of an image
        * Target = original colored version
        * The network has to learn a meaningful representation to fill in the colors
1. Context and Positioning
    - Take segments of the image and train the network to know how they best fit together
    - General: think of a task which teaches the network the structure of the image without needing explicit labels
    - Task setup: take 2 cropped parts of an image and try to see how the second one fits in (formulated as classification problem)
    - Important to avoid trivial solutions through context abuse
        * Example: connect lines and continue patterns
        * Prevented by inserting gaps or making sure no 2 gaps are next to each other
1. Temporal order of video frames
    - What is a video?
        * Temporal sequence of frames
        * Inherent information: frame order
            + Long-term: events
            + Short-term: motions
        * Neighboring frames are similar
        * Has to be logically consistent (hold -> drop -> bowl)
    - Shuffle and Learn (Misra et al. 2016)
        * Extract short clips with high motion from video
        * Generate positive and negative tuples (in-order and out-of-order)
        * Classify data
