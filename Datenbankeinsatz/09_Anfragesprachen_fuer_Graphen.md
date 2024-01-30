# Einleitung
1. Unterscheidung von Graphen
    - Basis
        * Gerichtet oder nicht
        * Gelabelt oder nicht
        * Mehrere Kanten zwischen Knoten oder nicht
        * Zusammenhängend oder nicht
    - 1x groß vs mehrere kleine (Facebook vs Moleküle)
        * Ganzes Graph als Ergebnis nur bei kleine sinnvoll
1. Informationsbedürfnisse auf Graphen
    - Suche nach konkrete Muster in Graphen. (anders geartet als Zentralitätsberechnungen)
    - Abstand ist sinnvolles Konzept => Anfragesprachen aus semistrukturierte Datenbanken reichen nicht aus
    - Beispiele
        * Basic
            + Alle Knoten in FB mit Abstand < 4 von X.
            + Alle Moleküle, in denen eine Instanz des Elements A mit einer von Element B direkt verbunden ist.
        * Komplex
            + Längste Pfade in allen Molekülen mit bestimmte Eigenschaft (Folge von Labels, Knoten mit Mindestgrad, usw.)
            + Kleinste Komponente (min. Summe der Gewichte)
    - Diskussion
        * Wie ausführen? Erst A und dann B? Erst B und dann A?
            + Gibt es mehr As oder Bs? Wie viele Verknüpfungen haben As und Bs?
            + Kanten anschauen?
            + Schema anschauen und Infos ableiten?
    - Anforderungen
        * Wir möchten Anfragen formulieren, die
            + Graphstrukturen berücksichtigen
            + auf Graph-spezifische Eigenschaften Bezug nehmen
        * Queryergebnis = Graphen
            + nicht einzelne Knoten
            + Gemeint: Teilgraphen, insbesondere wenn zu groß
        * Graphspezifische Optimierung und Heuristiken
1. Illustration
    - ![image](images/example_graph_a_b_c.png)
    - ![image](images/example_query_a_b_c.png)
    - Struktur des Querygraphen verloren gegangen
        * C1 kann kein Match für C sein
        * A2 kann kein Match für A sein
        * B2 kann kein Match für B sein
    - Andere Perspektive
        * Jeder Knoten kennt seinen Grad
        * Grad > 1 hilft bei Queries



# Neo4J
1. Einleitung
    - Graph-DBMS
    - Anfragen können Bezug nehmen auf Pfade und ihre Eigenschaften
    - Allgemeiner als Pfadausdrücke für XML
    - Ausgaben haben relationale Struktur
        * Modell ist nicht abgeschlossen
        * Nicht 1NF (Graphen haben komplexere Struktur als Relationen)
    - Keine Sichten (Views)
    - Anfrageoptimierung nicht so mächtig (schweres Problem zu lösen)
    - Graphalgorithmen als Funktion gekapselt & in Abfragen anwendbar
        * Beispiel: kürzester Weg
1. Zugrunde liegendes Datenmodell
    - Knoten und Kanten
    - Können sowohl Labels als auch Attribute haben
        * Attribute: ("Vorname", "Heinrich")
    - Kategorisierung mit Hilfe von Labels
    - Konsistenzbedingungen (z.B. Uniqueness Constraints)
        * Einhaltung durch DBMS überwacht
1. Beispielszenario
    - ![image](images/beispiel_materialwissenschaft.png)
    - Aus der Materialwissenschaft
    - Man interessiert sich für die Bewegungen und Interaktionen von Versetzungen (Fehlstellungen im Atomgitter) über die Zeit.
    - TODO: explain
    - Notes
        * Loops, Junctions
1. Anfragen
    - Übersicht
        * MATCH = Auf was zugreifen? = FROM in SQL
        * WHERE = Filterbedingung = WHERE in SQL
        * RETURN = Was zurückgeben? = SELECT in SQL
    - Beispiel 1: Implizite Gruppierung im RETURN
        * Ausgabe der Anzahl der 'Loop'-Knoten für jeden Zeitpunkt.
        ```
            MATCH (n:Loop)
            RETURN n.time AS time, COUNT(n) AS count
        ```
        * Ausgabe
            + ![image](images/result_graph_query1.png)
        * Erläuterungen
            + Erste Zeile = Zeilennummer (Systemgeneriert)
            + Nur Knoten mit Label 'Loop'
            + Kompakt, da keine WHERE Klause (alternativ: MATCH (n) WHERE 'Loop' in labels(n))
            + Implizite Gruppierung (explizite Kannten = Gruppierungsschlüssel)
    - Beispiel 2: Bedingungen bezogen auf Graphstruktur
        * Ausgabe der IDs aller Loops mit burges\_vector = 4, slip\_normal = 1 und mehr als 10 Kanten.
        ```
            MATCH (n:Loop)
            WHERE n.burges_vector = 4 AND n.slip_normal=1
            AND size((n)--()) > 10
            RETURN n.id
        ```
        * Erläuterungen
            + burges_vector & slip_normal = Attribute, uns egal
            + (n)--() = Kante, adjazent zu n (keine Aussage zum anderen Knoten)
            + size()  = Zählt Elemente in Liste/Array
            + count() = Anzahl der Werte/Knoten (siehe Beispiel 1)
    - Beispiel 3: Komplexe Bedingungen bezogen auf Graphstruktur
        * Finde alle Junction-Knoten, die mit einem Loop-Knoten mit ID = 1 verbunden sind, gruppiert nach Zeitpunkten.
            + verbunden = ex gibt ein Elementar-knoten dazwischen (keine direkte Kante)
        ```
            MATCH (n:Loop {id:1})-[*2]-(m:Junction)
            WITH n, collect(distinct m.id) as ids
            RETURN n.time, ids
        ```
        * Ausgabe
            + ![image](images/output_graph_query3.png)
        * Erläuterungen
            + 



# Graphs-at-a-Time
1. Graph Motifs
    - Grammatiken:
        * S1 = S2 *
        * S2 = S3 | c
        * S3 = a b
    - Bei Graphen:
        * Kanten, Knoten = Terminalsymbole
        * Graph = Nichtterminalsymbol
1. Zusammensetzung von Graphen
    - TODO: images
    - Konkatenation
    - Unifikation
    - Disjunktion
    - Rekursion
1. Diskussion
    - Begrenzte Ausdrucksmächtigkeit der Motifs
    - Beispiele
        * TODO: explain
        * Binomialbaum
        * Cliquen
1. Graph Algebra
    - 
