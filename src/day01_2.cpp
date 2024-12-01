#include <iostream>
#include <unordered_map>
#include <vector>

using namespace std;

int main() {
  freopen("input/day01.txt", "r", stdin);

  vector<int> list_1;
  unordered_map<int, int> map_2;
  {
    string line;
    int a, b;
    while (getline(cin, line)) {
      sscanf(line.c_str(), "%d   %d", &a, &b);
      list_1.push_back(a);
      if (map_2.count(b) == 0) {
        map_2[b] = 1;
      } else {
        map_2[b]++;
      }
    }
  }

  int sum = 0;
  for (uintptr_t i = 0; i < list_1.size(); i++) {
    sum += list_1[i] * map_2[list_1[i]];
  }

  printf("%d\n", sum);
  return 0;
}