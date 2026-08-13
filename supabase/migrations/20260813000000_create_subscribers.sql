create table if not exists public.subscribers (
  id uuid primary key default gen_random_uuid(),
  email text not null,
  created_at timestamptz not null default now()
);

alter table public.subscribers enable row level security;

create policy "Qualquer pessoa pode se cadastrar"
  on public.subscribers
  for insert
  to anon
  with check (true);
