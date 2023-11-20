# Specifying requirements with natural language
1. Pros
    - Everyone knows it (learned at school)
    - Extremely expressive
1. Cons
    - Can be Ambiguous / Imprecise
    - Error-prone (inconsistency)
    - Verification only by careful reading
1. Examples
    - "The total number of turns shall be read and archived once per day"
        * Imprecise: Who should do this? -> Passive voice
        * Vague: When should this be done?
    - "The system shall send usage statistics"
        * Imprecise: To whom? -> incomplete phrasing
    - "An authorized skier shall never pass a turnstile"
        * What about free-access offers? -> Careful with extreme qualifiers (never, all, etc.)
    - "By using RFID technology, ticket validation shall become faster"
        * Faster than what? -> No reference point
    - "In the sale's transaction, the system shall record the buyer's data and timestamp the sold card"
        * Two different requirements in one sentence
        * What data? -> Unspecific noun
1. Rules for specifying in natural language
    - Use active voice
    - Use defined subjects
    - Build phrases with complete verbal structure (sending stuff -> where?)
    - Use terms as defined in the glossary
    - Define precise meanings for auxiliary verbs (shall, should, must, may, etc.) and process verbs (produce, generate, create, etc.)
        * Usually should use same auxiliary verb, otherwise the reader assumes things about the requirements
    - Replace unspecific nouns (the data / customer / display) where appropriate
    - When comparing: specify a reference point (faster than what?)
    - Scrutinize all-quantifiers (every, always, never, etc.)
        * Usually there are exceptions
    - Scrutinize nominalization (authentication, termination, etc.)
        * May hide longer, more complex processes which haven't been specified
    - State requirements in the main clause
        * The subordinate clause is for making it more precise
    - Attach a unique ID to each requirement
        * Makes it easier to reference (in case of change)
    - Structure the requirements in sections and subsections
        * A long list is also not very helpful
    - Avoid redundancy (never ever = never)



# Common techniques
1. Phrase templates
    - Use templates to create well-formed natural language requirements
    - Typical template:
        * (\<Condition\>) \<Subject\> \<Action\> \<Objects\> (\<Restrictions\>)
        * Example:
            + When a valid card is sensed, the system shall send the command 'unlock' to the turnstile within 100ms.
1. Agile user stories
    - A single sentence about a requirement
    - Written from a stakeholder's perspective
    - Optional: Including the expected benefit
    - Accompanied by acceptance criteria
        * Help make the story more precise
    - Standard template:
        * As a \<role\> I want to \<requirement\> (so that \<benefit\>)
1. All-quantification and exclusion
    - Avoid, because there are always exclusions
    - Specify found exceptions as requirements
    - Example: cancelling an action of a coffee machine
        * Cancel before paying? Between paying and filling cup?
1. Dealing with redundancy
    - Natural language is often (deliberately) redundant (assures success even on information loss)
    - Not a good thing in requirement specification
        * Requirements are specified multiple times
        * If there are changes - need to keep consistent
    - Only use redundancy to abstract (when talking about the abstract vision of the product)
    - Avoid local redundancy (e.g. never ever)
