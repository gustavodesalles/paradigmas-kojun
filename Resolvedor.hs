module Resolvedor where
import Tabuleiro

type Choices = [Value]
--o tabuleiro será válido se:
--1: Nenhuma célula vizinha (horizontal e vertical) possuir os mesmos valores;
--2: A ordem vertical dos valores de uma região seja decrescente.
valido :: GradeValores -> GradeRegioes -> Bool 
valido valores regioes = all vizinhosDiferentes (linhas valores) && all vizinhosDiferentes (colunas valores) && all ordemDecrescente (colunas (matrizValoresRegioes valores regioes))

--verifica se os vizinhos possuem valores diferentes (incompleta ?)
vizinhosDiferentes :: Eq a => [a] -> Bool 
vizinhosDiferentes [] = True
vizinhosDiferentes [_] = True
vizinhosDiferentes (x:xs)
    | (x /= head xs) = vizinhosDiferentes xs 
    | otherwise = False
  
--verifica se a região segue a ordem decrescente na vertical (incompleta, falar com o professor)
ordemDecrescente :: [a] -> Bool 
ordemDecrescente [] = True 
ordemDecrescente [_] = True
ordemDecrescente (x:xs)
    | (x > head xs) = ordemDecrescente xs 
    | otherwise = False

-- ____________________________________________________________________________________________________________________________________________________________________________________________________________________

choices :: [(Int, Char)] -> Matrix Choices
choices = map (map choices)
    where
        choice v = if (obterValorEscolhido v) == 0 then values (obterRegiaoEscolhida v) else [obterValorEscolhido v] 

cp :: [[a]] -> [[a]]
cp [] = [[]]
cp (xs:xss) = [y:ys | y <- xs, ys <- cp xss]

collapse :: Matrix [a] -> [Matrix a]
collapse = cp . map cp

solve :: GradeValores -> GradeRegioes -> [GradeValores]
solve valores regioes = filter (valido (collapse (choices)), regioes)