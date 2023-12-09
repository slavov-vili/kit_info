# Natural Language Understanding
1. Goal
    - Find a semantic representation of language
    - Basically: Translation from language to representation
1. Challenges
    - Ambiguities (Lexical/Syntax/Referential)
    - Vagueness (what is a late lunch?)
1. Dimensions
    - Depth: Shallow vs Deep
    - Domain: Narrow vs Open
1. Spoken Language Understanding
    - Approach: Transform language into task-specific semantic representation
    - Subtasks
        * Domain detection
        * Intention determination
        * Slot filling (basically gather parameters)
    - Examples
        * Show flights from Boston to New York
        * Set the alarm to 6 am
1. Domain Detection
    - Idea: create specialists on topics (call center analogy)
    - First technique: Create menu to find fitting agent
    - Automatic task: Automatically find agent (utterance classification task)
        * Input = Utterance
        * Output = Topic
    - Examples: Airline Travel, Alarm clock
1. Intent Determination
    - Domain-dependent utterance classes
    - Task: Assign class to utterance
    - Examples: Find\_Flight, Set\_Alarm
1. Slot Filling
    - Find attributes/parameters/slots for the intent
    - Task: Assign class to word spans (sequence labeling)
        * Neural Sequence Labeling (similar Named Entity Recognition)
        * Components
            + 1-hot encoding
            + Word embedding
            + Sequence layer (LSTM/self attention)
            + Classification (1-hot representation)
    - Problem: Need a lot of data because lots of parameters
    - Solutions
        * Collect data
        * Reduce amounts of parameters
        * Reuse parameters (use pre-trained word embeddings)
    - Examples: Departure,Arrival,Date; Time,Date



# Transfer Learning / Pre-training
1. Idea
    - TODO: image
    - Train model on unlabeled data
    - Reuse model for a related task
    - Example: word vectors
1. Challenges
    - What is a useful source task?
        * Should be similar to target task
        * Should have lots of data
    - How do we transfer knowledge to the target task?
        * Reuse parameters
1. Solution: Representation learning
    - Task: learn hidden representation
        * Should be transferable
        * Should have lots of data (unsupervised learning)
1. Self-Supervised Learning
    - Idea: Create supervised learning task from unlabeled data
    - Neural Approaches: Similar to next word prediction
        * Efficient training
    - Variants
        * Use an RNN instead of n-gram models
            + TODO: image + shifted sentence
        * Full text available from start => use bidirectional models
        * Use Self-Attention
            + Bidirectional per default
            + Can be made unidirectional using masks for future words (same parameters)
            + Can train 1/2 bi and 1/2 uni and then can use for both tasks
    - Masked Language Model Task
        * TODO: image + no longer shifted
        * Idea: Automatically create supervised learning task
        * Bidirectional
        * Mask out some words and predict
        * Problem: No direct feedback for each input
1. Transferring knowledge
    - Word embedding - same representation for each word
    - Contextual word embedding (text encoder) - different representations
        * Everything except classification head



# Pre-trained Models
1. Static Word Embeddings: Word2Vec, FastText, Glove
1. Contextual Word Embeddings: Bidirectional, EIMO, BERT
1. EIMO
    - TODO: explain
1. BERT
    - Properties
        * Bidirectional Masking model
        * Self-attention framework
        * Next sentence prediction
        * Input using several sentences
    - TODO: explain representation and tokens
        * CLS token used instead of aggregation layer to get info of sentence

