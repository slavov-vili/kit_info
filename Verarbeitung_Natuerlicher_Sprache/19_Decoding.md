# Decoding
1. Seq-to-Seq model: Generation
    - How do we generate output?
    - Idea
        * Search for possible outputs
        * Model assigns scores to each output
        * Find most probable one
    - Encoder-Decoder: Translation
        * Search for most accurate output: don't always have a reference
        * Search for most probable output
1. Basic search
    - TODO: images
    - Idea
        * Input the source sentence
            + Forward pass = calculate hidden states of tokens
        * Input \<s\>
            + Calculate output probabilities
            + Select most probable word
        * Input selected target
        * Continue
            + Until End token is generated (\</s\>)
    - Problem
        * This is a greedy approach
        * Output influences the input (problem of Autoregressive models)
    - Example Challenge:
        * TODO: explain
        * Joint probabilities could be higher than individual ones
    - Exact search
        * TODO: explain
1. Beam search
    - TODO: explain
    - Notes
        * Beams can have different lengths
        * Problem with 
1. Sampling
    - Idea: Randomly select next words based on conditional probability
    - TODO: explain
    - Problem: way too many choices => all probabilities are low and jointly we have a high chance of getting garbage
    - Top-k Sampling
        * TODO: explain
        * Select top k and re-normalize the probability
    - Nucleus Sampling
        * TODO: explain
        * aka Top-p?
        * Only select words with probability > p



# Evaluation
