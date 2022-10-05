--Declarar os tipos básicos para modelar o jogo
type GradeValores = Matriz Int
type GradeRegioes = Matriz Char
type Matriz a = [Linha a]
type Linha a = [a]

--todo: método menos custoso para obter regiões