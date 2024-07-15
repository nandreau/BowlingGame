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
        private Dictionary<string, List<int[]>> playerRolls;

        [Given("un nouveau jeu de bowling avec deux joueurs")]
        public void GivenUnNouveauJeuDeBowlingAvecDeuxJoueurs()
        {
            game = new BowlingGame();
            playerRolls = new Dictionary<string, List<int[]>>();
        }

        [When("les lancers des joueurs sont:")]
        public void WhenLesLancersDesJoueursSont(Table table)
        {
            foreach (var row in table.Rows)
            {
                string playerName = row[0];
                var rolls = new List<int[]>();
                for (int i = 1; i < table.Header.Count; i++)
                {
                    if (row[i] == "X") continue;
                    var rollValues = row[i].Split(',');
                    rolls.Add(Array.ConvertAll(rollValues, int.Parse));
                }
                playerRolls[playerName] = rolls;
            }
            Console.WriteLine($"Player: {playerRolls}");
            foreach (var player in playerRolls)
            {
                game = new BowlingGame();
                foreach (var frame in player.Value)
                {
                    foreach (var pins in frame)
                    {
                        game.Roll(pins);
                    }
                }
            }
        }

        [Then("le score total de (.*) devrait être (.*)")]
        public void ThenLeScoreTotalDevraitEtre(string playerName, int expectedScore)
        {
            int actualScore = game.Score();
            Assert.AreEqual(expectedScore, actualScore);
        }
    }
}
