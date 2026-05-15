-- Compatibilidad Dashboard + Prestamos Pro
alter table public.loans add column if not exists name text;
alter table public.loans add column if not exists principal numeric default 0;
alter table public.loans add column if not exists interest numeric default 0;
alter table public.loans add column if not exists note text;
alter table public.loans add column if not exists start_date date default current_date;
alter table public.loans add column if not exists status text default 'activo';
alter table public.loans add column if not exists current_balance numeric default 0;
alter table public.loans add column if not exists balance numeric default 0;
alter table public.loans alter column nombre drop not null;
alter table public.loans alter column monto_total drop not null;
alter table public.loans alter column saldo_actual drop not null;

alter table public.loan_payments add column if not exists amount numeric default 0;
alter table public.loan_payments add column if not exists payment_date date default current_date;
alter table public.loan_payments add column if not exists note text;
alter table public.loan_payments alter column monto drop not null;
alter table public.loan_payments alter column loan_id drop not null;
alter table public.loan_payments alter column user_id drop not null;

alter table public.transactions add column if not exists amount numeric default 0;
alter table public.transactions add column if not exists type text;
alter table public.transactions add column if not exists description text;
alter table public.transactions add column if not exists tx_date date default current_date;
alter table public.transactions add column if not exists category text;
alter table public.transactions add column if not exists note text;

alter table public.budgets add column if not exists month text;
alter table public.budgets add column if not exists amount numeric default 0;

alter table public.categories add column if not exists name text;
alter table public.categories add column if not exists icon text;
alter table public.categories add column if not exists type text default 'gasto';

notify pgrst, 'reload schema';
