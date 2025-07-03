<script>
  import { createClient } from '@supabase/supabase-js';
  const supabase = createClient(import.meta.env.PUBLIC_SUPABASE_URL, import.meta.env.PUBLIC_SUPABASE_ANON_KEY);

  let matches = [];
  async function fetchMatches() {
    const { data } = await supabase.from('matches').select('*').order('created_at', { ascending: false });
    matches = data ?? [];
  }

  supabase.channel('public:matches')
    .on('postgres_changes', { event: '*', schema: 'public', table: 'matches' }, payload => fetchMatches())
    .subscribe();

  fetchMatches();
</script>

<h2 class="text-xl font-bold mb-4">Aktuelle Matches</h2>
<table class="w-full border">
  <thead>
    <tr class="bg-gray-100"><th>Spieler 1</th><th>Spieler 2</th><th>Brett</th><th>Sieger</th></tr>
  </thead>
  <tbody>
    {#each matches as m}
      <tr class="border-b">
        <td>{m.player1_id}</td>
        <td>{m.player2_id}</td>
        <td class="text-center">{m.board}</td>
        <td>{m.winner_id ?? '-'}</td>
      </tr>
    {/each}
  </tbody>
</table>
