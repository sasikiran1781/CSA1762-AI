def print_board(board):
    """Print the current state of the board."""
    for row in board:
        print(" | ".join(row))
        print("-" * 9)

def check_winner(board, player):
    """Check if the given player has won the game."""
    for i in range(3):
        if all([cell == player for cell in board[i]]) or all([board[j][i] == player for j in range(3)]):
            return True
    if board[0][0] == board[1][1] == board[2][2] == player or board[0][2] == board[1][1] == board[2][0] == player:
        return True
    return False

def check_draw(board):
    """Check if the game is a draw."""
    return all([cell != ' ' for row in board for cell in row])

def tic_tac_toe():
    board = [[' ' for _ in range(3)] for _ in range(3)]
    current_player = 'X'
    
    while True:
        print_board(board)
        print(f"\nPlayer {current_player}'s turn.")
        
        try:
            row, col = map(int, input("Enter row and column (1-3) separated by space: ").split())
        except ValueError:
            print("Invalid input! Please enter two numbers separated by a space.")
            continue
        
        row -= 1
        col -= 1
        
        if row not in range(3) or col not in range(3) or board[row][col] != ' ':
            print("Invalid move! Try again.")
            continue
        
        board[row][col] = current_player
        
        if check_winner(board, current_player):
            print_board(board)
            print(f"\nPlayer {current_player} wins!")
            break
        
        if check_draw(board):
            print_board(board)
            print("\nIt's a draw!")
            break
        
        current_player = 'O' if current_player == 'X' else 'X'

if __name__ == "__main__":
    tic_tac_toe()
