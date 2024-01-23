# Transfer Learning
1. Traditional vs Transfer
    - ![image](images/traditional_vs_transfer_learning.png)
    - Try to build a general model from the data and try to do a target task
1. In Deep Learning for NLP
    - Task data = expensive
    - General Transfer Learning = 1000 examples
    - Few-shot Learning = 10-100 examples
    - One-shot Learning = 1 example
    - Zero-shot Learning = no examples
1. Types of Transfer Learning
    - ![image](images/transfer_learning_types.png)
1. Training
    - Task-specific encoder-decoder
    - Promptless Fine-tuning
        * No prompt
        * Fine-tune language model
        * Advantage: no prompt design
        * Disadvantage: need more data
    - Tuning-free prompting
        * Human-generated prompts
        * Frozen language model (don't update the gradient)
        * Advantage: efficient, possible to use LLMs
        * Disadvantage: prompt engineering, limited accuracy
    - Fixed-LM Prompt Tuning
        * Continuous and discrete prompts
        * Frozen language model
        * Advantage: efficient learning of prompts
        * Disadvantage: limited accuracy
    - Fixed-prompt LM Tuning
        * Human-generated prompts
        * Fine-tune language model
        * Advantage: Adapt to prompt style
        * Disadvantage: LLMs need to be updated (lots of parameters)
    - Prompt & LM Tuning
        * Continuous and discrete prompts
        * Fine-tune language model
        * Advantage: many degrees of freedom
        * Disadvantage: LLMs need to be updated



# Adaptation
1. Using Prompts
    - Motivation: template selection has a huge influence on the quality
    - Hand-crafted
        * Manually create templates
        * Advantages
            + No training data
            + Zero-shot
        * Disadvantage
            + Difficult
            + Maybe suboptimal
    - Automatic search
        * Discrete prompt: prompt is text
        * Continuous prompt: prompt is embedding
        * Static prompt: same prompt for each example
        * Dynamic prompt: prompt depends on input
    - Prompt mining
        * Input = pair of X and Y
        * Search for prompt based on X and Y
        * Example
            + X = Barack Obama
            + Y = Hawaii
            + Sentence = Barack Obama was born in Hawaii
            + Template = X was born in Y
        * Data source = large text corpus (e.g. Wikipedia)
        * Search = Middle words or decency paths (between X and Y)
    - Prompt Paraphrasing
        * Idea: Start with initial prompt and use automatic paraphrasing
            + Back-translation (translate to another language and then translate back)
            + Neural prompt rewriter (optimized to improve the performance of the final system)
    - Gradient-based search
        * Search for words to fill prompt
    - Continuous prompts
        * Idea: prompt does not need to be human readable = embedding
        * Motivation: Domain token in seq-to-seq models
        * Adaptation: Don't change language model itself
    - Prefix/Prompt Tuning
        * Prompt tuning = learn specific embedding
        * Prefix tuning = learn hidden representation of all layers
            + A lot more parameters (learn for each layer)
        * Tuning initialization = initialize with discrete prompts
1. Architecture Adaptation
    - How do we change the network's architecture?
    - Motivation
        * TODO: explain
    - Remove preretraining task head
        * TODO: explain
    - Add target task-specific layers
        * Simple: Add linear layer on top of pre-trained model
        * Complex: Add multiple layers (output of pre-trained is input to another model)
    - Adapters
        * TODO: explain
        * Benefit: Increased robustness and sample efficiency
        * Useful when representations are different
            + Just plugging = representations are different (length, scope: sentence, subword, etc.)
            + An adapter learns a mapping between them
            + CTC Compression (TODO: explain)
            + Fine-tune text encoder OR Use an additional LSTM model
    - Weight factorization
        * Use weights to directly change the parameters (instead of using adapters for hidden representation)
            + No additional layers, but directly on weights
        * TODO: explain
1. Optimization Schemes
    - Which weights to train during adaptation and following what schedule?
    - What to train?
        * Feature Extraction
            + Weights are frozen
            + Train a linear classifier on top of the pre-trained model
            + TODO: explain
        * Adapters
            + = task-specific modules between existing layers
            + Only train the adapters
        * Fine-tuning
            + Initialize with pre-trained model
            + Train whole model
    - How to train?
        * Motivation
            + Avoid overwriting useful information from pre-trained model
            + Maximize positive transfer
        * Discriminative fine-tuning
            + Motivation: lower layers capture useful information
            + Approach: lower learning rates for lower layers
        * Regularization
            + Goal: Stay close to the pre-trained model
            + Simple (sum of abs difference), Elastic weight consolidation (only modify less important parameters)
1. Training signal
    - How do we get more supervision signals for the model
    - More signals
        * TODO: explain



# Standard Cross-Language Transfer
