#include <bits/stdc++.h>
using namespace std;

const int MAXN = 100; // maximum number of vertices
int n = 7; // number of vertices
int capacity[MAXN][MAXN]; // capacity matrix

int bfs(int s, int t, int parent[]) {
    bool visited[MAXN] = {false};
    queue<int> q;
    q.push(s);
    visited[s] = true;
    parent[s] = -1;

    while (!q.empty()) {
        int u = q.front();
        q.pop();

        for (int v = 0; v < n; v++) {
            if (visited[v] == false && capacity[u][v] > 0) {
                q.push(v);
                parent[v] = u;
                visited[v] = true;
            }
        }
    }

    return visited[t];
}

int fordFulkerson(int s, int t) {
    int u, v;

    int rGraph[MAXN][MAXN];
    for (u = 0; u < n; u++)
        for (v = 0; v < n; v++)
             rGraph[u][v] = capacity[u][v];

    int parent[MAXN];
    int max_flow = 0;

    while (bfs(s, t, parent)) {
        int path_flow = INT_MAX;
        for (v = t; v != s; v = parent[v]) {
            u = parent[v];
            path_flow = min(path_flow, rGraph[u][v]);
        }

        for (v = t; v != s; v = parent[v]) {
            u = parent[v];
            rGraph[u][v] -= path_flow;
            rGraph[v][u] += path_flow;
        }

        max_flow += path_flow;
    }

    return max_flow;
}

int main() {
    // initialize capacity matrix
    memset(capacity, 0, sizeof(capacity));
    capacity[0][1] = 5;
    capacity[0][3] = 6;
    capacity[0][5] = 3;
    capacity[1][2] = 8;
    capacity[1][3] = 7;
    capacity[1][4] = 4;
    capacity[2][4] = 5;
    capacity[2][6] = 4;
    capacity[3][4] = 6;
    capacity[4][6] = 6;
    capacity[5][6] = 2;

    int s = 0, t = 6;
    int max_flow = fordFulkerson(s, t);
    cout << "The maximum flow from vertex " << s << " to vertex " << t << " is " << max_flow << endl;

    return 0;
}
