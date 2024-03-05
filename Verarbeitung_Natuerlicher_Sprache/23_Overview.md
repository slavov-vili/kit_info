# Overview
1. Text representation
    - Feature vector = vector of size vocabulary and number = count/binary/TF-IDF score
    - Word embeddings
        * Going from sparse to dense representations
        * Words now have similarity (where they co-occur and stuff)
1. Learning scenarios
    - Reinforcement = learn a model to simulate the feedback to the main model?
    - Transfer learning = learn on unlabeled data and reuse for a related task
    - Prompting: train on text completion and use for question-answering
1. Large Language Models
    - In-context Learning (ICL) = demonstrate an answer with an example
        * Goes in the direction of RAG (Retrieval-Augmented Generation)
    - Instruct GPT
1. Models
    - Transformers
        * Attention does not have positional information
        * Absolutely = positional encoding (sinusoidal)
        * Relative = ???
    - Search strategies
        * Important for generation, but not for sequence labeling
            + Generation has auto-regression (next output depends on previous one)
            + Outputting the best choice doesn't work
1. Tasks
    - Information Retrieval
        * Traditional - TF-IDF
        * Can use CLS token
    - Sentiment Analysis (classification)
    - POS-Tagging
    - TODO: WHAT?
1. Evaluation
    - 2-by-2 contingency table (true/false positive/negative)
    - Precision/Recall
    - f score/measure
    - MMLU, BIG-bench



# Notes
1. Tips
    - They'll tell us about a new task and ask to think about how to solve it
    - 
1. Questions
    - HMM vs RNN
        * HMM = discrete representation (fly vs flying)
        * RNN = continuous representation (fly = flying)
        * Continuous helps us learn stuff about all variants, not individual words
