# Motivation
1. Auctions are used for serious things
    - Business contracts (Network Providers)
    - Selling Partings
1. Classification
    - Part of the Micro-structure
    - Can be
        * single or multi-dimensional
        * one or two sided
        * open-cry or sealed bid
        * first or k-th price
        * single or multi-unit
        * single or multi-item
        * TODO: image



# Single Unit Auctions
1. Introduction
    - What is an Auction?
        * Market institution with explicit set of rules
        * Determines resources allocation and price based on bids from the market participants
        * Comes from Latin "augere" = "to increase"
        * Used to sell: random items/materials, even people
    - Motivation Scenario
        * Need to pay student loans by selling a painting
        * Option 1: set low price - not enough after selling
        * Option 2: set high price - nobody buys it
        * Option 3: auction it - highest bid wins => max profit (based on current demand)
1. Types of Auctions (TODO: image)
    - Independent Private Values (IPV)
        * Each bidder only knows **their** exact value for the item
        * Differences in bidder valuations reflect their tastes
        * Bidder valuations are statistically independent
        * Personal valuations (private knowledge) come from a common knowledge probability distribution
        * Examples:
            + Antique bought for consumption instead of resale
            + Government contract where each company knows their own cost of production
    - Common Values (CV)
        * Sold item has a single objective value
        * Nobody knows the value, but they all have a guess
        * Learning other people's valuation is helpful when figuring out the actual value
        * Personal valuations (private knowledge) come from a common knowledge probability distribution
        * Examples:
            + Antique bought by dealers for resale
            + Stocks
    - Benchmark Auction Model
        * A1: Bidders are risk neutral
        * A2: Independent-private values (IPV)
        * A3: Bidders are symmetric
        * A4: Payment is a function only of the bids
        * Bidders know:
            + The auction's rules
            + Their own valuation
            + Number of bidders, their risk attitudes, the distribution of valuations
    - Most common: English auction
        * Price increases, ends when only one bidder



# Seller's expected revenue (SER) and Bidder's expected rent (BER)
1. Notations (TODO: image)
1. Order statistics
    - n bidders where u = (v - p)k
    - Order statistics = ordered sample values of valuation distribution
    - F_k_n(v) = probability that the k^th highest value out of n draws is not bigger than v
    - First order statistic
        * Probability that the highest of n draws is <= v
        * Continuous distribution function (cdf) = F^n(v)
        * Probability density function (pdf) = n * F^n-1(v) * f(v)
    - We are looking at an English auction (winner pays second price) => need second order statistic
    - Second order statistic
        * Probability that the second highest of n draws is <= v
        * = max one value is higher than v
        * 2 cases:
            + v > v' (v is highest value)
            + v' > v >= v" (only v' is higher than v)
        * Probability
            + F_2_n(v) = P(max one value > v) = P(v is highest) + P(v'>v + (n-1)values <= v)
1. SER
    - English auction
    - Assumption: seller has value 0 for the item
    - Expected revenue = expected value of the second highest bid
    - TODO: image
1. BER
    - Common value
        * Expected rent = P(winning) * winner's expected rent
        * TODO: image
    - IPV
        * Expected rent = rent if highest bidder * P(all others are lower)
        * TODO: image
    - What happens when there are more bidders?
        * SER increases
        * BER decreases



# Traditional Auction Mechanisms

