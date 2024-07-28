Feature: Bowling
Calcul des scores pour une partie de bowling commence

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

Scenario: Partie avec seulement des strikes et des spares
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10   |
| Joueur 1 | 10      | 10      | 10      | 10      | 10      | 10      | 10      | 10      | 10      | 10, 10, 10 |
| Joueur 2 | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1, 10   |
Then le score total de Joueur 1 devrait être 300
And le score total de Joueur 2 devrait être 191

Scenario: Partie avec un seul joueur
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 6     |
Then le score total de Joueur 1 devrait être 69

Scenario: Partie avec trois joueurs
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 6     |
| Joueur 2 | 2, 4    | 6, 3    | 7, 0    | 5, 2    | 8, 1    | 9, 0    | 3, 6    | 7, 2    | 5, 3    | 6, 1     |
| Joueur 3 | 2, 5    | 6, 3    | 7, 0    | 5, 2    | 8, 1    | 9, 0    | 3, 6    | 7, 2    | 5, 3    | 6, 1     |
Then le score total de Joueur 1 devrait être 69
And le score total de Joueur 2 devrait être 80
And le score total de Joueur 3 devrait être 81

Scenario: Partie avec une frame incomplète 
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 4, 4    | 4, 4    |  5, 5   | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    |          |
| Joueur 2 | 4, 4    |         |  5, 5   | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "La frame 10 est incomplète."
And une erreur devrait se déclencher pour Joueur 2 avec le message "La frame 2 est incomplète."

Scenario: Partie avec une frame semi-incomplète
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 10      | 3       | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     |
| Joueur 2 | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 6     |
| Joueur 3 | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 10, 1    |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "La frame 2 est semi-incomplète."
And une erreur devrait se déclencher pour Joueur 2 avec le message "La frame 10 est semi-incomplète pour un spare."
And une erreur devrait se déclencher pour Joueur 3 avec le message "La frame 10 est semi-incomplète pour un strike."

Scenario: Partie avec un nombre de frames supérieur à 10
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 | frame 11 | frame 12 |
| Joueur 1 | 10      | 3       | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     | 4, 4     | 4, 4     |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "Le nombre de frames doit être exactement 10, mais il y a 12 frames."

Scenario: Partie avec un nombre de frames inferieur à 10
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 |
| Joueur 1 | 10      | 3       | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "Le nombre de frames doit être exactement 10, mais il y a seulement 7 frames."

Scenario: Partie avec une frame dont il y a plus de lancers que nécessaire
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 10, 1   | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     |
| Joueur 2 | 4, 6    | 2, 2, 2 | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "La frame 1 contient trop de lancers pour un strike."
And une erreur devrait se déclencher pour Joueur 2 avec le message "La frame 2 contient trop de lancers."

Scenario: Partie avec une frame dont le score total est trop élevé
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10      |
| Joueur 1 | 4, 7    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4          |
| Joueur 2 | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 7, 10      |
| Joueur 3 | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 10, 10, 11    |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "Le total des quilles pour la frame 1 ne peut pas dépasser 10. Total trouvé: 11."
And une erreur devrait se déclencher pour Joueur 2 avec le message "Le total des quilles pour la frame 10 ne peut pas dépasser 20 s'il y a un spare. Total trouvé: 21."
And une erreur devrait se déclencher pour Joueur 3 avec le message "Le total des quilles pour la frame 10 ne peut pas dépasser 30 s'il y a un strike. Total trouvé: 31."

Scenario: Partie avec une frame dont la nombre de quilles tombés est incorrecte
Given un nouveau jeu de bowling commence
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 4, -1   | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     |
| Joueur 2 | 4, 4    | 14, -7  | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4    | 4, 4     |
Then une erreur devrait se déclencher pour Joueur 1 avec le message "La frame 1 doit seulement contenir des nombres positifs. Valeur trouvée: -1."
And une erreur devrait se déclencher pour Joueur 2 avec le message "La frame 2 doit seulement contenir des nombres ne dépassant pas 10. Valeur trouvée: 14."