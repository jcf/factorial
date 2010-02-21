-- | Author: James Conroy-Finn
factorial n = if n > 0 then n * factorial (n - 1) else 1
