module Resolvedor where
import Tabuleiro

--o tabuleiro será válido se:
--1: Nenhuma célula vizinha (horizontal e vertical) possuir os mesmos valores;
--2: A ordem vertical dos valores de uma região seja decrescente.
valido :: GradeValores -> GradeRegioes -> Bool 
valido valores regioes = all vizinhosDiferentes (linhas valores) && all vizinhosDiferentes (colunas valores) && all ordemDecrescente (colunas (matrizValoresRegioes valores regioes))

--verifica se os vizinhos possuem valores diferentes (incompleta)
vizinhosDiferentes :: Eq a => [a] -> Bool 
vizinhosDiferentes [] = True
vizinhosDiferentes [_] = True 
vizinhosDiferentes (x:xs) = x /= head xs

--verifica se a região segue a ordem decrescente na vertical (incompleta, falar com o professor)
ordemDecrescente :: [a] -> Bool 
ordemDecrescente [] = True 
ordemDecrescente [_] = True 
--ordemDecrescente (x:xs)