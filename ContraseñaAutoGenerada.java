import java.security.SecureRandom;
import java.util.Scanner;

public class ContraseñaAutoGenerada {
    public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            int longitud;
            do {
                System.out.print("Ingrese la longitud de la contraseña (8 a 16): ");
                while (!scanner.hasNextInt()) {
                    System.out.println("Entrada inválida. Por favor ingrese un número entre 8 y 16.\n");
                    scanner.next();
                }
                longitud = scanner.nextInt();
                if (longitud < 8 || longitud > 16) {
                    System.out.println("Longitud inválida. Por favor, ingrese un número entre 8 y 16.");
                }
            } while (longitud < 8 || longitud > 16);

            System.out.print("¿Incluir letras mayúsculas? (s/n): ");
            String respuesta;
            do {
                respuesta = scanner.next().toLowerCase();
                if (!respuesta.equals("s") && !respuesta.equals("n")) {
                    System.out.println("Entrada inválida. Por favor ingrese 's' para sí o 'n' para no.");
                    System.out.print("¿Incluir letras mayúsculas? (s/n): ");
                }
            } while (!respuesta.equals("s") && !respuesta.equals("n"));
            boolean incluirMayusculas = respuesta.equals("s");

            System.out.print("¿Incluir números? (s/n): ");
            do {
                respuesta = scanner.next().toLowerCase();
                if (!respuesta.equals("s") && !respuesta.equals("n")) {
                    System.out.println("Entrada inválida. Por favor ingrese 's' para sí o 'n' para no.");
                    System.out.print("¿Incluir números? (s/n): ");
                }
            } while (!respuesta.equals("s") && !respuesta.equals("n"));
            boolean incluirNumeros = respuesta.equals("s");

            System.out.print("¿Incluir símbolos? (s/n): ");
            do {
                respuesta = scanner.next().toLowerCase();
                if (!respuesta.equals("s") && !respuesta.equals("n")) {
                    System.out.println("Entrada inválida. Por favor ingrese 's' para sí o 'n' para no.");
                    System.out.print("¿Incluir símbolos? (s/n): ");
                }
            } while (!respuesta.equals("s") && !respuesta.equals("n"));
            boolean incluirSimbolos = respuesta.equals("s");

            String contraseña = generarContraseña(longitud, incluirMayusculas, incluirNumeros, incluirSimbolos);
            System.out.println("Contraseña generada: " + contraseña);
        }
    }

    public static String generarContraseña(int longitud, boolean incluirMayusculas, boolean incluirNumeros, boolean incluirSimbolos) {
        String minusculas = "abcdefghijklmnopqrstuvwxyz";
        String mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String numeros = "0123456789";
        String simbolos = "!@#$%^&*()-_=+[]{}|;:,.<>?";

        StringBuilder conjuntoCaracteres = new StringBuilder(minusculas);
        if (incluirMayusculas) {
            conjuntoCaracteres.append(mayusculas);
        }
        if (incluirNumeros) {
            conjuntoCaracteres.append(numeros);
        }
        if (incluirSimbolos) {
            conjuntoCaracteres.append(simbolos);
        }

        if (conjuntoCaracteres.length() == 0) {
            throw new IllegalArgumentException("Debe seleccionar al menos un tipo de carácter para generar la contraseña.");
        }

        SecureRandom random = new SecureRandom();
        StringBuilder contraseña = new StringBuilder(longitud);
        for (int i = 0; i < longitud; i++) {
            int indice = random.nextInt(conjuntoCaracteres.length());
            contraseña.append(conjuntoCaracteres.charAt(indice));
        }
        return contraseña.toString();
    }
}
