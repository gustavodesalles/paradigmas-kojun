from typing import List


class Cell:
    def __init__(self, number: int, area: str) -> None:
        self.number = number
        self.area = area

    def __repr__(self) -> str:
        return f'{self.number}:{self.area}'


# Regra 1 - E dividido por areas
# Regra 2 - Cada área contém 1 - N números
# Regra 3 - Não pode ter o mesmo número nem na vertical, nem  na horizontal (direta)
# Regra 4 - Na vertical, o número acima precisa ser maior que o número de baixo na mesma região

#Forming the Puzzle Grid
def form_grid(puzzle_string, puzzle_areas):
    print('The Kojun Problem')

    numbers_matrix = []
    areas_matrix = []

    for i in range(0, len(puzzle_string), 8):
        row_numbers = puzzle_string[i:i+8]
        row_areas = puzzle_areas[i:i+8]
        temp = []
        temp_2 = []
        for block in row_numbers:
            temp.append(int(block))
        for block_area in row_areas:
            temp_2.append(block_area)

        numbers_matrix.append(temp)    
        areas_matrix.append(temp_2)

    printGrid(numbers_matrix)
    printGrid(areas_matrix)

    return numbers_matrix, areas_matrix # Tuple return, if needed convert to 2 functions


#Function to print the grid
def printGrid(grid):
    for row in grid:
        print(row)

#Function to check if a digit can be placed in the given block
# def possible(row,col,digit):
#     global grid
#     # Check the entire row if theres the same digit
#     for i in range(0,9):
#         if grid[row][i] == digit:
#             return False
#     # Check the entire column if theres the same digit
#     for i in range(0,9):
#         if grid[i][col] == digit:
#             return False
#     # Check 
#     square_row = (row//3)*3
#     square_col = (col//3)*3
#     for i in range(0,3):
#         for j in range(0,3):
#             if grid[square_row+i][square_col+j] == digit:
#                 return False    
#     return True

def possible_kojun(row,col,digit, char):

    # Check if neighbors have the same digit (try)
    if row != 0:
        above_number = grid_numbers[row -1][col]
        above_area = grid_areas[row -1][col]
        if above_number == digit or (above_area == char and above_number < digit): # Above number
            return False
 
    if row != len(grid_numbers) - 1: # TODO - get last index by the size of the puzzle instead of hardcode
        if grid_numbers[row + 1][col] == digit:
            return False

    if col != 0:
        if grid_numbers[row][col - 1] == digit: # Checar se o número debaixo é menor que o de cima
            return False

    if col != len(grid_numbers) - 1: # TODO - get last index by the size of the puzzle instead of hardcode
        if grid_numbers[row][col + 1] == digit:
            return False
    
    # Check if the area has the same digit:
    area = get_cells_from_area(char)
    for cell in area:
        if cell == digit:
            return False
            
    return True


def get_cells_from_area(char) -> List:
    cells = []
    for x in range(0, len(grid_numbers)):
        for y in range(0, len(grid_numbers)):
            if grid_areas[x][y] == char:
                cells.append(grid_numbers[x][y])
    return cells


def solve():
    for row in range(len(grid_numbers)):
        for col in range(len(grid_numbers)):
            if grid_numbers[row][col] == 0:
                char = grid_areas[row][col]
                len_area = len(get_cells_from_area(char))
                for digit in range(1, len_area + 1):
                    if possible_kojun(row,col,digit, char):
                        grid_numbers[row][col] = digit
                        solve()
                        grid_numbers[row][col] = 0  # Backtrack step
                return

    print('\nThe Solution')
    printGrid(grid_numbers)



puzzle_string = "0000000001300000000003000030000005030000020000000000003000530000"
puzzle_areas = "aabbcdeeaafbgddefffhgijjkkkhgiijlhhhhiijlmnnnopjmmmmqooorqqqqoss"
grid_numbers, grid_areas = form_grid(puzzle_string, puzzle_areas)
grid = []
# form_grid(puzzle_string, puzzle_areas)
solve()