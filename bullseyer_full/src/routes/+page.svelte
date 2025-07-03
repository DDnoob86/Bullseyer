<script>
  import { goto } from '$app/navigation';
  import { createClient } from '@supabase/supabase-js';
  const supabase = createClient(import.meta.env.PUBLIC_SUPABASE_URL, import.meta.env.PUBLIC_SUPABASE_ANON_KEY);

  let email = '';
  let password = '';
  let error = '';

  async function handleLogin() {
    const { error: err } = await supabase.auth.signInWithPassword({ email, password });
    if (err) {
      error = err.message;
    } else { goto('/dashboard'); }
  }
</script>

<div class="max-w-sm mx-auto mt-10 space-y-4">
  <h2 class="text-xl font-bold">Login</h2>
  {#if error}<p class="text-red-600">{error}</p>{/if}
  <input bind:value={email} type="email" placeholder="E-Mail" class="w-full border p-2 rounded" />
  <input bind:value={password} type="password" placeholder="Passwort" class="w-full border p-2 rounded" />
  <button class="w-full bg-primary text-white p-2 rounded" on:click={handleLogin}>Anmelden</button>
</div>
