# Projet Bowling

## Description

Ce projet est une bibliothèque en C# qui implémente la gestion des parties de bowling. Il encapsule les règles du jeu, y compris le calcul des scores et la validation des entrées. Les fonctionnalités principales incluent la gestion des lancers, le calcul des scores en tenant compte des strikes, des spares et des erreurs potentielles.

## Fonctionnalités

Le projet permet de :
- Gérer les lancers des joueurs pour une partie de bowling.
- Calculer le score total des joueurs en prenant en compte les strikes, les spares, et les frames normales.
- Vérifier la validité des frames en s'assurant que le nombre de lancers et le total des quilles respectent les règles du jeu.
- Gérer les erreurs liées aux frames incomplètes, aux frames avec des lancers incorrects, et aux frames avec un nombre de quilles incorrect.

## Scénarios de Test

Les tests suivants sont implémentés pour vérifier le bon fonctionnement du calcul des scores et la gestion des erreurs :

- **Partie sans strikes ni spares** : Vérifie le calcul du score lorsque la partie se joue sans strikes ni spares.
- **Partie avec un spare** : Vérifie le calcul du score lorsque des spares sont présents dans la partie.
- **Partie avec un strike** : Vérifie le calcul du score lorsque des strikes sont présents dans la partie.
- **Partie avec seulement des strikes et des spares** : Vérifie le calcul du score pour une partie remplie uniquement de strikes et de spares.
- **Partie avec un seul joueur** : Vérifie le calcul du score pour une partie avec un seul joueur.
- **Partie avec trois joueurs** : Vérifie le calcul des scores pour une partie avec trois joueurs.
- **Partie avec une frame incomplète** : Vérifie la gestion des erreurs lorsqu'une frame est incomplète.
- **Partie avec une frame semi-incomplète** : Vérifie la gestion des erreurs lorsqu'une frame est semi-incomplète.
- **Partie avec un nombre de frames supérieur à 10** : Vérifie la gestion des erreurs lorsque le nombre de frames dépasse 10.
- **Partie avec un nombre de frames inférieur à 10** : Vérifie la gestion des erreurs lorsque le nombre de frames est inférieur à 10.
- **Partie avec une frame dont il y a plus de lancers que nécessaire** : Vérifie la gestion des erreurs lorsqu'une frame contient trop de lancers.
- **Partie avec une frame dont le score total est trop élevé** : Vérifie la gestion des erreurs lorsque le score total d'une frame dépasse les limites autorisées.
- **Partie avec une frame dont le nombre de quilles tombées est incorrect** : Vérifie la gestion des erreurs lorsque le nombre de quilles tombées dépasse les limites autorisées ou est négatif.

## Utilisation

Le projet utilise SpecFlow pour les tests BDD. Assurez-vous d'avoir SpecFlow installé pour exécuter les scénarios de test.

## Licence

Ce projet est fourni en tant que projet scolaire et est libre de droits.