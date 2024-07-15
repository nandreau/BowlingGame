Feature: Bowling
  Calcul des scores pour une partie de bowling avec deux joueurs

Scenario: Partie complète sans strikes ni spares
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
    | Joueur 1 | 3, 5 | 2, 4 | 6, 0 | 3, 5 | 2, 4 | 6, 0 | 3, 5 | 2, 4 | 6, 0 | 3, 5 | 2, 4, 6 |
    | Joueur 2 | 2, 4 | 6, 3 | 7, 0 | 5, 2 | 8, 1 | 9, 0 | 3, 6 | 7, 2 | 5, 3 | 6, 1 | 2, 4, 7 |
Then le score total de Joueur 1 devrait être 82
And le score total de Joueur 2 devrait être 78

Scenario: Partie complète avec un spare
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
    | Joueur 1 | 5, 5 | 3, 4 | 2, 4 | 6, 0 | 3, 5 | 2, 4 | 6, 0 | 3, 5 | 2, 4 | 6, 0 | 3, 5, 2 |
    | Joueur 2 | 4, 6 | 2, 3 | 6, 3 | 7, 0 | 5, 2 | 8, 1 | 9, 0 | 3, 6 | 7, 2 | 5, 3 | 6, 1, 2 |
Then le score total de Joueur 1 devrait être 84
And le score total de Joueur 2 devrait être 79

Scenario: Partie complète avec un strike
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
    | Joueur 1 | 10, X | 3, 4 | 6, 0 | 3, 5 | 2, 4 | 6, 0 | 3, 5 | 2, 4 | 6, 0 | 3, 5 | 2, 4, 7 |
    | Joueur 2 | 7, 2 | 3, 6 | 7, 0 | 5, 2 | 8, 1 | 9, 0 | 3, 6 | 7, 2 | 5, 3 | 6, 1 | 2, 4, 5 |
Then le score total de Joueur 1 devrait être 90
And le score total de Joueur 2 devrait être 78

Scenario: Partie incomplète
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
    | Joueur 1 | 3, 5 | 2, 4 | 6, 0 |
    | Joueur 2 | 2, 4 | 6, 3 | 7, 0 |
Then le score total de Joueur 1 devrait être 20
And le score total de Joueur 2 devrait être 22

Scenario: Partie incomplète avec un spare
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
    | Joueur 1 | 5, 5 | 3, 4 | 2, 4 |
    | Joueur 2 | 4, 6 | 2, 3 | 6, 3 |
Then le score total de Joueur 1 devrait être 22
And le score total de Joueur 2 devrait être 17

Scenario: Partie incomplète avec un strike
Given un nouveau jeu de bowling avec deux joueurs
When les lancers des joueurs sont:
    | Joueur 1 | 10, X | 3, 4 | 2, 4 |
    | Joueur 2 | 7, 2 | 3, 6 | 7, 0 |
Then le score total de Joueur 1 devrait être 24
And le score total de Joueur 2 devrait être 25
