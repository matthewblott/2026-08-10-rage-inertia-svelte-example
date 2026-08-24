<script>
  let { foo } = $props()
  import { inertia } from '@inertiajs/svelte'
</script>

<h1>{foo.message}</h1>

<a href="/" use:inertia>Home</a>
