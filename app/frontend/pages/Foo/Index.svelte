<script>
  let { foo } = $props()
  import { inertia } from '@inertiajs/svelte'
</script>

<h1>{foo.message}</h1>

<a href="/bar" use:inertia>Bar</a>
