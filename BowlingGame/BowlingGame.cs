using System;
using System.Collections.Generic;
using System.Text.Json;

namespace BowlingGame
{
    public class BowlingGame
    {
        private List<List<int>> frames = new List<List<int>>();

        public void Roll(List<int> frameRolls)
        {
            if (frames.Count < 9 && frameRolls.Count > 1 && frameRolls[0] == 10)
            {
                throw new Exception($"Frame {frames.Count + 1} contient trop de lancers pour un strike.");
            }
            if (frameRolls.Count > 3 || (frames.Count < 9 && frameRolls.Count > 2))
            {
                throw new Exception($"Frame {frames.Count + 1} contient trop de lancers.");
            }
            frames.Add(frameRolls);
        }

        public int Score()
        {
            if (frames.Count < 10)
            {
                throw new Exception($"Le nombre de frames doit être exactement 10, mais il y a seulement {frames.Count} frames.");
            }
            if (frames.Count > 10)
            {
                throw new Exception($"Le nombre de frames doit être exactement 10, mais il y a {frames.Count} frames.");
            }

            int score = 0;

            for (int frame = 0; frame < frames.Count; frame++)
            {
                var frameRolls = frames[frame];
                if (frameRolls.Count == 0)
                {
                    throw new Exception($"Frame {frame + 1} incomplète détectée.");
                }

                if (IsStrike(frameRolls))
                {
                    score += 10 + StrikeBonus(frame);
                }
                else if (IsSpare(frameRolls))
                {
                    score += 10 + SpareBonus(frame);
                }
                else
                {
                    if (frameRolls.Count != 2)
                    {
                        throw new Exception($"Frame {frame + 1} semi-incomplète détectée.");
                    }
                    score += SumOfBallsInFrame(frameRolls);
                }
            }

            return score;
        }

        private bool IsStrike(List<int> frameRolls)
        {
            return frameRolls.Count > 0 && frameRolls[0] == 10;
        }

        private bool IsSpare(List<int> frameRolls)
        {
            return frameRolls.Count > 1 && frameRolls[0] + frameRolls[1] == 10;
        }

        private int StrikeBonus(int frameIndex)
        {
            if (frameIndex == 9)
            {
                if (frames[frameIndex].Count < 3)
                {
                    throw new Exception($"Frame {frameIndex + 1} semi-incomplète détectée à la frame {frameIndex + 1} pour un strike.");
                }
                return frames[frameIndex][1] + frames[frameIndex][2];
            }

            if (frameIndex + 1 < frames.Count)
            {
                var nextFrame = frames[frameIndex + 1];
                if (nextFrame.Count > 1)
                {
                    return nextFrame[0] + nextFrame[1];
                }
                else if (nextFrame.Count == 1 && frameIndex + 2 < frames.Count)
                {
                    return nextFrame[0] + frames[frameIndex + 2][0];
                }
                else if (nextFrame.Count == 1)
                {
                    return nextFrame[0] + frames[frameIndex + 1][1];
                }
            }
            return 0;
        }

        private int SpareBonus(int frameIndex)
        {
            if (frameIndex == 9)
            {
                if (frames[frameIndex].Count < 3)
                {
                    throw new Exception($"Frame {frameIndex + 1} semi-incomplète détectée à la frame {frameIndex + 1} pour un spare.");
                }
                return frames[frameIndex][2];
            }

            if (frameIndex + 1 < frames.Count)
            {
                return frames[frameIndex + 1][0];
            }
            return 0;
        }

        private int SumOfBallsInFrame(List<int> frameRolls)
        {
            int sum = 0;
            foreach (var roll in frameRolls)
            {
                sum += roll;
            }
            return sum;
        }
    }
}
