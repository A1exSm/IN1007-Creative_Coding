import java.util.Scanner;
public class WeekThree {
  public Scanner sc = new Scanner(System.in);
    public void run() {
        if (inputString("would you like to run weekThree methods (y/n)? ").equals("y")) {
            switch (inputInt("Which weekThree function would you like to run? ")) {
                //case 0:
                //    exerciseZero(args);
                //    break;
                case 5:
                    exerciseFive();
                    break;
                case 6:
                    exerciseSix();
                    break;
                case 7:
                    exerciseSeven();
                    break;
                default:
                    System.out.println("Invalid input");
            }
        }
    }
// get scanner
    public Scanner getScanner() {
      return sc;
    }
// Next couple methods are public since I will be using them across my files.
    public String inputString(String statement) {
        System.out.println(statement);
        return sc.nextLine();
    }

    public int inputInt(String statement) {
        System.out.println(statement);
        return sc.nextInt();
    }

    //private void exerciseZero(String[] arguments) {
    //    //Checks whether any arguments have been provided, and gives an appropriate greeting.
    //    if (arguments.length > 0) System.out.println("Hello " + arguments[0]);
    //    else System.out.println("Hello");
    //}


    private void exerciseFive() {
        String name_of_the_TA = inputString("Please enter the name of a TA:\n");
        String name_of_the_student = inputString("Please enter your name:\n");
        System.out.println("Dear " + name_of_the_TA + ",\nI enjoy your tutorials, they are awesome!\n" + name_of_the_student + ".");
    }

    private void exerciseSix() {
        int num1 = inputInt("Please enter the first number:\n");
        int num2 = inputInt("Please enter the second number:\n");
        int num3 = inputInt("Please enter the third number:\n");
        if (num1 < num2 && num2 < num3) System.out.println("True");
        else System.out.println("False");
    }

    private void exerciseSeven() {
        String word = inputString("Please enter the Sequence:\n");
        StringBuilder newString = new StringBuilder();

        for (int i = word.length() - 1; i >= 0; i--) newString.append(word.charAt(i));

        if (newString.toString().equals(word)) System.out.println("This sequence is a Palindrome!");
        else System.out.println("This sequence is not a Palindrome!");
    }
}
