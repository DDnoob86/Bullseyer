<script>
  export let data;
</script>

<div class="min-h-screen bg-gray-50 text-gray-900 font-sans">
  <header class="w-full bg-primary text-white p-4 flex items-center justify-between">
    <h1 class="text-xl font-semibold">Bullseyer</h1>
    <nav class="space-x-2">
      <a href="/dashboard" class="underline">Dashboard</a>
      <a href="/" class="underline">Logout</a>
    </nav>
  </header>
  <main class="p-4">
    <slot />
  </main>
</div>
