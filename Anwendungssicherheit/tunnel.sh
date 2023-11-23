#!/bin/sh
# TODO: add check for exercise number
ssh -N -o 'IdentitiesOnly=yes' -i ~/.ssh/anwendungssicherheit \
    -p 60011 -L localhost:200$1:localhost:200$1 slavov@godzilla.crypto.kastel.kit.edu
