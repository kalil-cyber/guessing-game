#!/bin/bash

# Fonction pour vérifier si l'estimation est correcte
function check_guess {
    if [[ $1 -lt $file_count ]]; then
        echo "Trop bas ! Essayez à nouveau."
    elif [[ $1 -gt $file_count ]]; then
        echo "Trop haut ! Essayez à nouveau."
    else
        echo "Félicitations ! Vous avez trouvé le bon nombre : $file_count fichiers."
        return 0
    fi
    return 1
}

# Nombre de fichiers dans le répertoire courant
file_count=$(ls -1 | wc -l)

# Demander à l'utilisateur de deviner
echo "Combien de fichiers y a-t-il dans le répertoire actuel ?"
while true; do
    read -p "Votre estimation : " guess
    if [[ ! $guess =~ ^[0-9]+$ ]]; then
        echo "Veuillez entrer un nombre entier."
        continue
    fi
    check_guess $guess
    if [[ $? -eq 0 ]]; then
        break
    fi
done
