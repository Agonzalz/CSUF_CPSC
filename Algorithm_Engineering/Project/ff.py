from collections import deque
import sys

# maximum number of vertices
MAXN = 100

# number of vertices
n = 7

# capacity matrix
capacity = [[0 for j in range(n)] for i in range(n)]

# BFS function
def bfs(s, t, parent):
    visited = [False for i in range(n)]
    queue = deque()
    queue.append(s)
    visited[s] = True
    parent[s] = -1

    while queue:
        u = queue.popleft()
        for v in range(n):
            if not visited[v] and capacity[u][v] > 0:
                queue.append(v)
                parent[v] = u
                visited[v] = True

    return visited[t]

# Ford-Fulkerson function
def fordFulkerson(s, t):
    # residual graph
    rGraph = [[0 for j in range(n)] for i in range(n)]
    for i in range(n):
        for j in range(n):
            rGraph[i][j] = capacity[i][j]

    # parent array
    parent = [-1 for i in range(n)]

    # maximum flow
    max_flow = 0

    while bfs(s, t, parent):
        path_flow = sys.maxsize
        v = t
        while v != s:
            u = parent[v]
            path_flow = min(path_flow, rGraph[u][v])
            v = u

        v = t
        while v != s:
            u = parent[v]
            rGraph[u][v] -= path_flow
            rGraph[v][u] += path_flow
            v = u

        max_flow += path_flow

    return max_flow

# initialize capacity matrix
capacity[0][1] = 5
capacity[0][3] = 6
capacity[0][5] = 3
capacity[1][2] = 8
capacity[1][3] = 7
capacity[1][4] = 4
capacity[2][4] = 5
capacity[2][6] = 4
capacity[3][4] = 6
capacity[4][6] = 6
capacity[5][6] = 2

s, t = 0, 6
max_flow = fordFulkerson(s, t)
print("The maximum flow from vertex", s, "to vertex", t, "is", max_flow)
