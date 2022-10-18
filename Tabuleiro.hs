--Adaptado do código feito por Graham Hutton, da Universidade de Nottingham, disponível em: http://www.cs.nott.ac.uk/~pszgmh/sudoku.lhs
module Tabuleiro where

import Data.List

--definição das estruturas usadas para modelar o tabuleiro
type GradeValores = Matriz Int

type GradeRegioes = Matriz Char

type Matriz a = [Linha a]

type Linha a = [a]

type Valor = Int

values :: Int -> [Int]
values a = [1 .. a]

--cria uma lista de tuplas correspondentes ao valor e à região
--de cada célula
listaValoresRegioes :: GradeValores -> GradeRegioes -> [(Int, Char)]
listaValoresRegioes valores regioes = foldl1 (++) (matrizValoresRegioes valores regioes)

listaRegioes :: GradeRegioes -> [Char]
listaRegioes regioes = foldl1 (++) (regioes)

--cria uma matriz única, juntando valores e regiões em tuplas
matrizValoresRegioes :: GradeValores -> GradeRegioes -> Matriz (Int, Char)
matrizValoresRegioes = zipWith zip

--obtém as linhas da matriz
linhas :: Matriz a -> [Linha a]
linhas = id

--obtém valor da regiao escolhida
obterRegiaoEscolhida :: (Int, Char) -> Char
obterRegiaoEscolhida (_, b) = b

--obtém valor numérico da tupla
obterValorEscolhido :: (Int, Char) -> Int
obterValorEscolhido (a, _) = a

--obtém as colunas da matriz por meio de transposição
colunas :: Matriz a -> [Linha a]
colunas = transpose

--verifica se a célula está vazia
celulaVazia :: Int -> Bool
celulaVazia = (== 0)

 -- [['a','a','b','b','c','d','e','e'],
 -- ['a','a','g','b','f','d','d','e'],  
 -- ['g','g','g','h','f','i','j','j'],
 -- ['l','l','l','h','f','i','i','j'],
 -- ['m','h','h','h','h','i','i','j'],
 -- ['m','n','o','o','o','p','k','j'],
 -- ['n','n','n','n','r','p','p','p'],
 -- ['s','r','r','r','r','p','q','q']]


-- Recebe o número de um bloco e a matriz de posições.
-- Retorna o tamanho do bloco correspondente.
tamanhoGrupo :: Eq m => m -> Matriz m -> Int
tamanhoGrupo _ [] = 0
tamanhoGrupo id grupos = sum [count id p | p <- grupos]
  where count x xs = length (filter (==x) xs)

--obtém o tamanho de uma região para usar como limite de escolha
obterTamanhoRegiao :: Char -> GradeRegioes -> Int
obterTamanhoRegiao x regioes = length (filter (==x) (listaRegioes regioes)) 

--obtém valores que já foram usados na região
obterValoresRegiao :: Char -> GradeValores -> GradeRegioes -> [Int]
obterValoresRegiao x valores regioes = map fst (filter ((== x) . snd) (listaValoresRegioes valores regioes))

verificaRegioesNVezes 0 = return ()
verificaRegioesNVezes n =
 do
  
  verificaRegioesNVezes (n-1)