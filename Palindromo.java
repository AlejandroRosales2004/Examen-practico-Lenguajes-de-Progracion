import java.util.Scanner;

public class Palindromo {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            System.out.print("Introduce el texto: ");
            String texto = sc.nextLine();
            String textoLimpio = texto.replaceAll("[^a-zA-Z]", "").toLowerCase();
            String textoInvertido = new StringBuilder(textoLimpio).reverse().toString();

            if (textoLimpio.equals(textoInvertido)) {
                System.out.println("\"" + texto + "\" es un palindromo.");
            } else {
                System.out.println("\"" + texto + "\" no es un palindromo.");
            }
        }
    }
}
