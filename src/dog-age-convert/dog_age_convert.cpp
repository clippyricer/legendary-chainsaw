#include <iostream>
#include <cmath>

using namespace std;

int main() {
	cout << "Enter your age(years): ";
	
	double humanAge{};

	cin >> humanAge;

	double dogAge;

	if (humanAge <= 1) {
        	dogAge = humanAge * 15;
    	} else if (humanAge <= 2) {
        	dogAge = 15 + (humanAge - 1) * 9;
    	} else {
        	dogAge = 24 + (humanAge - 2) * 5;
	    }
	
	
	cout << "You are " << dogAge << " years old in dog age!\n";
	
	return 0;
}
