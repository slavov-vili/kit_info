mage](/image](images//
# Tasks
mage](/image](images//
1. Classification (What is this?)
mage](/image](images//
1. Localization (Where is this?)
mage](/image](images//
1. Detection (what things do I see and where are they?)
mage](/image](images//
1. Segmentation (what things and where exactly? (outline))
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# Object detection
mage](/image](images//
1. What is it?
mage](/image](images//
    - Localize objects using bounding boxes (bbox)
mage](/image](images//
    - Classify each bbox to its object class
mage](/image](images//
1. As a Regression Problem?
mage](/image](images//
    - ![image](object_detection_as_regression.png)
mage](/image](images//
    - Regression model = statistical model which looks at the relationship between a dependent and independent variables
mage](/image](images//
    - Idea: use regression model to detect objects
mage](/image](images//
    - Model output = coordinates of objects in the image (x, y, width, height)
mage](/image](images//
    - Problem: need variable sized outputs (images contain different number of cats)
mage](/image](images//
1. As a Classification Problem?
mage](/image](images//
    - Sliding Window Approach
mage](/image](images//
        * ![image](sliding_window_scaled.png)
mage](/image](images//
        * Only check small parts of the image
mage](/image](images//
        * Classify each patch
mage](/image](images//
        * How do you classify objects of different sizes?
mage](/image](images//
            + Apply the sliding window at different scales of the image
mage](/image](images//
        * Problem: classifying at different locations and scales takes a lot of time
mage](/image](images//
        * Solutions:
mage](/image](images//
            + Use a fast classifier (HOG, DPM)
mage](/image](images//
            + Only run on some locations and scales (region proposals)
mage](/image](images//
        * Histogram of Oriented Gradients (HOG)
mage](/image](images//
            + HOG = calculate gradient orientations of cells along the image
mage](/image](images//
            + Idea: image -> normalize -> calculate HOG -> linear SVM -> classification
mage](/image](images//
            + Advantage: very fast
mage](/image](images//
            + Disadvantage: does not work well on deformable objects
mage](/image](images//
        * Region Proposal Methods
mage](/image](images//
            + Look for blobby regions (likely to contain objects: eyes, nose, change in background)
mage](/image](images//
            + Class-agnostic object detector
mage](/image](images//
            + Able to detect blobs of different sizes
mage](/image](images//
        * Objectness (likelihood that a region contains an object of any category)
mage](/image](images//
            + Scale to 8x8 and extract normed gradients (NG)
mage](/image](images//
        * Alternative: Selective Search
mage](/image](images//
            + Split image into regions based on color
mage](/image](images//
            + Iteratively merge neighboring regions based on similarity
mage](/image](images//
    - Fast dense generic detection + Slow sparse classification
mage](/image](images//
        * Use more complex object classifier on region proposals
mage](/image](images//
1. R-CNN
mage](/image](images//
    * ![image](rcnn.png)
mage](/image](images//
    * Only feed the proposed regions to the classifier
mage](/image](images//
    * Training
mage](/image](images//
        + Train AlexNet on ImageNet (1000 classes)
mage](/image](images//
        + ![image](rcnn_training_alexnet.png)
mage](/image](images//
        + Train the classifier (binary SVMs for each class, features = output of pool5 of AlexNet)
mage](/image](images//
        + Improve region proposals (use regression model with input = features and output = locations of regions)
mage](/image](images//
    * Correct classification of a bbox = if at least 50% overlap with ground truth
mage](/image](images//
    * Metrics
mage](/image](images//
        + Precision (P) = # relevant retrieved / # retrieved
mage](/image](images//
        + Recall (R) = # relevant retrieved / # relevant in data
mage](/image](images//
        + F/F1 measure = 2 * P * R / (P + R)
mage](/image](images//
    * Fast R-CNN
mage](/image](images//
        + ![image](fast_rcnn.png)
mage](/image](images//
        + Idea: share computation on entire image
mage](/image](images//
        + Region Proposals: on entire image instead of each class
mage](/image](images//
        + Feature Extraction: give whole image to CNN for feature extraction
mage](/image](images//
        + Region of Interest (ROI) Pooling: turn irregularly shaped proposals to a fixed size (to feed into FC network)
mage](/image](images//
        + Classification and Regression: 2x FC layers (1x classification, 1x bbox regression)
mage](/image](images//
    * Faster R-CNN
mage](/image](images//
        + ![image](faster_rcnn.png)
mage](/image](images//
        + Tries to integrate the region proposal generation into the network
mage](/image](images//
        + Convolutional Backbone: process input image with a CNN (extracts rich feature maps)
mage](/image](images//
        + Region Proposal Network (RPN): small network which slides a small window and generates candidate regions (evaluates windows of different sizes for objectness)
mage](/image](images//
        + Loss: 
mage](/image](images//
        + ROI Pooling: as above
mage](/image](images//
        + Classification and Regression: as above
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# Single Shot MultiBox Detector (SSD)
mage](/image](images//
1. Current state of the art
mage](/image](images//
1. Until now
mage](/image](images//
    - Generate bboxes (proposals)
mage](/image](images//
    - Resample pixels from them to uniform size
mage](/image](images//
    - Apply high quality classifier
mage](/image](images//
    - How to speed it up?
mage](/image](images//
        * Try to avoid resampling
mage](/image](images//
1. Idea
mage](/image](images//
    - ![image](single_shot_multibox_detector.png)
mage](/image](images//
    - Use a set of fixed default boxes at each position in a feature map
mage](/image](images//
    - Classify objects and box regression for each box
mage](/image](images//
    - Apply boxes at different layers in the ConvNet (use layers of different sizes => avoids rescaling)
mage](/image](images//

mage](/image](images//

mage](/image](images//

mage](/image](images//
# Recent Developments
mage](/image](images//
1. Mask R-CNN
mage](/image](images//
    - Adds segmentation to the classification step
mage](/image](images//
    - Two-step detectors are well-suited
mage](/image](images//
1. YOLO-9000
mage](/image](images//
    - You Only Look Once
mage](/image](images//
1. Feature Pyramid Networks
mage](/image](images//
    - Features early in net have high spatial resolution, but low semantics and context
mage](/image](images//
    - Later ones have semantics and context, but low spatial resolution
mage](/image](images//
    - Classification needs high context and Localization needs high spatial resolution
