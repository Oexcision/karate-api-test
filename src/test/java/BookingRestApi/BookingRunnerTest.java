package BookingRestApi;
import com.intuit.karate.Runner;
public class BookingRunnerTest  {
    public static void main(String[] args) {
        Runner.path("src/test/java/BookingRestApi")    // Ruta de la carpeta especifica
                .outputCucumberJson(true)   // Habilitar Reporte cucumber JSON
                .parallel(1);           // Ejeutar de forma secuencial
    }
}