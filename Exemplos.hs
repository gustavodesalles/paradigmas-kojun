module Exemplos where
import Tabuleiro

--Todos os exemplos foram retirados do site https://www.janko.at/Raetsel/Kojun/index.htm
--puzzle no. 4
exemplo1valores :: GradeValores
exemplo1valores = [[2,5,0,0,3,0,0,0],
                   [0,0,6,0,0,0,0,0],
                   [0,0,5,0,5,2,0,0],
                   [0,0,0,2,0,0,0,0],
                   [0,0,1,0,4,0,0,0],
                   [3,0,2,0,0,4,0,0],
                   [0,0,0,6,0,0,0,0],
                   [0,0,0,0,4,0,3,2]]

exemplo1regioes :: GradeRegioes
exemplo1regioes = [['a','b','b','b','b','c','d','d'],
                   ['a','a','f','b','c','c','e','e'],
                   ['g','h','f','i','c','c','j','j'],
                   ['g','k','f','f','f','c','j','j'],
                   ['g','k','f','l','l','l','j','p'],
                   ['m','k','o','l','o','o','p','p'],
                   ['m','m','o','o','o','q','q','p'],
                   ['m','m','n','n','q','q','q','p']]

--puzzle no. 7
exemplo2valores :: GradeValores
exemplo2valores = [[3,7,5,3,0,0,0,0],
                   [0,0,0,0,0,0,0,0],
                   [0,1,0,2,0,0,0,0],
                   [0,0,0,0,0,1,0,0],
                   [0,0,6,4,0,0,0,0],
                   [0,0,3,0,3,0,5,0],
                   [0,0,0,0,0,0,0,0],
                   [0,5,0,0,0,0,4,0]]

exemplo2regioes :: GradeRegioes
exemplo2regioes = [['a','b','b','b','b','b','d','d'],
                   ['a','a','b','b','c','c','e','e'],
                   ['f','f','g','g','g','g','h','h'],
                   ['f','i','i','j','k','k','l','h'],
                   ['p','i','i','i','k','m','l','l'],
                   ['p','o','i','n','m','m','m','p'],
                   ['p','o','i','n','m','s','t','t'],
                   ['p','p','q','r','r','s','s','s']]

--puzzle no. 8
exemplo3valores :: GradeValores
exemplo3valores = [[0,0,0,0,0,0,0,0],
                   [0,1,3,0,0,0,0,0],
                   [0,0,0,0,0,3,0,0],
                   [0,0,3,0,0,0,0,0],
                   [0,5,0,3,0,0,0,0],
                   [0,2,0,0,0,0,0,0],
                   [0,0,0,0,0,0,3,0],
                   [0,0,5,3,0,0,0,0]]

exemplo3regioes :: GradeRegioes
exemplo3regioes = [['a','a','b','b','c','d','e','e'],
                   ['a','a','g','b','f','d','d','e'],
                   ['g','g','g','h','f','i','j','j'],
                   ['l','l','l','h','f','i','i','j'],
                   ['m','h','h','h','h','i','i','j'],
                   ['m','n','o','o','o','p','k','j'],
                   ['n','n','n','n','r','p','p','p'],
                   ['s','r','r','r','r','p','q','q']]