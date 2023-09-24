# Complexity of Recognizing Context
1. Complex contexts can only be sensed indirectly
1. Problems
    - Sensors only sense partial effects of context
    - Sensors are noisy
    - Different types of the same context may affect sensor signals in different ways
1. Implications of representable context
    - What is context?
        * Info that can be encoded
        * Delineable: define relevant contexts for the app in advance
        * Stable: can reuse initial determination of relevance of context to activity
        * Separable from activity
1. Dourish's Context
    - Context cannot be predicted, it is revealed from the interaction with the system



# Sensors can provide context
1. Examples
    - Tilt sensor => change orientation
    - light sensor => adjust LCD brightness
1. Sensors in phones
    - acceleration, light, proximity, touch, camera, GPS, rotation, temperature, compass



# Classification of sensors
1. By measure
    - Direct Physical Measure (SI)
        * length, mass, time, electrical current, temperature, molar amount, luminosity
    - Derivatives
        * angle, velocity, frequency, force, momentum, energy, pressure, load, voltage, tension, power
1. By activation principle
    - Electrical measurement of capacity, inductivity, charge, resistance
    - Passive
        * Converts external source (mechanical, chemical, photonic, thermal energy)
        * Hall / Piezo effect
    - Active
        * Sends and receives signals
        * Reacts to non-electrical changes (resistance, inductivity, capacity)



# Semiconductor technologies
1. CMOS sensors
    - Photodiode on chip
    - arrays and matrices from video sensors
1. MEMS
    - Micromechanical System
    - Mechanics directly on silicon
    - Create accelorometor by creating moving capacitor plates



# Classical Sensor Systems
1. Precisely control the measuring conditions
1. Identify physical phenomenon:
    - Direct measurement
    - Controlled placement
    - Controlled environment
1. Measurement
    - Accuracy = degree of exactness to a measurement standard
    - Precision = ability of measurement to be consistently reproduced
    - Reliability = consistency of accurate results over consecutive measurements over time
    - Traceability = ongoing validations that the measurement of a final product
          conforms to the original standard of measurement
1. Sources of error
    - Statistical error
        * measurement principle or noise with mean at true measurement value (Gaussian in nature)
        * Averaged out by taking multiple measurements of same physical phenomenon
        * affects precision
    - Systematic error
        * de-adjustment of the sensor
        * cannot be averaged out, but the system can be recalibrated
        * affects accuracy
1. Traditional Measurement Process
    - Define measurement task and unit
    - Specify ALL measurement conditions exactly
    - Select and calibrate a measurement device
    - Specify the measurement process exactly
    - Take the measurement(s)
    - Calculate noise influence (systematic measurement error)
    - Calculate overall measurement result and quantitative error margin
1. Context from Signals
    - c = Context, s = Signal, x = State
    - c(x,1. = s'
    - Context Recognition = learning c'^-1 so that c'^-1(s, s') = x^
    - Learn using machine learning
    - Active sensor = emits signal (camera with flash)
    - Passive sensor = transforms energy (camera using sunlight)
1. Classical Pattern Recognition
    - Collect data from sensor
    - Extract features from data
        * Prepare sensor data: compress, filter, transcode, etc.
    - Interpret features and assign classes
        * Knowledge based !!!
    - Further abstraction: high-level info, reasoning
    - See image
1. Measurement in the 21st century
    - A set of observations which reduce uncertainty where the result is expressed as a quantity - Douglas Hubbard



# Data Processing Chain
1. See image
1. Problem
    - Input: often analog, continuous sensor signals
    - Output: symbolic discrete context class
    - How to do this?
1. Sensor data
    - Too much information for classifier if direct input
1. Solution
    - Extract important information
    - Make an n-dimensional vector from useful sensors and flatten to 1-dimensional
    - Machine learning pipeline
        * See image
