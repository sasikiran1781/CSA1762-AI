import math

def print_board(board):
    """Print the current state of the board."""
    for row in board:
        print(" | ".join(row))
        print("-" * 9)

def check_winner(board):
    """Check if there's a winner."""
    for i in range(3):
        if board[i][0] == board[i][1] == board[i][2] != ' ':
            return board[i][0]
        if board[0][i] == board[1][i] == board[2][i] != ' ':
            return board[0][i]
    if board[0][0] == board[1][1] == board[2][2] != ' ':
        return board[0][0]
    if board[0][2] == board[1][1] == board[2][0] != ' ':
        return board[0][2]
    return None

def check_draw(board):
    """Check if the board is full."""
    return all([cell != ' ' for row in board for cell in row])

def minimax(board, is_maximizing):
    """Minimax algorithm to find the best move."""
    winner = check_winner(board)
    if winner == 'O':
        return 1
    elif winner == 'X':
        return -1
    elif check_draw(board):
        return 0

    if is_maximizing:
        best_score = -math.inf
        for i in range(3):
            for j in range(3):
                if board[i][j] == ' ':
                    board[i][j] = 'O'
                    score = minimax(board, False)
                    board[i][j] = ' '
                    best_score = max(best_score, score)
        return best_score
    else:
        best_score = math.inf
        for i in range(3):
            for j in range(3):
                if board[i][j] == ' ':
                    board[i][j] = 'X'
                    score = minimax(board, True)
                    board[i][j] = ' '
                    best_score = min(best_score, score)
        return best_score

def best_move(board):
    """Find the best move for the AI."""
    best_score = -math.inf
    move = None
    for i in range(3):
        for j in range(3):
            if board[i][j] == ' ':
                board[i][j] = 'O'
                score = minimax(board, False)
                board[i][j] = ' '
                if score > best_score:
                    best_score = score
                    move = (i, j)
    return move

def tic_tac_toe():
    """Main function to play Tic Tac Toe."""
    board = [[' ' for _ in range(3)] for _ in range(3)]
    
    while True:
        print_board(board)
        winner = check_winner(board)
        if winner:
            print(f"\nPlayer {winner} wins!")
            break
        if check_draw(board):
            print("\nIt's a draw!")
            break

        row, col = map(int, input("\nEnter row and column (1-3) separated by space: ").split())
        row -= 1
        col -= 1
        if board[row][col] != ' ':
            print("Invalid move! Try again.")
            continue
        board[row][col] = 'X'

        if check_winner(board) or check_draw(board):
            print_board(board)
            break

        ai_move = best_move(board)
        if ai_move:
            board[ai_move[0]][ai_move[1]] = 'O'
            print("\nAI has made its move.")

if __name__ == "__main__":
    tic_tac_toe()
