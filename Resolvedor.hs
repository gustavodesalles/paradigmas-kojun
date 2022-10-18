module Resolvedor where

import Data.List
import Tabuleiro

type Escolhas = [Valor]

--o tabuleiro será válido se:
--1: Nenhuma célula vizinha (horizontal e vertical) possuir os mesmos valores;
--2: A ordem vertical dos valores de uma região seja decrescente.
valido :: GradeValores -> GradeRegioes -> Bool
valido valores regioes = all vizinhosDiferentes (linhas valores) && all vizinhosDiferentes (colunas valores) && all ordemDecrescente (colunas (matrizValoresRegioes valores regioes))

--verifica se os vizinhos possuem valores diferentes (incompleta ?)
vizinhosDiferentes :: Eq a => [a] -> Bool
vizinhosDiferentes [] = True
vizinhosDiferentes [_] = True
vizinhosDiferentes (x : xs)
  | (x /= head xs) = vizinhosDiferentes xs
  | otherwise = False

--verifica se a região segue a ordem decrescente na vertical (incompleta, falar com o professor)
ordemDecrescente :: Ord a => [a] -> Bool
ordemDecrescente [] = True
ordemDecrescente [_] = True
ordemDecrescente (x : xs)
  | (x > head xs) = ordemDecrescente xs
  | otherwise = False

-- ____________________________________________________________________________________________________________________________________________________________________________________________________________________

escolhas :: GradeValores -> GradeRegioes -> Matriz Escolhas
escolhas valores regioes = map (map escolha) (zipWith zip valores regioes)
  where
    escolha (v, r) = if v == 0 then values (obterTamanhoRegiao r regioes) `minus` (obterValoresRegiao r valores regioes) else [v]

-- [[1,3,5],[1,3,6],[1,4,5],[1,4,6],[2,3,5],[2,3,6],[2,4,5],[2,4,6]]

teste :: GradeValores -> GradeRegioes -> Matriz Escolhas
teste valores regioes = map (map choice) (zipWith zip valores regioes)
  where
    choice (v, p) = if v == 0 then [1 .. (obterTamanhoRegiao p regioes)] `minus` (obterValoresRegiao p valores regioes) else [v]

minus :: Escolhas -> Escolhas -> Escolhas
xs `minus` ys = if unica xs then xs else xs \\ ys

-- Recebe uma matriz de escolhas e a matriz de posições.
-- Invoca a função reduzEscolhasLista para cada coluna dividida por grupos.
-- Retorna matriz de escolhas com escolhas reduzidas.
-- reduzEscolhasPorGrupo :: Matriz Escolhas -> Tabuleiro -> Matriz Escolhas
-- reduzEscolhasPorGrupo valores grupos = colunas $ colunasOrigem (map reduzEscolhasLista (gruposPorColuna valores grupos)) (tamanho valores)

-- -- Reduz as escolhas dos valores da lista com base em elementos unitários
-- reduzEscolhasLista :: Linha Escolhas -> Linha Escolhas
-- reduzEscolhasLista xss = [xs `minus` singles | xs <- xss]
--     where singles = concat (filter umElemento xss)

cp :: [[a]] -> [[a]]
cp [] = [[]]
cp (xs : xss) = [y : ys | y <- xs, ys <- cp xss]

--Propriedades da matriz de escolhas

--verifica se há somente uma escolha para a célula
unica :: [a] -> Bool
unica [_] = True
unica _ = False

--A matriz será 'completa' se todas as células possuírem apenas uma escolha
completa :: Matriz Escolhas -> Bool
completa = all (all unica)

--A matriz será 'inválida' se alguma das células não possuir escolhas
invalida :: Matriz Escolhas -> Bool
invalida = any (any null)

integrar :: Matriz [a] -> [Matriz a]
integrar = cp . map cp

-- solve :: GradeValores -> GradeRegioes -> [GradeValores]
-- solve valores regioes = filter (valido (integrar (escolhas)), regioes) -- TODO - passar parametro choices + testar

-- > choices               :: Grid -> Matrix Choices
-- > choices               =  map (map choice)
-- >                          where
-- >                             choice v = if empty v then values else [v]
