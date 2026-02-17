#include <iostream>

int main() {

  int x{};
  int y{};

  std::cout << "Enter value 1: ";
  std::cin >> x;
  std::cout << "Value 1 is equal to " << x << '\n';

  std::cout << "Enter value 2: ";
  std::cin >> y;
  std::cout << "Value 2 is equal to: " << y << '\n';

 
  int z { x + y };
  
  std::cout << x << " + " << y << " is equal to: " << z << '\n'; 
  return 0;

}
