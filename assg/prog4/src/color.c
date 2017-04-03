#include "color.h"
#include <stdio.h>

int main() {
  printf("%sGeaux%s %stigers!%s\n", 
    magenta, normal, yellow, normal
  );
  printf("%sGeaux%s %stigers%s!\n", 
    bold, normal, underline, normal
  );
}
