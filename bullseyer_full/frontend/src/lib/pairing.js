export function generateRoundRobin(players) {
  const rounds = [];
  if (players.length % 2) players.push(null);
  const numRounds = players.length - 1;
  const half = players.length / 2;
  const p = players.slice();
  for (let r = 0; r < numRounds; r++) {
    const pairs = [];
    for (let i = 0; i < half; i++) {
      const home = p[i];
      const away = p[p.length - 1 - i];
      if (home && away) pairs.push([home, away]);
    }
    rounds.push(pairs);
    p.splice(1, 0, p.pop());
  }
  return rounds;
}
