# missionaries, cannibals PROBLEM
# Initial state: (missionaries_left, cannibals_left, boat_position)
# 1 = left side of the river, 0 = right side of the river

from collections import deque

initial_state = (3, 3, 1)
goal_state = (0, 0, 0)
moves = [(1, 0), (2, 0), (0, 1), (0, 2), (1, 1)]

def is_valid(state):
    m_left, c_left, boat_pos = state
    m_right = 3 - m_left
    c_right = 3 - c_left
    if (m_left >= 0 and c_left >= 0 and
        m_right >= 0 and c_right >= 0 and
        (m_left == 0 or m_left >= c_left) and
        (m_right == 0 or m_right >= c_right)):
        return True
    return False

def solve():
    queue = deque([(initial_state, [])])
    visited = set()
    while queue:
        state, path = queue.popleft()
        if state == goal_state:
            return path + [state]
        if state in visited:
            continue
        visited.add(state)
        for m, c in moves:
            if state[2] == 1: 
                new_state = (state[0] - m, state[1] - c, 0)
            else: 
                new_state = (state[0] + m, state[1] + c, 1)
            if is_valid(new_state):
                queue.append((new_state, path + [state]))
    return "No solution found"

solution = solve()
if solution != "No solution found":
    for step in solution:
        print("Left bank: Missionaries =", step[0], "Cannibals =", step[1], "| Boat =", "Left" if step[2] == 1 else "Right")
else:
    print(solution)
