# Motivation
1. Language
    - Sequences of variable lengths (words, sentences, documents)
    - Properties depend on context
1. Example
    - TODO: image
    - Notes
        * Number of classes is fixed (POS Tags)
        * 1 to 1 correspondence



# Sequence Labeling
1. Basics
    - Input Sequence (var length) -> Output Sequence of labels (same length as input)
    - Example: Named Entity Recognition
    - Roughly: foreach input item -> predict a label
1. POS Tagging
    - Basics
        * Grammatical tagging
        * Word-category disambiguation
        * Mark based on definition and context
    - Ambiguity
        * Many words belong to multiple classes (have multiple POS tags)
        * Most words have only one tag (mostly nouns and verbs)
        * Frequent word types have multiple tags
    - Classification
        * First idea: use a classifier for each each word
            + Words are ambiguous, so need context (neighboring words/POS tags)
            + Need to jointly model the whole sentence
        * Probabilistic tagging
            + TODO: explain
            + Predicting the whole sequence
            + Breaking up the probabilities
            + Markov assumption?



# Hidden Markov Models (HMM)
1. Model basics
    - TODO: explain
1. Markov Chains
    - TODO: explain
1. Formalizing HMMs
    - TODO: explain
1. 3 challenges
    - Probability
    - Decoding
    - Learning



# Linear Chain Conditional Random Field (CRF)
1. Discriminative Models
    -  Model P(y|x)
