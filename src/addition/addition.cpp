#include <iostream>

using namespace std;
int main() {

  int x{};
  int y{};

  cout << "Enter value 1: ";
  cin >> x;
  cout << "Value 1 is equal to " << x << '\n';

  cout << "Enter value 2: ";
  cin >> y;
  cout << "Value 2 is equal to: " << y << '\n';

 
  int z { x + y };
  
  cout << x << " + " << y << " is equal to: " << z << '\n'; 
  return 0;

}
