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
    - Anfragen
        * MATCH = FROM
        * RETURN = SELECT
