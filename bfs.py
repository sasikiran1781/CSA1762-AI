from collections import deque

graph = {
    'A': ['B', 'C'],
    'B': ['A', 'D', 'E'],
    'C': ['A', 'F'],
    'D': ['B'],
    'E': ['B', 'F'],
    'F': ['C', 'E']
}

def bfs_shortest_path(graph, start, goal):
    queue = deque([(start, [start])])
    visited = set()  
    
    while queue:
        (node, path) = queue.popleft()
        
        if node == goal:
            return path
        
        if node not in visited:
            visited.add(node)
            for neighbor in graph[node]:
                queue.append((neighbor, path + [neighbor]))
    
    return "No path found"

start_node = 'A'
goal_node = 'F'
path = bfs_shortest_path(graph, start_node, goal_node)
print("Shortest path from", start_node, "to", goal_node, "is:", path)
