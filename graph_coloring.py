def is_safe(graph, node, color, colors):
    for neighbor in graph[node]:
        if colors[neighbor] == color:
            return False
    return True

def graph_coloring(graph, m, colors, node=0):
    if node == len(graph):
        return True  

    for color in range(1, m + 1):
        if is_safe(graph, node, color, colors):
            colors[node] = color
            if graph_coloring(graph, m, colors, node + 1):
                return True
            colors[node] = 0 

    return False

graph = {
    0: [1, 2],
    1: [0, 2, 3],
    2: [0, 1, 3],
    3: [1, 2]
}
num_colors = 3
colors = [0] * len(graph)

if graph_coloring(graph, num_colors, colors):
    print("Solution found:", colors)
else:
    print("No solution exists")
