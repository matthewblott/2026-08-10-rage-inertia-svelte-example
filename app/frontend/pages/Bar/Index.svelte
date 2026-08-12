<script>
  let { foo } = $props()
  import { Link } from '@inertiajs/svelte'

</script>

<h1>{foo.message}!</h1>

<Link href="/foo">Foo</Link>
