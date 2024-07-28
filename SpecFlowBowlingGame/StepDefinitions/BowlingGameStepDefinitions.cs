using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using NUnit.Framework;

namespace BowlingGame.Tests.StepDefinitions
{
    [Binding]
    public class BowlingStepDefinitions
    {
        private BowlingGame game;
        private Dictionary<string, int> playerScores;
        private Dictionary<string, string> playerErrors;

        // Initialisation avant chaque scénario de test
        [Given("un nouveau jeu de bowling commence")]
        public void GivenUnNouveauJeuDeBowlingAvecDeuxJoueurs()
        {
            game = new BowlingGame();
            playerScores = new Dictionary<string, int>();
            playerErrors = new Dictionary<string, string>();
        }

        // Traitement des lancers des joueurs à partir du tableau fourni
        [When("les lancers des joueurs sont:")]
        public void WhenLesLancersDesJoueursSont(Table table)
        {
            foreach (var row in table.Rows)
            {
                string playerName = row[0].Trim();
                var frames = new List<List<int>>();
                for (int i = 1; i < table.Header.Count; i++)
                {
                    var frameRolls = new List<int>();
                    var rollValues = row[i].Split(',');
                    foreach (var roll in rollValues)
                    {
                        if (int.TryParse(roll.Trim(), out int pins))
                        {
                            frameRolls.Add(pins);
                        }
                    }
                    frames.Add(frameRolls);
                }

                try
                {
                    game = new BowlingGame();
                    foreach (var frameRolls in frames)
                    {
                        game.Roll(frameRolls);
                    }
                    playerScores[playerName] = game.Score();
                }
                catch (Exception ex)
                {
                    playerErrors[playerName] = ex.Message;
                }
            }
        }

        // Vérification du score total d'un joueur
        [Then("le score total de (.*) devrait être (.*)")]
        public void ThenLeScoreTotalDevraitEtre(string playerName, int expectedScore)
        {
            playerName = playerName.Trim();
            if (playerErrors.ContainsKey(playerName))
            {
                // Échec du test si une erreur a été enregistrée pour le joueur
                Assert.Fail($"Erreur pour le joueur {playerName}: {playerErrors[playerName]}");
            }
            else
            {
                int actualScore = playerScores[playerName];
                // Vérification que le score attendu correspond au score calculé
                Assert.AreEqual(expectedScore, actualScore);
            }
        }

        // Vérification que le message d'erreur attendu a été déclenché pour un joueur
        [Then("une erreur devrait se déclencher pour (.*) avec le message \"(.*)\"")]
        public void ThenUneErreurDevraitSeDeclencherPourAvecLeMessage(string playerName, string expectedMessage)
        {
            playerName = playerName.Trim();
            Assert.IsTrue(playerErrors.ContainsKey(playerName), $"Aucune erreur déclenchée pour le joueur {playerName}");
            // Vérification que le message d'erreur correspond à celui attendu
            Assert.AreEqual(expectedMessage, playerErrors[playerName]);
        }
    }
}
