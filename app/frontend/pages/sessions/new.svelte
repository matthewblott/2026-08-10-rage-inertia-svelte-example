<script>
  import { router } from '@inertiajs/svelte'

  function submit(e) {
    e.preventDefault()
    const formData = new FormData(e.target)
    router.post('/sessions', Object.fromEntries(formData))
  }
</script>

<form on:submit={submit}>
  <input name="email" type="email" value="sally@example.com">
  <input name="password" type="password" value="password">
  <button>Sign in</button>
</form>
