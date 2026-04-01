# =============================================================================
# STARTUP.SH — Štartovací skript pre Azure App Service
# =============================================================================
# Azure tento skript spustí pri štarte aplikácie.
# gunicorn = produkčný server (Flask development server sa NEPOUŽÍVA v produkcii!)
#
# --bind=0.0.0.0:8000  = počúva na porte 8000 (Azure požaduje tento port)
# --timeout 600         = timeout 10 minút
# app:app              = modul:premenná (súbor app.py, premenná app)
# =============================================================================

#!/usr/bin/env bash

# Bind to the port provided by the environment (Azure sets $PORT)
# Fallback to 8000 if PORT is not set
PORT_TO_BIND="${PORT:-8000}"
gunicorn --bind=0.0.0.0:${PORT_TO_BIND} --timeout 600 app:app
