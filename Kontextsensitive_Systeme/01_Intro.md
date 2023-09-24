# Why context?
1. Optimize conversation with computer through sensing implicit information = context



# Definitions of context
1. Chen/Kotz
    - Set of environmental states and settings
    - active context = critical (determines an application's behavior)
        * Actively sought or requested by the system
        * Examples: user actively gives info (location, preferences), sensors actively collect data (GPS, accelerometer)
    - passive context = relevant (app event occurs in it and is interesting to the user)
        * Passively collected over a long period to find out user preferences
        * Examples: sensors (motion detectors, ambient light sensors), user behavior analysis (websites visited, apps opened)
1. Dey/Abowd
    - Any info that can be used to characterize the situation of an entity
    - primary context
        * location = where
        * identity = who
        * time = when
        * activity = what
        * Examples: walking, running, forest, city
    - secondary context
        * anything found on the basis of the primary context
        * Examples: Jogging, Picknick, Catching a tram
1. Context-aware
    - System which uses context to provide relevant information/services to the user.
    - Relevant = with respect to the current task



# Aspects of context
1. 3 Aspects of Schilit:
    - Where?
    - With whom?
    - Nearby resources?
1. 4 Dimensions of Gross and Specht
    - Location
    - Identity (interests, preferences, knowledge, activity log)
    - Time (e.g. working hours)
    - Environment or activity



# Classes of context-sensitive apps
1. Manually-Triggered
    - Info: Proximate Selection and Context Information
        * e.g. Shops nearby
    - CMD: Contextual commands
        * e.g. Press Play to ...
1. Automatically-Triggered
    - Info: Automatic Contextual Reconfiguration
        * e.g. Mute phone in meeting
    - CMD: Context-triggered Actions
        * e.g. Smart Heating



# Reading notes: Context-Aware Computing Applications
1. Abstract
    - Mediate interactions with devices, computers, other people, navigate unfamiliar places
    - Important info = limited, because only see, hear, touch
1. Introduction
    - Users employ many different mobile, stationary, embedded devices throughout the day
        * = Mobile Distributed Computing System
    - Computation takes place in multiple locations and situations
1. Context-Aware Computing
    - Proximate Selection
        * Make nearby objects easier to choose (emphasize)
        * Types of devices of interest
        * Computers that require co-location (e.g. printers, displays, speakers, thermostats)
        * Objects already interacted with & need to be addressed by software (e.g. people in same room who you want to send a document to)
        * Places you want to find more about (e.g. restaurants, clubs, gas stations, stores)
        * Showing options based on distance from user
        * How to show them? Sorted by location? Alphabetical, but closed = emphasized?
        * How to update changing information (if the user moves or the objects move)? Fine-grained vs coarse-grained view of the objects (regions instead of exact distance)
    - Automatic Contextual Reconfiguration
        * Reconfiguration = adding/removing components, altering connections between components
        * Components = servers & clients
        * Context can bring about different system configurations
        * Can achieve the illusion of gaining access to virtual objects as if they were similar (entering room gives access to virtual whiteboard)
        * Change can happen based on other features (group meeting => turn on project whiteboard)
        * More powerful than basic whiteboards since can be virtually transfered to any room
        * Reacting to every change might be confusing and affect performance
    - Contextual Information and Commands
        * Try to exploit predictable actions based on context (e.g. library, kitchen, office)
        * Can automate some tasks (e.g. automatically print to nearest printer)
        * Location-based can show different directories, files, programs based on current room
        * Buttons can appear differently or do different stuff based on current room (e.g. migrate windows to display)
    - Context-triggered Actions
        * Adapt actions based on context (IF-THEN)
        * Context in condition triggers following commands
        * Automatically invoked based on predefined rules
        * Contextual reminders allow for specific rules (e.g. next time in the library, next time I see1).
        * Hard to know when to trigger (don't want to trigger intermediate when moving through many rooms, but else might seem sluggish)
        * Another problem is the expressiveness of the predicate language
1. Related Works
    - Active Badges (Olivetti Research Lab, ORL)
        * Badges and infrared networks
        * Aid for telephone receptionist
        * Personal control scripts allow control based on context (who with, where, time of day)
    - User global execution environment
    - Persistent computing environment for people who move between systems
    - Use context to tag information and facilitate retrieval
