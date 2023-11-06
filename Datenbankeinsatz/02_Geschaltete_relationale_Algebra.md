# Motivation
1. Notes
    - geschaltete = mehr Anschaulichkeit
    - 



# Formalisierung Relationenmodell
1. Definitionen
    - Domain = set of all values of an Attribute
        * Kann auch leer sein!
    - Schema = subset des Universums
    - Tupel = Abbildung: Attribut -> Wert aus seiner Menge
1. NF^2-Modell
    - Attributwerte = atomar?
    - Belegschaft = Menge von {PANr, Nachname, ...}
    - Telefone = Menge von {Telefon}
    - Als flache Relation darstellen
        * Schlüssel = PANr, oder PANr + Telefon
        * Fremdschlüssel = PANr
    - Zusammenhänge kann man übersichtlicher anschauen
1. Definition von Schema
    - Alternativ
        * foreach Attribut: Wert muss aus der Domäne sein
        * Instanz = kreuz Produkt der Attribute
    - Schema mit NF^2
        * 2^dom(R1) = Menge von Tupeln, die zu R1 konform ist
1. Algebra für NF^2
    - TODO: relationale Algebra
    - Projektion
        * Y = nur top level Attribute
        * Duplikate = zusammengefasst (A=2,C=2,D=3)
        * Um C oder D zu entfernen: über nest und unnest ändern
            + Sonst Definition von pi = zu umständlich
    - Selektion
        * B = subset von Tupeln: (C,D) in {(1,4), (2,3)}
        * = select(AE from r1) DIFF select(AE from r1) where CD is not (1,4) AND CD is not (2,3)
    - Nesting
        * Zusammenfassen der Elemente bei denen die nicht-geschachtelten Attribute gleich sind (A,E)=(1,3)
        * Nested value = mini table, NOT just view of same rows!
    - Unnesting
        *
    - Zusammenfassung Nesting
        * nicht herleitbar, da A in beide Tupel gleich
1. Funktionale Abhängigkeiten
    - Value of Attribute B is clear if value of A is given
1. PNF - alternative Definition
    - 
1. Varianten von NF^2
