import java.time.LocalDate;
import java.time.LocalDateTime;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {

        LocalDate dateTime = LocalDate.now();
        System.out.println("dateTime: " + dateTime);
        System.out.println( dateTime.plusDays(2));


    }
}