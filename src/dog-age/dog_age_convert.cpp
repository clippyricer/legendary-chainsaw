#include <iostream>

using namespace std;

double humanAge{};
double dogAge{};

int main() {
	cout << "Enter your age(years): ";
	
    cin >> humanAge;
        

    if (humanAge <= 1) {
        dogAge = humanAge * 15;
    } else if (humanAge <= 2) {
        dogAge = 15 + (humanAge - 1) * 9;
    } else {
        dogAge = 24 + (humanAge - 2) * 5;
    }


    if (dogAge >= 85) {
        cout << "You are most likely dead in dog years.\nYou are " << dogAge << " years old in dog years" << endl;
    } else {
        cout << "You are " << dogAge << " years old in dog years\n";
    }


	return 0;
}
