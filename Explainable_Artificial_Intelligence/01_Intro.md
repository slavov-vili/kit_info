# XAI
1. What?
    - Transparency, trust, accountability in AI
    - Understand potential biases
1. Why?
    - Models learn in a wrong way, so can be steered the right way
    - Does it have a bias? What is it biased against? (color vs crime severity)
1. Dataset
    - Columns = Inputs/Features
        * Inputs = given values x
        * Features = functions of inputs f(x)
    - Rows = data points
    - Some models compute internal features from inputs
1. Questions
    - Why performance not sufficient for biases?
        * Gives no info about used features: which, how, what effect
        * Aka we don't know what the model is actually learning
    - Intrinsic vs post-hoc interpretability
        * Different approaches
        * Intrinsic = try to understand the model
        * Post-hoc = try to understand outcome?
        * Smaller model vs bigger/complex model
