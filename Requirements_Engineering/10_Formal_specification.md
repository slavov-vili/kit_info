# Formal specification languages
1. What?
    - Requirements models with formal syntax and semantics
    - The vision
        * Analyze the problem
        * Specify requirements formally (no room for interpretation)
        * Implement using correctness-preserving transformation (transform model to application)
        * Maintain the specification, no need for the code
    - Typical languages
        * Pure Automata / Petri nets
        * Algebraic specification
        * Temporal logic: LTL CTL
        * Set & predicate-based models: Z, OCL, B
1. What does "formal" mean?
    - Formal calculus = a specification language with formally defined syntax AND semantics
        * Semantics = it's clear what the symbols mean and how to use them
    - Primarily for functional requirements



# Model-based formal specification
1. What?
    - Math model of system state and state changes
    - Based on sets, relations and logic expressions
    - Typical elements
        * Base sets
        * Relationships (relations, functions)
        * Invariants (predicates) = should always hold true
        * State changes (by relations or functions)
        * Assertions of states = things that should be true given a state
1. Overview of Z
    - ![image](images/z_basics.png)
    - Schemata
        * ![image](images/z_schemata.png)
        * Organize a specification (basically a namespace)
    - Relations, functions and operations
        * ![image](images/z_relations_functions.png)
            + Set of ordered tuples
        * ![image](images/z_operations.png)
            + Show state change
    - Example: Library system
        * Schema
            + ![image](images/z_example_library_schema.png)
        * Operation: borrow
            + ![image](images/z_example_library_borrow.png)
            + changes the state
        * Query: availability
            + ![image](images/z_example_library_availability.png)
