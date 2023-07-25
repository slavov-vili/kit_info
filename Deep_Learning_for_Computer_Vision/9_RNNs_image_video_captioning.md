# Intro
1. Pre deep learning
    - Every picture tells a story
        * Meaning space = triplet <object, action, place>
        * Create template-based sentences
    - BabyTalk
        * Detect objects
        * Create sentences based on object neighborhood
1. CNN + RNN
    - Vision Deep CNN = feature extractor
    - Language Generating RNN = description

1. VGG CNN
    - Simple VGG Network, trained on ImageNet
    - As feature extractor
        * discard last layers
        * FC layers output a summary of the image as a X-dimensional vector
        * Output can be used to train various networks (e.g. SVM, RNN, etc.)
1. Connecting CNN & RNN
    - CNN output + weight = first hidden state
    - generate a description in each iteration and use it for the next one
    - CNN stays pre-trained and RNN is learned
1. Evaluation Metrics
    - Info
        * Captioning usually uses machine translation metrics (how well do sentences match?)
    - BiLingual Evaluation Understudy (BLEU)
        * Measures precision
        * Example:
            + Hyp: the cat is on the mat
            + Ref: there is a cat on the mat
            + Unigram BLEU score = 1
            + n-gram BLEU scores = count how many n-word pairs match
        * Problem: "on the mat" gets high score
        * BLEU-4 used, supposed to be good English
    - Metric for Evaluation of Translation with Explicit ORdering (METEOR)
        * Measures recall
        * Example:
            + Hyp: on the mat sat the cat
            + Ref: the cat sat on the mat
            + unigram precision = 1, recall = 1
            + Fmean = (10 * P * R) / (R + 9P) = 1
            + Meteor = (1 - mapping penalty) * Fmean



# Deep Visual-Semantic Alignments
    - Can also generate relations between objects in the image and the output text
    - Uses a dataset of images and sentence descriptions. Correspondences are inferred.
1. Alignment of image boxes with words
    - Feed image through RCNN (object detection)
    - Pass sentence through a bidirectional RNN
    - Compute matching scores between region boxes and words
1. Attention
    - People look at "salient/prominent" regions of an image
    - It helps guide vision and stabilize the input
    - Idea: model attention into machines to improve understanding
    - Task: predict saliency map
    - In translation
        * Use probability distribution in each step to emphasize a different word (handles using weights)
        * weight the words based on which step we're in
        * When predicting words: look at which previous word has highest influence?
    - In image captioning
        * Spatial relation is gone after feature generation
        * Also create features based on the location in the image
        * Soft attention: weighted combination of softmax over the locations
        * Hard attention: only pick highest-scoring location (not nice for end-to-end training)



# Video Captioning
1. Intro
    - sequence-to-sequence: Generate descriptions of what's happening in the video
    - 1 whole description or smaller ones for each part?
    - Much harder than images: need to analyze motion and actions
    - Types: still camera, ego motion, movie clips
1. Pre-deep
    - Analyze motion, objects, obtain pose in video
    - HMMs for sentence generation
    - Hand-crafted with fixed-vocabulary outputs
1. Attention in Video captioning
    - Not just spatial, but also temporal relation
