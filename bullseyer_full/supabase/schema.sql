-- Bullseyer Supabase Schema

create extension if not exists pgcrypto;

create table if not exists seasons (
  id uuid primary key default gen_random_uuid(),
  start_date date not null,
  end_date date not null,
  active bool default true
);

create table if not exists users_ext (
  id uuid primary key,               -- supabase auth.users.id
  display_name text,
  role text default 'player'
);

create table if not exists matchdays (
  id uuid primary key default gen_random_uuid(),
  season_id uuid references seasons(id) on delete cascade,
  match_date date not null
);

create table if not exists matches (
  id uuid primary key default gen_random_uuid(),
  matchday_id uuid references matchdays(id) on delete cascade,
  player1_id uuid references users_ext(id),
  player2_id uuid references users_ext(id),
  board int default 1,
  legs_best_of int default 3,
  sets_best_of int default 1,
  double_in bool default false,
  double_out bool default true,
  winner_id uuid,
  created_at timestamptz default now()
);

create table if not exists legs (
  id uuid primary key default gen_random_uuid(),
  match_id uuid references matches(id) on delete cascade,
  leg_no int,
  player1_score int default 501,
  player2_score int default 501,
  player1_darts int default 0,
  player2_darts int default 0,
  winner_id uuid,
  high_finish int,
  bull_finish bool default false,
  finish_darts int,
  created_at timestamptz default now()
);
