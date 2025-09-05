#include <iostream>
#include <iomanip>
#include <thread>
#include <chrono>

int main() {
	int horas = 0;
	int minutos = 0;
	int segundos = 0;

	while (true) {
		std::cout << "Horas:   " << std::setfill('0') << std::setw(2) << horas << std::endl;
		std::cout << "Minutos: " << std::setfill('0') << std::setw(2) << minutos << std::endl;
		std::cout << "Segundos:" << std::setfill('0') << std::setw(2) << segundos << std::endl;
		std::cout << "-------------------" << std::endl;
		std::this_thread::sleep_for(std::chrono::seconds(1));
		segundos++;
		if (segundos == 60) {
			segundos = 0;
			minutos++;
		}
		if (minutos == 60) {
			minutos = 0;
			horas++;
		}
	}
	return 0;
}
