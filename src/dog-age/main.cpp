#include <iostream>

double humanAge{};
double dogAge{};

int main() {
    std::cout << "Enter your age(years): ";
	
    std::cin >> humanAge;
        

    if (humanAge <= 1) {
        dogAge = humanAge * 15;
    } else if (humanAge <= 2) {
        dogAge = 15 + (humanAge - 1) * 9;
    } else {
        dogAge = 24 + (humanAge - 2) * 5;
    }


    if (dogAge >= 85) {
        std::cout << "You are most likely dead in dog years.\nYou are " << dogAge << " years old in dog years" << '\n';
    } else {
        std::cout << "You are " << dogAge << " years old in dog years\n";
    }


	return 0;
}
