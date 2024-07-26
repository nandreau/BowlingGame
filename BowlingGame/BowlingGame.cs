using System.Collections.Generic;

namespace BowlingGame
{
    public class BowlingGame
    {
        private List<int> rolls = new List<int>();

        public void Roll(int pins)
        {
            rolls.Add(pins);
        }

        public int Score()
        {
            int score = 0;
            int rollIndex = 0;
            for (int frame = 0; frame < 10; frame++)
            {
                if (rollIndex >= rolls.Count) break;

                if (IsStrike(rollIndex))
                {
                    score += 10 + StrikeBonus(rollIndex);
                    rollIndex++;
                }
                else if (IsSpare(rollIndex))
                {
                    score += 10 + SpareBonus(rollIndex);
                    rollIndex += 2;
                }
                else
                {
                    score += SumOfBallsInFrame(rollIndex);
                    rollIndex += 2;
                }
            }
            return score;
        }

        private bool IsStrike(int rollIndex)
        {
            return rollIndex < rolls.Count && rolls[rollIndex] == 10;
        }

        private bool IsSpare(int rollIndex)
        {
            return rollIndex + 1 < rolls.Count && rolls[rollIndex] + rolls[rollIndex + 1] == 10;
        }

        private int StrikeBonus(int rollIndex)
        {
            if (rollIndex + 2 < rolls.Count)
            {
                return rolls[rollIndex + 1] + rolls[rollIndex + 2];
            }
            return 0;
        }

        private int SpareBonus(int rollIndex)
        {
            if (rollIndex + 2 < rolls.Count)
            {
                return rolls[rollIndex + 2];
            }
            return 0;
        }

        private int SumOfBallsInFrame(int rollIndex)
        {
            if (rollIndex + 1 < rolls.Count)
            {
                return rolls[rollIndex] + rolls[rollIndex + 1];
            }
            return rolls[rollIndex];
        }
    }
}