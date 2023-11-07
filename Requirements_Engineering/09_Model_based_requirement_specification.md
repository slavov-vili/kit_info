# Modeling basics
1. Idea
    - Mostly for technical specification (precise and give an overview)
1. Characteristics and options
    - Requirements are usually formulated in a problem-oriented approach (what problems should be solved)
    - Architecture and Design info is usually omitted
    - Usually graphically represented
    - Semi-formal or formal representation (e.g. UML)
1. What can be modeled?
    - System view
        * Static structure perspective
            + (Entity-Relationship) data models
            + Class and object models
            + Component models
        * Behavior perspective
            + overall behavior (what states?, what stimuli received when?)
            + Finite state machine
            + State charts
            + Petri nets
        * Function and flow perspective
            + model a function and do some computations based on input
            + flow = model a specific process (place order -> check availability -> order -> ship -> ...)
            + Activity models
            + Data / Information flow models
    - User-system interaction view
        * Model interaction between a system and its external actors
        * User cases, scenarios
        * Sequence diagrams
        * Context models
    - Goal view
        * model goals and their dependencies
        * Goal trees
        * Goal-agent networks (e.g. i\*)



# Models of static system structure
1. Data Modeling: Entity-Relationship models
    - Models the **relevant part of the domain** using entity- & relationship types and attributes
    - Example
        * Turnstile ---belongs---> Lift ---part\_of--> ...
        * Turnstile ---has---> Scanner
    - Pros
        * Easy to model (and explain to stakeholders)
        * Straightforward mapping to relational DB systems
    - Cons
        * Ignores functionality and behavior
        * No system decomposition (can't split up easily if too big)
1. Object and Class modeling
    - Identify entities in the domain which need to be stored and processed
    - Map those to objects/classes, attributes, relationships, operations
    - Represent all of this in a static structural model (connected classes)
    - Modeling individual objects is too specific (or unknown at the time of specification)
        * Classify objects of the same class (Class model)
        * Select an abstract representative (Object model)
    - Terminology
        * Object
            + individual entity with an identity (does not depend on others: no attributes)
            + Examples: Turnstile no 002, The Plauma chairlift
        * Class
            + Set of objects of the same kind (based on structure), their behavior and how to manipulate them
            + Examples: Turnstile, Lift
        * Abstract Object
            + Representation of individual object or a set of them with the same time
            + Example: A Turnstile
    - Class models / diagrams
        * ![image](images/model_class.png)
        * Most popular form of structure modeling
        * Typically using UML
        * Sometimes not enough (=> need Object Models)
            + when we need to distinguish between 2 objects of the same class
            + can't be decomposed properly (2 objects of the same class, but in different subsystems)
            + Subclassing is a workaround, but not a proper solution
    - Object models
        * Useful when there is a lot of distinction between objects
        * Example: Incidents: incoming, current, dispatched, closed
        * Solution using Class models
            + Incident class with subclasses
            + Bad: All classes are structurally identical => code smell
            + Bad: As the status of an incident changes, objects need to be destroyed and recreated with a new class
        * Composite Structure Diagrams
            + Specify the structures of interconnected elements
            + ![image](images/composite_structure_diagram.png)
        * Example using UML
            + ![image](images/uml_structure_diagram.png)
        * Pros
            + Well-suited for describing structure
            + Supports locality of data and encapsulation of properties
            + Supports structure-preserving implementation
            + Can model system decomposition
        * Cons
            + Ignores functionality and behavior (from a user's perspective)
            + UML: Deep nesting not possible within 1 diagram