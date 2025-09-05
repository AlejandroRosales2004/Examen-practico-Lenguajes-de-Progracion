#include <iostream>
#include <algorithm>
#include <cctype>
#include <string>
using namespace std;

int main() {
    string texto;
    cout << "Introduce el texto: ";
    getline(cin, texto);
    
    // Limpiar el texto: eliminar caracteres no alfabéticos y convertir a minúsculas
    string textoLimpio;
    for (char c : texto) {
        if (isalpha(c)) {
            textoLimpio += tolower(c);
        }
    }
    
    // Invertir el texto
    string textoInvertido = textoLimpio;
    reverse(textoInvertido.begin(), textoInvertido.end());
    
    // Verificar si es palíndromo
    if (textoLimpio == textoInvertido) {
        cout << "\"" << texto << "\" es un palindromo." << endl;
    } else {
        cout << "\"" << texto << "\" no es un palindromo." << endl;
    }
    
    return 0;
}