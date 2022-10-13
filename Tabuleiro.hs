--Adaptado do código feito por Graham Hutton, da Universidade de Nottingham, disponível em: http://www.cs.nott.ac.uk/~pszgmh/sudoku.lhs
module Tabuleiro where

import Data.List

--definição das estruturas usadas para modelar o tabuleiro
type GradeValores = Matriz Int
type GradeRegioes = Matriz Char
type Matriz a = [Linha a]
type Linha a = [a]
type Value = Int

values :: a -> [Value]
value a = [1..obterTamanhoRegiao a]

--cria uma lista de tuplas correspondentes ao valor e à região
--de cada célula
listaValoresRegioes :: GradeValores -> GradeRegioes -> [(Int, Char)]
listaValoresRegioes valores regioes = foldl1' (++) (matrizValoresRegioes valores regioes)

--cria uma matriz única, juntando valores e regiões em tuplas
matrizValoresRegioes :: GradeValores -> GradeRegioes -> Matriz (Int, Char)
matrizValoresRegioes= zipWith zip

--obtém as linhas da matriz
linhas :: Matriz a -> [Linha a]
linhas = id 

--obtém valor da regiao escolhida
obterRegiaoEscolhida :: (Int, Char) -> Char
obterRegiaoEscolhida (_, b) = b

--obtém valor numérico da tupla
obterValorEscolhido :: (Int, Char) -> Char
obterValorEscolhido (a, _) = a

--obtém as colunas da matriz por meio de transposição
colunas :: Matriz a -> [Linha a]
colunas = transpose

--verifica se a célula está vazia
celulaVazia :: Int -> Bool 
celulaVazia = (== 0)

--obtém o tamanho de uma região para usar como limite de escolha
obterTamanhoRegiao :: Char -> GradeValores -> GradeRegioes -> Int
obterTamanhoRegiao x valores regioes = length (filter ((==x) . snd) (listaValoresRegioes valores regioes))

--obtém valores que já foram usados na região
obterValoresRegiao :: Char -> GradeValores -> GradeRegioes -> [Int]
obterValoresRegiao x valores regioes = map fst (filter ((==x) . snd) (listaValoresRegioes valores regioes))