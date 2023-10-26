# Linguistic levels
1. Sound
    - Phonetics = sounds which humans can produce
    - Phonology = sounds used in spoken language
1. Language
    - Morphology = internal structure of words (What are words?)
1. Text
    - Letters -> Words -> Sentences -> Text/Documents
1. What are the basic building blocks?
    - Too small = complicates the task
        * Example: sentence generation by letters can result in nonsense words
    - Too large = not flexible, blocks occur rarely
    - Most commonly: (partial) words



# Morphology
1. Motivation: How do we infer the meaning of words?
    - Morphology: The science of (word) forms
        * morph = Form
        * -ology = Science of
    - Approach: Analyze the components of the word
1. Word structure
    - What are the building blocks of words?
        * Example: Teacher
            + Tea_ch_er_s
            + Teach_er_s
            + Tea_cher_s
            + Teacher_s
    - In Phonology: words consist of individual phonemes
    - In Morphology: correlation with semantic changes
        * Example: nuts, nights, necks, backs, tags
            + Phoneme: final [s]
            + Semantics: plural
        * Counter example: blitz, box, lapse
            + no semantic meaning
    - Morphological structure: groups of words which have partial resemblance in form AND meaning
    - Morpheme = smallest meaningful constitute of a word
1. Morphology and Languages
    - Importance depends on the language
    - Types of languages
        * Analytical Languages
            + Morphology plays a relatively small role
            + Examples: English, Yoruba, Vietnamese
        * Isolating Languages
            + Extremely analytical
        * Synthetic Languages
            + Morphology is important
            + Examples: Swahili
        * Poly-synthetic Languages
            + Extremely synthetic
    - Fusional Languages
        * Morphemes have multiple roles
        * Examples:
            + Spanish: -i = first person OR past tense
            + German: -te = first/third person OR past tense
    - Agglutinating Languages
        * Morphemes are just concatenated
        * Example: Finish
            + talossanikinko
            + talo = house, issa = in, ni = my, kin = too, ko = question
1. Basic Concepts
    - Lexemes
        * Abstract representation of a word
        * Example: LIVE = live, lives, lived, living
        * Lemma = form which represents the whole set
    - Word-form
        * Specific form of a word
        * Example: lives
    - Paradigm
        * Word-forms belonging to a lexeme
        * Example: matrix of forms
    - Word-family
        * Set of related lexemes
        * Example: read, readable, unreadable, reader, etc.
    - Stem Morphemes
        * Can stand alone
        * Lexical
            + Has a meaning in the sentence
            + Example: book
        * Functional
            + Grammatical connections
            + Examples: her, and, etc.
        * Root
            + Stem, which can't be split further
    - Afixes
        * No meaning unless connected to a word
        * Prefixes
        * Suffixes
        * Infix
        * Circumfix
1. Word formation
    - Inflection
        * Modification of a word which creates a new grammatical category
        * Lexeme -> Word-form
        * Example: dog -> dogs, write -> writes
    - Derivation
        * Forming a new word from an existing one
        * Creating a new lexeme
        * Example: happy -> happiness, essen -> essbar
    - Compunding
        * Creating a word which consists of multiple existing ones
        * Example: Apfel + Kuchen = Apfelkuchen
1. Morphological process
    - Concatenation
        * Most common approach: add affix to the stem
        * Examples: hope+less, un+happy
    - Reduplication
        * Doubling part of a word
        * Example Tagalog: basa (read) -> ba-basa (will read)
    - Templates
        * Roots and Affixes are discontinuous (one modifies the other?)
        * Example Hebrew: lomed (learn) -> lamad (learned)
    - Ablaut
        * Morphemes change inside the word
        * Examples: sing -> sang -> sung, Mann -> Männchen
1. Word types
    - Simple
        * Consist of a single morpheme
        * Examples: book, Haus
    - Complex
        * Consist of multiple phonemes
        * Example: books
        * Compound: contain multiple stems
1. Restrictions
    - Morphosyntax
        * Rules of combining morphemes
        * Example: Piti-less-ness, but NOT Piti-ness-less
    - Phonological/Orthographical Alterations
        * Morphemes vary depending on context
        * Examples: die -> dying, swim -> swimming



# Tasks
1. Lemmatization
    - Word -> Lemma
    - Example: saw -> SEE
    - Stemming
        * more statistical approach
        * Take the beginning of the word
1. Morphological analysis
    - Word -> Lemma + Tag (ignore context)
    - Example: saw -> (SEE, verb.past), (SAW, noun, sg)
1. Tagging
    - Consider context
    - Example: Peter saw her -> (SEE, verb.past)
1. Morpheme segmentation
    - Split word into morphemes
    - Example: de-nation-al-iz-ation
1. Text generation
    - 
    - Example: see + verb.past => saw
1. Methods
    - Manually
    - Machine learning
    - Hybrid



# Word representation
1. Challenges
    - How do you deal with unseen words?
    - Large vocabularies are computationally complex
1. Idea: identify the best granularity
    - Words? Subwords? Characters?
1. Word segmentation
    - Morpheme segmentation (Machine Learning based)
        * Learn efficient representation of subwords
        * Byte Pair Encoding = most common approach



# Byte Pair Encoding
1. What?
    - Method for compressing textual data (60-70% compression rate)
    - Recursively replace the most common pairs of bytes with an unused byte
    - Stop when desired vocabulary size is achieved
1. Example: characters
    - abcabc... -> {ab=d}
    - dcdc... -> {dc=e, ab=d}
    - ee...
1. Example: words
    - I go, he goes, she goes
    - Vocabulary [(”go”,1),(“goes”,2),(”he”,1), (“I”,1),(“she”,1)]
1. Example algorithm
    - Split words into characters
    - Calculate frequency of pairs
    - Replace most common with a single character
    - Repeat
    - Store the learned mappings
    - Apply to new text
