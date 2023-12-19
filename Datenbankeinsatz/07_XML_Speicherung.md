# Data Guides
1. Volltextindex vs. speziellere Indexstrukturen
1. Basics
    - TODO: image
    - Data Guide = Konkrete Zusammenfassung des Datenbankinhalts
        * Hier: DB = Dokumentenkollektion (oder einzelnes Dokument)
        * DB = Gerichteter Graph mit gelabelte Knoten (Instanz von OEM???)
    - Definition
        * dg = DataGuide, db = DB
        * dg ist selbst wieder Datenbank
        * Jeder label path in db hat genau eine path-Instanz in dg
        * Jeder label path in dg ist auch ein path in db
        * dg zeigt offensichtlich welche Pfade es in db gibt
    - Eigenschaften (TODO: explain)
        * Kurz
        * Akkurat
        * Geeignet
    - Unterschiede zwischen DataGuide und Schema
        * DataGuide ist konform zu DB (enthält nur Pfade aus der DB)
        * Schema erlaubt Kombinationen, die nicht in der DB sind
    - Erzeugung von DataGuide
        * Äquivalent zu NEA -> DEA ((Nicht-)deterministischer endlicher Automat)
    - Annotationen
        * TODO: image and explain
        * Annotation von Knoten (wie oft in DB)
            + Annotate Nodes in DataGuide with referenes to Nodes in DB
            + Help when processing queries (don't have to look at all 2K paths)
1. Query Processing
1. Strong DataGuides
1. Einordnung
    - DataGuide als Relation speichern (Tupeln: Pfad, Knoten aus ursprüngliche DB)
1. Zusammenfassung



# Combined Indices
1. 



# STORED
1. 
