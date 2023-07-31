# Image Segmentation
1. Notes
    - Identification of homogeneous regions in an image
    - Partition an image in meaningful regions
1. Motivation
    - Breaking the image into major structural components enables high-level reasoning on it
    - Necessary for extracting reasonable local features (texture, color, etc)
1. Difficulties
    - No single correct segmentation
    - Interpretation depends on prior world knowledge
1. Typical Approaches
    - Inspired by human vision
        * Intensity/color coherence
        * Texture coherence
        * Motion coherence
    - Methods
        * Thresholding
        * Clustering
        * Region Growing
        * Watershed
1. Using Clustering
    - Clustering = finding points which are close together
    - Cluster pixels based on: intensity values, color properties, motion/optical flow properties, texture measurements
    - Input = set of measurements
    - Output = set of clusters and their centers
    - Simple approaches:
        * Merging = Agglomerative Clustering
            + Each point = its own cluster
            + Merge closest clusters until satisfactory
        * Splitting = Divisive Clustering
            + All points = one cluster
            + Split furthest clusters until satisfactory
        * Challenges
            + Choice of inter-cluster distances
            + When to stop
    - Using k-means
        * Simple methods use greedy approaches
        * Algorithm
            + Choose initial mean values for the k regions
            + Assign n pixels to the closest mean
            + Recompute the means = average of samples in the class
            + Continue until no changes in the mean values



# Semantic Segmentation
1. 
