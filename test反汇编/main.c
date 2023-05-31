// C代码 很简单的8个数相加
int add(int a, int b, int c, int d, int e, int f, int g, int h) {
  int sum = a + b + c + d + e + f + g + h;
  return sum;
}

int main(void) {
  int sum = add(11, 22,33, 44, 55, 66, 77, 88);
  int sum2 = add(1, 2, 3, 4, 5, 6, 7, 8);
  int sum3 = sum + sum2;
  return 0;
}
