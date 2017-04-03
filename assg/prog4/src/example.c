#include <stdio.h>

int sum(int n) {
  int s = 0;
  for (int i=1; i<=n; i++)
    s += i;
  return s;
}

int fib(int n) {
  if (n <= 1) return 1;
  else return fib(n-1) + fib(n-2);
}

int main() {
  printf("%d %d\n", sum(10), fib(5));
}
