# syntax=docker/dockerfile:1         # ← enables ${VAR:-default} syntax

# ------------------------------------------------------------------
# 1️⃣  Base image  – switch to Metorial’s wrapper image
# ------------------------------------------------------------------
FROM ghcr.io/metorial/mcp-container--supabase-community--supabase-mcp--mcp-server-supabase:latest

# ------------------------------------------------------------------
# 2️⃣  Runtime configuration
#     Railway injects PORT; default to 3002 when you run `docker run`.
# ------------------------------------------------------------------
ENV HTTP_PORT=${PORT:-3002}

# ------------------------------------------------------------------
# 3️⃣  Start the stdio server that lives in the wrapper image.
#     (The wrapper contains the compiled JS in /usr/src/app/dist)
# ------------------------------------------------------------------
CMD ["node", "./dist/stdio.js", \
        "--access-token", "${SUPABASE_ACCESS_TOKEN}", \
        "--project-ref",  "${SUPABASE_PROJECT_REF}", \
        "--http-port",    "${HTTP_PORT}"]