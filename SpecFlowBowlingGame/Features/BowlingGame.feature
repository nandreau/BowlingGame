Feature: Bowling
Calcul des scores pour une partie de bowling avec deux joueurs


Scenario: Partie complète avec seulement des strikes et des spares
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10   |
| Joueur 1 | 10  | 10  | 10  | 10  | 10  | 10  | 10  | 10  | 10  | 10, 10, 10 |
| Joueur 2 | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1    | 9, 1, 10   |
Then le score total de Joueur 1 devrait être 300
And le score total de Joueur 2 devrait être 191

Scenario: Partie complète sans strikes ni spares
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 6     |
| Joueur 2 | 2, 4    | 6, 3    | 7, 0    | 5, 2    | 8, 1    | 9, 0    | 3, 6    | 7, 2    | 5, 3    | 6, 1     |
Then le score total de Joueur 1 devrait être 69
And le score total de Joueur 2 devrait être 80

Scenario: Partie complète avec un spare
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 5, 5    | 3, 4    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0 |
| Joueur 2 | 4, 6    | 2, 3    | 6, 3    | 7, 0    | 5, 2    | 8, 1    | 9, 0    | 3, 6    | 7, 2    | 5, 3  |
Then le score total de Joueur 1 devrait être 72
And le score total de Joueur 2 devrait être 84

Scenario: Partie complète avec un strike
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 | frame 4 | frame 5 | frame 6 | frame 7 | frame 8 | frame 9 | frame 10 |
| Joueur 1 | 10      | 3, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 5    | 2, 4    | 6, 0    | 3, 5  |
| Joueur 2 | 10      | 3, 5    | 7, 0    | 5, 2    | 8, 1    | 9, 0    | 3, 6    | 7, 2    | 5, 3    | 6, 1  |
Then le score total de Joueur 1 devrait être 78
And le score total de Joueur 2 devrait être 91

Scenario: Partie incomplète
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 |
| Joueur 1 | 3, 5    | 2, 4    | 6, 0    |
| Joueur 2 | 2, 4    | 6, 3    | 7, 0    |
Then le score total de Joueur 1 devrait être 20
And le score total de Joueur 2 devrait être 22

Scenario: Partie incomplète avec un spare
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 |
| Joueur 1 | 5, 5    | 3, 4    | 2, 4    |
| Joueur 2 | 4, 6    | 9, 0    | 6, 3    |
Then le score total de Joueur 1 devrait être 26
And le score total de Joueur 2 devrait être 37

Scenario: Partie incomplète avec un strike
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
| name     | frame 1 | frame 2 | frame 3 |
| Joueur 1 | 10      | 3, 4    | 2, 4    |
| Joueur 2 | 10      | 3, 6    | 7, 0    |
Then le score total de Joueur 1 devrait être 30
And le score total de Joueur 2 devrait être 35