# Bullseyer – Darts‑Scorer (MVP)

Dieses Repository enthält **Frontend (SvelteKit + Tailwind)** und **Supabase‑SQL**.

## 1. Lokal starten

```bash
# Supabase CLI installieren:
npm install -g supabase

# Projekt klonen
git clone <repo-url> bullseyer
cd bullseyer

# Supabase-Backend starten
supabase start          # startet Postgres + Studio
supabase db reset       # spielt supabase/schema.sql ein

# Frontend
cd frontend
cp ../.env.example .env # Supabase-Keys hier eintragen
npm install
npm run dev
```

Frontend läuft nun auf http://localhost:5173

## 2. Deployment

| Teil | Dienst | Schritt |
|------|--------|---------|
| Backend | Supabase.com (Free) | Neues Projekt → SQL Editor → `schema.sql` ausführen |
| Frontend | Vercel.com (Free)  | „Import Git“, Env‑Vars `PUBLIC_SUPABASE_URL` & `PUBLIC_SUPABASE_ANON_KEY` setzen |

## 3. Strukturelle Übersicht

```
supabase/          – SQL-Dump & Policies
frontend/          – SvelteKit-App
  src/routes/      – Seiten (Login, Dashboard …)
  src/lib/         – Hilfsfunktionen (Round‑Robin-Paarungen)
```

Alles in **Deutsch**, helles Theme, keine Push‑Nachrichten, kein TV‑Modus.

Viel Spaß!
