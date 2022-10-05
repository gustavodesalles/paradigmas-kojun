import Data.Map

--Declarar os tipos básicos para modelar o jogo
type Grade = Matriz Celula
type Matriz a = [Linha a]
type Linha a = [a]

data Celula = { valor :: Int, regiao :: Char} deriving (Eq, Show, Read)

--estrutura auxiliar
data MapRegioes = Map Char [Celula]