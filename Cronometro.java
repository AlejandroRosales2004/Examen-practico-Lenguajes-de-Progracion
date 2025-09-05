public class Cronometro {
    public static void main(String[] args) throws InterruptedException {
        int horas = 0;
        int minutos = 0;
        int segundos = 0;
        
        while   (true) {
            System.out.printf("%02d:%02d:%02d\r", horas, minutos, segundos);
            System.out.println();
            Thread.sleep(1000);
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
    }
}