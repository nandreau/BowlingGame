Feature: Bowling
Calcul des scores pour une partie de bowling commence

Scenario: Partie avec seulement des strikes et des spares
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10   |
| Joueur 1 | 10      | 10      | 10      | 10      | 10      | 10      | 10      | 10      | 10      | 10, 10, 10 |
| Joueur 2 | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1, 10   |
Then le score total de Joueur 1 devrait être 300
And le score total de Joueur 2 devrait être 191

Scenario: Partie sans strikes ni spares
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 6     |
| Joueur 2 | 2, 4    | 6, 3    | 7, 0    | 5, 2    | 8, 1    | 9, 0    | 3, 6    | 7, 2    | 5, 3    | 6, 1     |
Then le score total de Joueur 1 devrait être 69
And le score total de Joueur 2 devrait être 80

Scenario: Partie avec un spare
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 5, 5    | 3, 4    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    |
| Joueur 2 | 4, 6    | 2, 3    | 6, 3    | 7, 0    | 5, 2    | 8, 1    | 9, 0    | 3, 6    | 7, 2    | 5, 3    |
Then le score total de Joueur 1 devrait être 72
And le score total de Joueur 2 devrait être 84

Scenario: Partie avec un strike
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 10      | 3, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 5     |
| Joueur 2 | 10      | 3, 5    | 7, 0    | 5, 2    | 8, 1    | 9, 0    | 3, 6    | 7, 2    | 5, 3    | 6, 1     |
Then le score total de Joueur 1 devrait être 78
And le score total de Joueur 2 devrait être 91

Scenario: Partie avec une frame incomplète 
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 4, 4    | 4, 4    |  5, 5   | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    |          |
| Joueur 2 | 4, 4    |         |  5, 5   | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "Frame 10 incomplète détectée."
And une erreur devrait se déclencher pour Joueur 2 avec le message "Frame 2 incomplète détectée."

Scenario: Partie avec une frame semi-incomplète
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 10      | 3       | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     |
| Joueur 2 | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 6     |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "Frame 2 semi-incomplète détectée."
And une erreur devrait se déclencher pour Joueur 2 avec le message "Frame 10 semi-incomplète détectée à la frame 10 pour un spare."

Scenario: Partie avec une frame dont il y a plus de lancers que nécessaire
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 10, 1   | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     |
| Joueur 2 | 4, 6    | 5, 5, 5 | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "Frame 1 contient trop de lancers pour un strike."
And une erreur devrait se déclencher pour Joueur 2 avec le message "Frame 2 contient trop de lancers."


Scenario: Partie avec un nombre de frames supérieur a 10
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 | frame 11 | frame 12 |
| Joueur 1 | 10      | 3       | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     | 4, 4     | 4, 4     |
| Joueur 2 | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     | 4, 4     | 4, 4     |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "Le nombre de frames doit être exactement 10, mais il y a 12 frames."
And une erreur devrait se déclencher pour Joueur 2 avec le message "Le nombre de frames doit être exactement 10, mais il y a 12 frames."


Scenario: Partie avec un nombre de frames inferieur a 10
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 |
| Joueur 1 | 10      | 3       | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    |
| Joueur 2 | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "Le nombre de frames doit être exactement 10, mais il y a seulement 7 frames."
And une erreur devrait se déclencher pour Joueur 2 avec le message "Le nombre de frames doit être exactement 10, mais il y a seulement 7 frames."