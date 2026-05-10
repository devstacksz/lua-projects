# lua-projects

Lua learning projects — from hello world to a todo-list API with SQLite persistence.

## Contents

### `helloworld/`

Basic Lua syntax and program structure.

```bash
lua helloworld/hello_world.lua
```

### `todo-list/`

A todo-list application with an HTTP server and SQLite database.

| File | Purpose |
|------|---------|
| `todo_list.lua` | Core todo list logic |
| `db_manager.lua` | SQLite read/write operations |
| `http_server.lua` | HTTP API server |
| `todo-list-dev-1.rockspec` | LuaRocks package spec |

```bash
cd todo-list
luarocks install --only-deps todo-list-dev-1.rockspec
lua http_server.lua
```

## Status

DB communication was the last thing worked on — `db_manager.lua` and `http_server.lua` exist but the HTTP routes are not fully wired to the DB layer yet.

## Next Steps

1. **Finish the HTTP endpoints** — connect each route in `http_server.lua` to the corresponding `db_manager` function (create, list, update, delete).
2. **Smoke test with curl** — confirm CRUD works end to end before adding anything else:
   ```bash
   curl -X POST http://localhost:8080/todos -d '{"text":"buy milk"}'
   curl http://localhost:8080/todos
   ```
3. **Pivot to Neovim** — if the goal of learning Lua was Neovim plugin development, write a small plugin now. A quick-noter or a project switcher is a good first plugin and directly uses what's here.
4. **Otherwise archive** — the HTTP + SQLite patterns are learned. Apply them somewhere useful or mark the repo as a reference.
