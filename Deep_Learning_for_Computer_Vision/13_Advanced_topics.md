# Challenges in Deep Learning
1. Can we show the model's uncertainty?
    - What is uncertainty?
        * How does the model react to new data (not seen in training)
        * What happens when data is noisy or the sensors are malfunctioning (imprecise measurements)
    - Why do we need this?
        * Dealing with breaking Deep Learning components (prevent, detect)



# Uncertainty
![image](uncertainty.png)
1. Types of uncertainty
    - Aleatoric (data uncertainty)
        * from Latin: dice player's
        * Inherent noise
        * Irreducible, but can be learned
        * Homoscedastic: same for all inputs (e.g. imprecise sensors)
        * Heteroscedastic: varies with input (e.g. far vs close objects)
    - Epistemic (model uncertainty)
        * from Greek: knowledge
        * Reducible
        * What does the model not know?
1. Quantifying Epistemic Uncertainty
    - Bayesian Neural Network (TODO: explain)
        * Sample T times with Bernoulli distribution and average
    - Confidence Calibration (TODO: explain)
    - Ensemble (TODO: explain)
