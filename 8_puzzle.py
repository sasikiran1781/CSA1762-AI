from collections import deque

GOAL = [[1, 2, 3], [4, 5, 6], [7, 8, 0]]
MOVES = [(0, 1), (0, -1), (1, 0), (-1, 0)]

def find_zero(state):
    for i in range(3):
        for j in range(3):
            if state[i][j] == 0:
                return i, j
def move(state, x, y, nx, ny):
    new_state = [row[:] for row in state]
    new_state[x][y], new_state[nx][ny] = new_state[nx][ny], new_state[x][y]
    return new_state

def solve(start):
    queue = deque([(start, [])])
    seen = set()
    while queue:
        state, path = queue.popleft()
        if state == GOAL:
            return path
        seen.add(tuple(tuple(row) for row in state))
        x, y = find_zero(state)
        for dx, dy in MOVES:
            nx, ny = x + dx, y + dy
            if 0 <= nx < 3 and 0 <= ny < 3:
                new_state = move(state, x, y, nx, ny)
                if tuple(tuple(row) for row in new_state) not in seen:
                    queue.append((new_state, path + [(nx, ny)]))
    return "No solution"

start_state = [[7, 8, 0], [1, 2, 3], [4, 5, 6]]
print("Solution path:", solve(start_state))
