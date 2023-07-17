Feature: Landing Page
    Espaces de présentation de votre application. Elle est présentée comme une page d'accueil de votre application.
    Elle est composée de plusieurs sections qui peuvent être modifiées à votre guise.
    
    Scenario: Affichage du Cover
        Given J'ai une application avec un Cover configuré
        Then Je dois voir "Mon titre"
        And Je dois voir "Ma description"
        And Je vois un bouton avec l'image "Mon image"
        And Je vois un bouton avec l'image "Mon image"
        And Je dois voir "Bottom title"
        
    Scenario: Lancement d'un lien du Cover
        Given J'ai une application avec un Cover configuré
        When Je clique sur le premier bouton disponible
        Then Je suis redirigé vers "Mon lien"