# Examples
1. A function: The turnstile shall count the number of "unlock" commands
1. A behavior: The operator shall be able to run the system in 3 modes
1. A project requirement: The system shall be deployed at most 5 months after signing the contract
1. A legal constraint: The system must comply with the privacy law of the country where it is deployed
1. A quality attribute (performance): The reaction time from X to Y must be shorter than 5 seconds
1. A quality attribute (availability): The system should have high availability



# Classification dimensions
1. Concerns
    - ![image](images/requirement_concerns.png)
    - function = system's behavior, data, input, reaction, regardless of implementation
    - quality = a quality that the system should have
    - constraint = restriction on what, how, prescribed solutions
1. A faceted classification (Qualities that each requirement has)
    - Kind (see concerns)
    - Representation (Same requirement can be represented in different ways)
        * Operational
            + operation or data
            + Validation: Review, test, formal validation
        * Quantitative
            + measurable property
            + Validation: Measurement
        * Qualitative
            + goals
            + Validation: Not directly. Prototype, subjective stakeholder judgement, goal refinement, derived metrics
        * Declarative
            + required property
            + Validation: Review
    - Satisfaction
        * Hard (Either satisfied or not)
        * Soft (Degree of satisfaction)
    - Role
        * Prescriptive (What should a system do/have)
        * Normative (Given by the environment: laws)
        * Assumptive (Not about the system, but about other systems, users, etc. More so assumptions)
1. Representations
    - Examples
        * Qualitative: should be highly available
        * Quantitative: must be available for 99.99% of the time
        * Declarative: must comply with privacy laws
        * Operational: shall count the number of unlocks
    - How to distinguish
        * Operational: process/action verb is used or statements about what NOT to do
        * Declarative vs qualitative: validated by review vs not
        * Qualitative: can't have hard satisfaction
1. Interesting example
    - Requirement 1: any unauthorized access to data should be prevented
        * Concern: Quality, Security
    - Requirement 2: Database shall grant access only to users who have username and password
        * Concern: Also quality: security
    - Neither is functional
    - 1 is qualitative and 2 is operational
1. Satisfactions
    - Graph: value x degree of fulfillment
1. Roles
    - Prescriptive
        * Classic
        * E.x. Sensor X shall be read every 100 ms
    - Normative
        * A norm in the environment, which is relevant for the system
        * E.x. A social security number uniquely identifies a person
    - Assumptive
        * Required behavior of an actor who interacts with the system
        * E.x. The operator shall accept every accept message
    - The roles make norms and assumptions explicit
        * Allows for them to be treated differently

