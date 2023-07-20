# Definition
1. Problem: Bridging the gap between the stakeholders and the system builders
1. Why Documentation?
    - Communicating requirements
    - Having a basis for contracts and acceptance decisions
1. Means: Requirements specification document



# Document types
1. Stakeholder (Customer) Requirements Specification
    - What do the stakeholders want?
    - Documented before any system development considerations are made
    - Typically written by domain experts on the customer side (maybe helped by RE consultants)
    - Deutsch: Lastenheft
1. System/Software Requirements Specification
    - The classic
    - The system to be developed and its context
    - No methodological difference between system and software
    - Typically written by requirements engineers on the supplier side
    - Deutsch: Pflichtheft
1. Business Requirements Specification
    - High-level, business needs and goals
1. Collection of user stories & task descriptions
    - Used in agile



# Aspects to be documented
1. **Functionality**
    - **Data**: usage and structure
    - **Functions**: preconditions, processing, results
    - **Behavior**: as observable by the user
    - Both normal and abnormal cases
1. **Quality Aspects**
    - **Performance**
        * Data volume
        * Reaction time
        * Throughput
        * If possible - measurable
        * More than just average
    - **-ilities**
        * Usability
        * Reliability
        * Availability
        * Portability
        * Maintainability
1. **Constraints**
    - **Technical**: interfaces or protocols
    - **Legal**: laws, standards, regulations
    - Cultural
    - Environmental
    - Physical
    - **Solutions/Restrictions** demanded by important stakeholders



# How to document
1. There are random standards
1. General Rules
    - Every requirement is a small and identifiable unit
        * Useful when talking about it later on or tracing why something was done
    - Add metadata: source, author, date, status
    - Base on a structured template
    - Degree of detail relative to the associated risk
    - Specify normal and exceptional cases
    - Don't forget quality and constraints
1. Language
    - Informally: natural language, narrative text
    - Semi-formally: structural and interaction models, diagrams enhanced with natural language
    - Formally: formal models, usually based on mathematical logic and set theory
1. Precision: Reduce ambiguity
    - Restrict the language (use same term)
    - Use a glossary (1 concept = 1 term)
    - Define acceptance test cases
    - Quantify where appropriate
    - Formalize
