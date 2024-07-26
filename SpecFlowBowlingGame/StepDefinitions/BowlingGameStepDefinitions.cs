using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using NUnit.Framework;
using TechTalk.SpecFlow.Assist;

namespace BowlingGame.Tests.StepDefinitions
{
    [Binding]
    public class BowlingStepDefinitions
    {
        private BowlingGame game;
        private Dictionary<string, int> playerScores;

        [Given("un nouveau jeu de bowling avec deux joueurs")]
        public void GivenUnNouveauJeuDeBowlingAvecDeuxJoueurs()
        {
            game = new BowlingGame();
            playerScores = new Dictionary<string, int>();
        }

        [When("les lancers des joueurs sont:")]
        public void WhenLesLancersDesJoueursSont(Table table)
        {
            foreach (var row in table.Rows)
            {
                string playerName = row[0].Trim(); // Trim to remove any leading or trailing whitespace
                var rolls = new List<int>();
                for (int i = 1; i < table.Header.Count; i++)
                {
                    var rollValues = row[i].Split(',');
                    foreach (var roll in rollValues)
                    {
                        if (int.TryParse(roll.Trim(), out int pins))
                        {
                            rolls.Add(pins);
                        }
                    }
                }
                // Reset game for each player
                game = new BowlingGame();
                foreach (var pins in rolls)
                {
                    game.Roll(pins);
                }
                // Store the score for the current player
                playerScores[playerName] = game.Score();
            }
        }

        [Then("le score total de (.*) devrait être (.*)")]
        public void ThenLeScoreTotalDevraitEtre(string playerName, int expectedScore)
        {
            playerName = playerName.Trim(); // Trim to ensure key matching consistency
            int actualScore = playerScores[playerName];
            Assert.AreEqual(expectedScore, actualScore);
        }
    }
}
