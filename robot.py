from collections import deque

grid_size = 5
start = (0, 0)
goal = (4, 4)
obstacles = [(2, 2), (3, 3)]

moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]

def bfs(start, goal, obstacles):
    queue = deque([start]) 
    visited = [] 
    visited.append(start) 
    path_track = {start: None}
    
    while queue:
        current = queue.popleft()  
        if current == goal:
            path = []
            while current:
                path.append(current)
                current = path_track[current]
            return path[::-1]  
        for move in moves:
            next_position = (current[0] + move[0], current[1] + move[1])
            if (0 <= next_position[0] < grid_size and 0 <= next_position[1] < grid_size and 
                next_position not in visited and next_position not in obstacles):
                
                queue.append(next_position)  
                visited.append(next_position) 
                path_track[next_position] = current 
    
    return None  
path = bfs(start, goal, obstacles)

if path:
    print("Path found:", path)
else:
    print("No path found.")
