# Motivation
1. Example: Online booking
    - Why don't hotels lie? (sell the same room twice)
        * Users leave ratings -> people book from higher rated ones
    - Can ratings be trusted?
        * Good ones may be bought by the hotel
        * Bad ones my be bought by competitors
    - An enforcement mechanism can help (reporting the ratings)



# Types of Enforcement
1. Definition
    - Enforcement mechanisms make people comply with rules
    - Transactions hold the risk of opportunistic default
    - Agents can destroy part of cooperative surplus in exchange for a larger share of it
1. Formal vs Informal
    - Formal Enforcement
        * Contracts
        * Government, fines, imprisonment
        * Market operator
    - Informal Enforcement
        * Social pressure and reputation
        * Personal and community enforcement
1. Personal vs Community
    - Personal Enforcement
        * Cheating = retaliation by the victim
        * Requires: prompt retaliation
        * Examples: repeated game with same players; long-term relationships
    - Community Enforcement
        * Violator is sanctioned by society
        * Also works when transactions are infrequent and parties change
        * Requires: (post-trade) transparency
        * Examples: reputation mechanisms (e.g. eBay)
1. Enforcement Properties
    - Has a cost
        * Monitoring trades in a market
        * Bookkeeping of a trader's reputation
    - Leads to trust
        * Denotes a subjective perception of risk in participation



# Trust and its Definitions
1. Definitions
    - Firm belief in reliability, trust or ability
    - Putting oneself in a vulnerable position with the belief, that others will act with our best interest in mind
    - Something about probability of actions before we can observe it and in a specific context
1. Perspectives
    - Computer Science
        * Technical implementation of trust in electronic systems
            + Examples: Cryptography, SSH, Authentication, etc.
            + Challenges: Bugs, Hacking, etc.
        * In e-commerce & P2P: necessary to define and implement a computational notion of trust
            + Examples: point-based-reputation systems (eBay, Amazon, Airbnb, etc.)
            + Challenges: Rating mechanism, Cheating, etc.
        * Aspects
            + Tends to create trust-inducing mechanisms
            + Likes to quantitatively measure trust
    - Economics
        * How trust affects the behavior of market participants
        * What role trust plays in the functioning of the market
        * Trust = important facilitator of markets, due to the risk of opportunistic default
            + sellers can not ship after payment and buyers can not pay
        * Aspects
            + Focus on the effect of trust on a system, its users and situations where trust plays a crucial role
            + Assumes that trust exists, does not provide methods of observing or quantifying it
    - Sociology
        * Fundamentals of trust
            + Evolution over time
            + Its Provenance (place of origin, derivation)
            + Contextual understanding of trust as a multifaceted social process
        * Trust = calculated risk taking in response to decision situations in social interaction
        * Modes of trust
            + **Reflexive**: stresses the importance of "familiarity (of knowledge)"
            + **Operational**: represents an implicitly unquestioned stand-point in the world
            + **Habitual**: fundament of routine and product of interaction
        * Aspects
            + Focus on the theoretical basis for explaining context
            + Fundamental characterization of social exchange
            + Trust is not quantitatively measured, but can be quantitatively assessed



# Trust in Internet Transactions
1. Motivation
    - Acting trustworthy = partners return for business
    - Information about reliability is transferred by word-to-mouth
    - 89% of encounters on eBay are one-shots
    - Internet transaction fraud is 12 times more likely than in-store fraud
    - Reputation mechanisms build trust and elicit cooperation between loosely connected and geographically dispersed agents
1. Fundamental Trust Problem
    - Buyer's Choice (TODO: image)
        * Sellers have no initial pecuniary incentive to ship the item
        * Only perfect equilibrium is not buying
    - Without enforcement mechanisms, the game results in no trades
1. Experimental Treatments
    - Partners Market: Some buyer-seller pairs interact repeatedly (traditional offline relationship)
    - Feedback Market: Seller's history is automatically and reliably sent to the buyer (reputation system)
    - Strangers Market: Individual buyers and sellers meet only once with no history information (one shot interaction)
    - Results
        * There are always trades in the market (contrary to the prediction)
        * There is more than pecuniary incentive
        * Partner > Feedback > Stranger
        * Personal interaction > Reputation > Nothing
    - Additional consideration for buyers
        * Negative and recent feedback weighs more than positive and old
            + Net positive feedback hides information
        * Verifying the trustworthiness of a new seller is costly
    - => Reputation system works. But what if the ratings can't be trusted?
1. Example: eBay
    - Empirical findings
        * Feedback information is unreliable
        * Feedback only on 50% of encounters
        * 98% of feedback is positive
    - Fraudulent use of feedback mechanisms
        * Shill feedback (secondary user IDs)
        * Feedback extortion (demanding actions while threatening negative feedback)
        * Feedback solicitation (trading feedback)
1. Adversaries
    - Do fraudulent actions
    - Agents who try to harm others or the system or act in an unacceptable way
    - Two types: selfish and malicious
    - Different mechanisms are needed for different types of adversaries
        * incentives help with selfish ones, but not effective against malicious ones
    - Adversary strategy
        * Traitors (build strong reputation and defect)
        * Collusion (join with others for bad mouthing or ballot stuffing)
        * Whitewashers (get new identity)
        * Syblis (has several identities for collusion)
    - Enforcement is costly and mechanism design is not trivial
    - We need an enforcement mechanism, which encourages rating and is not attractive to adversaries
1. Example solution: Entry Fees
    - Sellers need to pay fee before being able to trade
    - If they don't deliver - kick them out and keep fee
    - Else: they can leave and get their deposit back
    - Fee > 20 guarantees delivery without social cost (see buyer's choice)
        * fee = 21
        * Sellers prefer to ship (50 > 49) & Buyers prefer to buy (50 > 35)
    - Only perfect equilibrium is buy/ship
    - Why are they not used?
        * No more effective mechanism => must be non-economic considerations
        * Users don't trust the platform (user acceptance)
        * Maybe there are hurdles before signing up
1. eBay's solution: scoring past behavior
    - Feedback score: positive - negative
    - Positive feedback percentage
    - Widely used
    - Costly for newbies (need many transactions to build score before trusted)
    - Does well on non-economic grounds (easy to understand, no barriers to sign up)
    - Rule changes
        * Repeated transactions with same partner carry more weight
            + Rewards repeated business
            + Susceptible to collusion
        * Sellers cannot set negative/neutral feedback for buyers
            + Reduce extortion of buyers
            + Susceptible to Spaßbieter
        * Positive feedback based on last 12 months (not lifetime)
1. Airbnb's solution:
    - Only publish review after both seller and buyer have posted one (within 14 days)
