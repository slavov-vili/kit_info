# Intro
1. Pre deep learning
    - Every picture tells a story
        * Meaning space = triplet <object, action, place>
        * Create template-based sentences
    - BabyTalk
        * Detect objects
        * Create sentences based on object neighborhood
1. Image Captioning Fever
    - Vision Deep CNN = feature extractor
    - Language Generating RNN = description

1. VGG CNN
    - As feature extractor
        * FC layers output a summary of the image as a X-dimensional vector
1. Connecting CNN & RNN
    - CNN output + weight = first hidden state
    - generate a description in each iteration and use it for the next one
    - CNN stays pre-trained and RNN is learned
1. Evaluation Metrics
    - Info
        * TODO: explain
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
            + TODO: explain



# Deep Visual-Semantic Alignments
    - Can also generate relations between objects in the image and the output text
1. Alignment of image boxes with words
    - TODO: explain
1. Attention
    - People look at "salient/prominent" regions of an image
    - TODO: explain
    - In translation
        * Use probability distribution in each step to emphasize a different word (handles using weights)
        * weight the words based on which step we're in
        * TODO: explain
    - In image captioning
        * Spatial relation is gone after feature generation
        * TODO: explain



# Video Captioning
1. TODO: explain
1. Attention in Video captioning
    - Not just spatial, but also temporal relation
