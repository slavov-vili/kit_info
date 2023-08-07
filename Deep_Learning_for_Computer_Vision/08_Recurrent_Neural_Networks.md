mage](/image](images//
# Intro
mage](/image](images//
1. Until now: Feed-forward
mage](/image](images//
1. How to process streams of data?
mage](/image](images//
    - Sequences of words, frames in a video?
mage](/image](images//
    - Not just classification of objects
mage](/image](images//
    - Image / Video Captioning
mage](/image](images//
        * Input: Image (Sequence)
mage](/image](images//
        * Output: Word Sequence
mage](/image](images//
    - Action Recognition
mage](/image](images//

mage](/image](images//
# Recurrent Neural Networks (RNNs)
mage](/image](images//
![image](rnn_architectures.png)
mage](/image](images//
1. What?
mage](/image](images//
    - Input = sequence
mage](/image](images//
    - Update state representation
mage](/image](images//
    - State = function of current input + previous state
mage](/image](images//
        * The function is parameterized with the weights (stay the same once learned)
mage](/image](images//
    - ![image](rnn_update_state.png)
mage](/image](images//
1. Vanilla RNN
mage](/image](images//
    - Single hidden vector h
mage](/image](images//
    - Output y = function of hidden state
mage](/image](images//
    - Use different weights for input -> hidden, hidden -> hidden and hidden -> output
mage](/image](images//
    - depending on what output we want we can use another non-linearity
mage](/image](images//
    - ![image](vanilla_rnn.png)
mage](/image](images//
1. RNN Scenarios
mage](/image](images//
    - Single input, Single output = standard feed-forward network
mage](/image](images//
    - Single input, Stream of outputs = e.g. Image captioning
mage](/image](images//
    - Stream of inputs, Single output = Stream classification, action recognition
mage](/image](images//
    - Stream of inputs, Stream of outputs (seq-to-seq models) = machine translation
mage](/image](images//
    - Stream of inputs, Stream of outputs (instant-output models) = per frame video classification
mage](/image](images//
1. Character-RNN example
mage](/image](images//
    - interesting to consider image and text processing together (same methods)
mage](/image](images//
    - Similar to n-grams (predict next word given previous ones)
mage](/image](images//
    - One-hot encoding (bit vector with element for each possible value, 1 if it)
mage](/image](images//
    - ![image](rnn_character_prediction.png)
mage](/image](images//
    - Training
mage](/image](images//
        * Definitions
mage](/image](images//
            + D = vocabulary size
mage](/image](images//
            + H = hidden size
mage](/image](images//
            + n = sequence length
mage](/image](images//
        * Step 1
mage](/image](images//
            + Initialize model parameters
mage](/image](images//
            + Draw weights randomly (from a Gaussian)
mage](/image](images//
            + Biases = 0
mage](/image](images//
            + ![image](rnn_weights_and_biases.png)
mage](/image](images//
        * Step 2
mage](/image](images//
            + Unroll network
mage](/image](images//
            + Computer forward pass (share weights across recurrences of characters? across the whole sequence?)
mage](/image](images//
            + Compute prediction scores
mage](/image](images//
            + Soft-max (for classification)
mage](/image](images//
        * Step 3
mage](/image](images//
            + Backpropagate gradients from every output
mage](/image](images//
            + Use later outputs to update parameters multiple times
mage](/image](images//
            + Gradients are calculated at each time step and either combined or update multiple times?
mage](/image](images//
            + Update parameters (Gradient-descent)
mage](/image](images//
    - Testing (Sampling)
mage](/image](images//
        * Initial input (aka seed) - w0
mage](/image](images//
        * Output scores
mage](/image](images//
        * Compute soft-max
mage](/image](images//
        * Pick character with highest score
mage](/image](images//
        * Feed as input at next step
mage](/image](images//
    - soft-max normalization, cross-entropy is the logical loss function
mage](/image](images//
        * If output in continuous vector space: regression loss (n 2 loss?)
mage](/image](images//
1. Vanishing / Exploding gradient
mage](/image](images//
    - Unrolling the gradient at large distances (> 20)
mage](/image](images//
    - Gradient at t-1 = Whh^T * dh_t
mage](/image](images//
    - Vanishing (gradient -> 0) if largest eigenvalue of Whh < 1
mage](/image](images//
    - Exploding (gradient -> Inf) if largest eigenvalue of Whh > 1
mage](/image](images//
1. Long Short-Term Memory (LSTM)
mage](/image](images//
    - More complex: two states (Cell State Ct & hidden state ht)
mage](/image](images//
    - Prevents gradient problems: Additive changes instead of multiplicative ones (like RNN)
mage](/image](images//
    - ![image](lstm.png)
mage](/image](images//
    - Forget gate
mage](/image](images//
        * How much of the previous cell state is retained
mage](/image](images//
        * Looks at previous hidden state and new input
mage](/image](images//
        * Sigmoid with weight and bias
mage](/image](images//
        * ![image](lstm_forget_gate.png)
mage](/image](images//
    - Input and new cell state
mage](/image](images//
        * How much of the new input is used to generate the current state
mage](/image](images//
        * Also looks at previous hidden state
mage](/image](images//
        * new cell state = tanh => [-1, 1]
mage](/image](images//
        * ![image](lstm_new_cell_state.png)
mage](/image](images//
    - Update cell state
mage](/image](images//
        * Consider the forget gate
mage](/image](images//
        * Add modulated info from the new input
mage](/image](images//
        * Create new cell state and pass it forward
mage](/image](images//
        * ![image](lstm_update_cell_state.png)
mage](/image](images//
    - Output gate
mage](/image](images//
        * How much is passed to the next state
mage](/image](images//
        * Also looks at previous hidden state and new input
mage](/image](images//
        * Modulate new cell state to produce new hidden state
mage](/image](images//
        * Weight the output
mage](/image](images//
        * ![image](lstm_output.png)
mage](/image](images//
    - Cell state
mage](/image](images//
        * Straight line with little interaction
mage](/image](images//
        * Allows gradient to flow easily
mage](/image](images//
        * Gradients are added and **not** multiplied
mage](/image](images//
        * ![image](lstm_cell_state.png)
mage](/image](images//
1. Multi-layer RNNs
mage](/image](images//
    - An RNN going deeper similarly to CNNs and MLP
mage](/image](images//
    - Typically improves results
mage](/image](images//
1. Gated Recurrent Units (GRUs)
mage](/image](images//
    - Similar performance to LSTM with less parameters
mage](/image](images//
    - Reset gate: controls the previous state
mage](/image](images//
    - Output gate: modulates the new hidden state with the old one
mage](/image](images//
1. Seq-to-seq models (Machine Translation)
mage](/image](images//
    - Translate sentence from one language to another
mage](/image](images//
    - Dataset contains a parallel corpus
mage](/image](images//
    - <EOS> = End of Sequence tag
mage](/image](images//
    - Encode input sentence Decode output sentence (Encoder-Decoder models)
mage](/image](images//

mage](/image](images//
# Embeddings
mage](/image](images//
1. Word embeddings (vector representations)
mage](/image](images//
    - How to represent words?
mage](/image](images//
        * Problem with one-hot: dimension = vocabulary size => impractical for large vocabularies
mage](/image](images//
        * We want a compact representation which captures semantics
mage](/image](images//
    - Class similarity (horse similar to zebra)
mage](/image](images//
    - Word2Vec
mage](/image](images//
        * Classes = binary vectors
mage](/image](images//
        * One hot vs class similarity:
mage](/image](images//
        * ![image](word_embedding.png)
mage](/image](images//
        * How to get semantic labels?
mage](/image](images//
            + Supervised: manually provide labels (very expensive, subjective labeling)
mage](/image](images//
            + Unsupervised: automatically learn similarity between words based on how they appear in text (leverage large-scale corpora, data-driven semantic learning)
mage](/image](images//
    - Skip-gram Model
mage](/image](images//
        * Words in same context share semantic meaning (euro,dollar = currency; car,bus = vehicle)
mage](/image](images//
        * How?
mage](/image](images//
            + Sliding window of fixed size with target word as center
mage](/image](images//
            + Input: one-hot vector encoding of the target word
mage](/image](images//
            + Output: Probability distribution of each word being a context (to the target)
mage](/image](images//
            + Goal: Maximize the probability of the target words given a context word
mage](/image](images//
        * Fully-connected feed-forward neural network
mage](/image](images//
        * Training objective:
mage](/image](images//
            + Learn embeddings which are good at predicting nearby words
mage](/image](images//
            + Train on large corpora (billions of words)
mage](/image](images//
            + Learn many words (millions)
mage](/image](images//
            + Typical embedding size: 100 - 1000
mage](/image](images//
        * Captures similarities using simple algebraic operations
mage](/image](images//
            + v(king) - v(man) + v(woman) is closest to v(queen)
mage](/image](images//
1. Semantic sentence representations
mage](/image](images//
    - Like Word2Vec, but for sentences
mage](/image](images//
    - Skip-Thoughts (similar to Word2Vec skip-grams)
mage](/image](images//
        * Try to predict neighborhood sentences
mage](/image](images//
        * Tries to model semantic meaning
mage](/image](images//
        * Not good at distinguishing details
