# Market Outcome and Performance
1. The objective of a Market Engineer
    - achieve a given market outcome or performance
    - does this by designing the transaction object & the market structure
    - Market Structure = market microstructure, IT infrastructure & business structure

1. Market outcome
    - In a financial market the outcome is the allocation of orders
    - The market is performant if it reaches the goal with high allocation efficiency
    - allocation efficiency is traditionally measured using liquidity
    - Liquidity
        * Trade off between the price at which an asset is sold and how quickly it is sold
        * Liquid = mild trade off, illiquid = big trade off
        * money/cash = most liquid asset (directly exchanged at face value)

1. Performance criteria (TODO: images)
    - Allocation Efficiency
        * Maximizes welfare (total utility)
    - Fairness
        * Minimizes the variance in utility
    - Revenue Maximization
        * Maximizes the revenue of a seller (or the utility of an agent)
    - Budget-Balance
        * Outcomes have balanced transfers across agents
    - Incentive Compatibility
        * Best strategy = truthfully reveal any private information required by a mechanism
    - (Speed of) Convergence
        * Trend in which all taken actions lead to an expected system state or equilibrium
    - Privacy Preservation
        * Guarantee of privacy (restrain other agents from learning private information)

    - Individual Rationality
        * Agents not negatively affected by **not** taking place
    - Pareto Optimality
        * No allocation change can improve payoff of one agent without being detrimental to another
    - Computational Costs
        * Computational requirements to reach equilibrium and compute the allocation
    - Equilibrium
        * Is it possible to reach an equilibrium state?
        * Under what conditions?
    - (In)stability
        * Lack/Existence of preferred choices
    - Information Efficiency
        * Degree to which the prices (or generally - the conditions) reflect the information available in the market
    - Simplicity
        * Comprehensibility of the institutional rules
        * If rules too complex - agents have trouble forming their strategy




# Principles of Markets
1. Microeconomic Systems
    - Weinhardt and Neumann vs Smith  (TODO: image)

1. Institutions
    - as Mechanisms
        * Idea of Leonid Hurwicz
            + Economists take part in a contest to design a 'superior' mechanism
            + Formalization of mechanisms allows for an objective comparison without implementation
            + Basic concept of "Distributed Resource Allocation Mechanism"
        * Extension by Vernon Smith
            + Generalization to economic system
            + Refinement of basic concepts
            + (Quasi-)Formalization of basic concepts
        * Observation of Friedrich August von Hayek
            + If we want to understand the real function of a price system - look at it as a mechanism for communicating information
                - Private information exchanged in the market process
                - The market process is governed by the institutional rules
    - Trading Rules of a market institution
        * Messages (e.x. offers, acceptance notifications)
        * Allocation rules
        * Payment rules (e.x. first-price, all-pay)
        * Control rules (opening/transition/stop rules)

1. Agent Behavior
    - Connects motivation in the environment with the institution to yield decisions and outcomes
    - Influenced by the microeconomic system
    - Consists of observable responses
    - Is expressed via messages
