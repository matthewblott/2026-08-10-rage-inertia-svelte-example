# Agent Instructions

## Overview

This is a **Rage + Inertia.js + Svelte** full-stack application. It uses the Rage Ruby web framework (not Rails) with Inertia.js to render Svelte 5 components on the server side, creating a modern SPA-like experience without a separate API layer.

## Technology Stack

- **Backend**: [Rage](https://rage-rb.dev) (v1.27+) - Fast Ruby web framework, Rails-inspired
- **Database**: SQLite with ActiveRecord
- **Frontend**: Svelte 5 + Inertia.js + Vite
- **Package Manager**: Bun (see `app/frontend/bun.lock`)

## Directory Structure

```
app/
├── controllers/          # Ruby controllers (inherit from RageController::Inertia)
├── models/              # ActiveRecord models
│   └── layouts/         # HTML layouts
└── frontend/            # Frontend code
    ├── pages/           # Svelte pages (mirrors controller structure)
    │   ├── home/
    │   ├── sessions/
    │   ├── foo/
    │   └── todos/
    ├── src/main.js      # Vite entry point
    ├── index.html       # Vite HTML template
    ├── vite.config.js   # Vite configuration
    └── svelte.config.js # Svelte configuration
config/
├── routes.rb            # Rage routes definition
db/
├── migrations/          # ActiveRecord migrations
```

## Development Commands

```bash
# Install dependencies
bundle install
cd app/frontend && npm install && cd ../..

# Database
rage db:migrate

# Server
cd app/frontend && npm run dev &  # Start Vite dev server
rage s                            # Start Rage server

# Build for production
cd app/frontend && npm run build
```

## Key Conventions

### Controllers

Controllers must inherit from `RageController::Inertia`:

```ruby
class HomeController < RageController::Inertia
  def index
    render inertia: "home/index", props: { user: current_user }
  end
end
```

- Use `render inertia: "page/path"` to render Svelte components
- Props are passed to the Svelte component's `data` prop
- Controller actions map to `app/frontend/pages/{name}.svelte` files

### Frontend Pages

Pages are Svelte 5 components in `app/frontend/pages/`:

```svelte
<!-- app/frontend/pages/todos/index.svelte -->
<script>
  import { inertia, Link } from "@inertiajs/svelte";
  
  let { data } = $props();  // Props from controller
</script>

<div class="container mx-auto p-4">
  <h1>Todos</h1>
</div>
```

### Inertia.js Helpers

```javascript
import { inertia, Link, router } from "@inertiajs/svelte";

// Navigation
<Link href="/todos">Todos</Link>
<button use:inertia={{ href: '/logout', method: 'delete' }}>Logout</button>

// Form submissions
import { useForm } from "@inertiajs/svelte";
const form = useForm({ email: '', password: '' });

// Programmatic navigation
import { router } from "@inertiajs/svelte";
router.visit('/todos');
router.post('/sessions', { email, password });
```

## Authentication

- `Current` model stores thread-safe current user/session
- `Authentication` concern in controllers provides `authenticate_user!` helper
- Sessions controller handles login/logout via Inertia forms

## Routes

Routes are defined in `config/routes.rb`:

```ruby
Rage.routes.draw do
  resources :todos
  root 'home#index'
end
```

## Database

- Uses ActiveRecord with SQLite
- Run migrations with `rage db:migrate`
- Migrations stored in `db/migrate/`

## Build Configuration

- Vite dev server runs separately from Rage server
- In production, Vite builds to `public/build/` (or similar)
- Rage serves the built assets

## Troubleshooting

- **Both servers must run**: Vite for HMR on `:5173`, Rage on `:3000`
- **Page not rendering**: Check that the Svelte file exists at the exact path referenced in `render inertia:`
- **Props not updating**: Ensure props are being passed in the controller's render call
