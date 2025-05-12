# --- Small static Go binary, ~30 MB -------------------
    FROM ghcr.io/supabase-community/mcp-server-supabase:latest

    # Optional: pin to a version instead of :latest
    #  ARG MCP_VERSION=v0.7.2
    #  FROM ghcr.io/supabase-community/mcp-server-supabase:${MCP_VERSION}
    
    # The binary already lives in the image as /usr/local/bin/mcp-server
    
    # Railway sets PORT; default to 3002 for local runs.
    ENV HTTP_PORT=${PORT:-3002}
    
    # Rely on env vars injected by Railway; keep CMD minimal
    CMD ["--access-token","${SUPABASE_PAT}","--project-ref","${SUPABASE_PROJECT_REF}","--http-port","${HTTP_PORT}"]
    