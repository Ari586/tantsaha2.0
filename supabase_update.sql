-- Script de mise à jour (à utiliser si la table existe déjà)
-- Exécutez ceci dans le SQL Editor de Supabase

-- 1. Vérifier que les politiques RLS sont bien activées
ALTER TABLE public.activation_codes ENABLE ROW LEVEL SECURITY;

-- 2. Supprimer les anciennes politiques (si elles existent)
DROP POLICY IF EXISTS "Enable read access for all users" ON public.activation_codes;
DROP POLICY IF EXISTS "Enable update for all users" ON public.activation_codes;
DROP POLICY IF EXISTS "Enable insert for all users" ON public.activation_codes;

-- 3. Recréer les politiques
CREATE POLICY "Enable read access for all users"
ON public.activation_codes FOR SELECT
USING (true);

CREATE POLICY "Enable update for all users"
ON public.activation_codes FOR UPDATE
USING (true)
WITH CHECK (true);

CREATE POLICY "Enable insert for all users"
ON public.activation_codes FOR INSERT
WITH CHECK (true);

-- 4. Ajouter les codes de test (s'ils n'existent pas déjà)
INSERT INTO public.activation_codes (code, is_used)
VALUES 
  ('AKOHO2024', false),
  ('TANTSAHA2024', false),
  ('MALAGASY2024', false),
  ('VOKATRA2024', false),
  ('FAMBOLENA2024', false)
ON CONFLICT (code) DO NOTHING;

-- 5. Vérification : Afficher tous les codes existants
SELECT code, is_used, created_at FROM public.activation_codes ORDER BY created_at DESC;
