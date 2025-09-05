#include <iostream>
#include <string>
#include <random>
#include <ctime>
#include <limits>

std::string generarContrasena(int longitud, bool incluirMayusculas, bool incluirNumeros, bool incluirSimbolos) {
    std::string minusculas = "abcdefghijklmnopqrstuvwxyz";
    std::string mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    std::string numeros = "0123456789";
    std::string simbolos = "!@#$%^&*()-_=+[]{}|;:,.<>?";
    std::string conjuntoCaracteres = minusculas;
    if (incluirMayusculas) conjuntoCaracteres += mayusculas;
    if (incluirNumeros) conjuntoCaracteres += numeros;
    if (incluirSimbolos) conjuntoCaracteres += simbolos;
    if (conjuntoCaracteres.empty()) {
        throw std::invalid_argument("Debe seleccionar al menos un tipo de caracter para generar la contrasenia.");
    }
    std::string contrasena;
    std::mt19937 generador(static_cast<unsigned int>(std::time(nullptr)));
    std::uniform_int_distribution<int> distrib(0, conjuntoCaracteres.size() - 1);
    for (int i = 0; i < longitud; ++i) {
        contrasena += conjuntoCaracteres[distrib(generador)];
    }
    return contrasena;
}

int main() {
    int longitud;
    // Solo permitir 8 o 16 como longitud
    do {
        std::cout << "Elige la longitud de la contrasenia (solo 8 o 16): ";
        while (!(std::cin >> longitud)) {
            std::cout << "Entrada invalida. Por favor ingrese 8 o 16.\n";
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        }
        if (longitud != 8 && longitud != 16) {
            std::cout << "Longitud invalida. Solo puedes elegir 8 o 16.\n";
        }
    } while (longitud != 8 && longitud != 16);

    // Preguntar por mayúsculas
    char respuesta;
    bool incluirMayusculas = false;
    std::cout << "Incluir letras mayusculas? (s/n): ";
    do {
        std::cin >> respuesta;
        respuesta = std::tolower(respuesta);
        if (respuesta != 's' && respuesta != 'n') {
            std::cout << "Entrada invalida. Por favor ingrese 's' para si o 'n' para no.\n";
            std::cout << "Incluir letras mayusculas? (s/n): ";
        }
    } while (respuesta != 's' && respuesta != 'n');
    incluirMayusculas = (respuesta == 's');

    // Preguntar por números
    bool incluirNumeros = false;
    std::cout << "Incluir numeros? (s/n): ";
    do {
        std::cin >> respuesta;
        respuesta = std::tolower(respuesta);
        if (respuesta != 's' && respuesta != 'n') {
            std::cout << "Entrada invalida. Por favor ingrese 's' para si o 'n' para no.\n";
            std::cout << "¿Incluir numeros? (s/n): ";
        }
    } while (respuesta != 's' && respuesta != 'n');
    incluirNumeros = (respuesta == 's');

    // Preguntar por símbolos
    bool incluirSimbolos = false;
    std::cout << "Incluir simbolos? (s/n): ";
    do {
        std::cin >> respuesta;
        respuesta = std::tolower(respuesta);
        if (respuesta != 's' && respuesta != 'n') {
            std::cout << "Entrada invalida. Por favor ingrese 's' para si o 'n' para no.\n";
            std::cout << "Incluir simbolos? (s/n): ";
        }
    } while (respuesta != 's' && respuesta != 'n');
    incluirSimbolos = (respuesta == 's');

    try {
        std::string contrasena = generarContrasena(longitud, incluirMayusculas, incluirNumeros, incluirSimbolos);
        std::cout << "Contrasenia generada: " << contrasena << std::endl;
    } catch (const std::exception& e) {
        std::cout << "Error: " << e.what() << std::endl;
    }
    return 0;
}