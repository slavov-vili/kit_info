mage](/image](images//
# Image Segmentation
mage](/image](images//
1. Notes
mage](/image](images//
    - Identification of homogeneous regions in an image
mage](/image](images//
    - Partition an image in meaningful regions
mage](/image](images//
1. Motivation
mage](/image](images//
    - Breaking the image into major structural components enables high-level reasoning on it
mage](/image](images//
    - Necessary for extracting reasonable local features (texture, color, etc)
mage](/image](images//
1. Difficulties
mage](/image](images//
    - No single correct segmentation
mage](/image](images//
    - Interpretation depends on prior world knowledge
mage](/image](images//
1. Typical Approaches
mage](/image](images//
    - Inspired by human vision
mage](/image](images//
        * Intensity/color coherence
mage](/image](images//
        * Texture coherence
mage](/image](images//
        * Motion coherence
mage](/image](images//
    - Methods
mage](/image](images//
        * Thresholding
mage](/image](images//
        * Clustering
mage](/image](images//
        * Region Growing
mage](/image](images//
        * Watershed
mage](/image](images//
1. Using Clustering
mage](/image](images//
    - Clustering = finding points which are close together
mage](/image](images//
    - Cluster pixels based on: intensity values, color properties, motion/optical flow properties, texture measurements
mage](/image](images//
    - Input = set of measurements
mage](/image](images//
    - Output = set of clusters and their centers
mage](/image](images//
    - Simple approaches:
mage](/image](images//
        * Merging = Agglomerative Clustering
mage](/image](images//
            + Each point = its own cluster
mage](/image](images//
            + Merge closest clusters until satisfactory
mage](/image](images//
        * Splitting = Divisive Clustering
mage](/image](images//
            + All points = one cluster
mage](/image](images//
            + Split furthest clusters until satisfactory
mage](/image](images//
        * Challenges
mage](/image](images//
            + Choice of inter-cluster distances
mage](/image](images//
            + When to stop
mage](/image](images//
    - Using k-means
mage](/image](images//
        * Simple methods use greedy approaches
mage](/image](images//
        * Algorithm
mage](/image](images//
            + Choose initial mean values for the k regions
mage](/image](images//
            + Assign n pixels to the closest mean
mage](/image](images//
            + Recompute the means = average of samples in the class
mage](/image](images//
            + Continue until no changes in the mean values
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# Semantic Segmentation
mage](/image](images//
1. 
