module Tabuleiro (Tabuleiro(valores, regioes)) where
data Tabuleiro = { valores :: GradeValores, regioes :: GradeRegioes } deriving (Eq, Show)

--definição das estruturas usadas para modelar o tabuleiro
type GradeValores = Matriz Int
type GradeRegioes = Matriz Char
type Matriz a = [Linha a]
type Linha a = [a]

--imprimir os valores do tabuleiro
imprimir :: Tabuleiro -> GradeValores
imprimir tabuleiro = unlines [unwords [show (valores tabuleiro)]]