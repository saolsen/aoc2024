#include <algorithm>
#include <cassert>
#include <iostream>
#include <vector>

using namespace std;

int main() {
  freopen("input/day01.txt", "r", stdin);

  auto list_1 = vector<int>();
  auto list_2 = vector<int>();
  {
    string line;
    int a, b;
    while (getline(cin, line)) {
      sscanf(line.c_str(), "%d   %d", &a, &b);
      list_1.push_back(a);
      list_2.push_back(b);
    }
  }
  sort(list_1.begin(), list_1.end());
  sort(list_2.begin(), list_2.end());
  assert(list_1.size() == list_2.size());

  int sum = 0;
  for (uintptr_t i = 0; i < list_1.size(); i++) {
    sum += abs(list_1[i] - list_2[i]);
  }
  printf("%d\n", sum);

  return 0;
}