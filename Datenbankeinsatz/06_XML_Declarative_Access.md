# XQuery



# Notes
1. Beispiel 2.1
    ```
    <results>
        { for $b in document("blah")/bib/book
        return
            { for $a in $b/author
            return
                <result>
                    <title>$b/title</title> <author>
                </result>
            }
        }
    </results>
    ```
