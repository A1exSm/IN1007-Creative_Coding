import java.util.Arrays;
public class WeekFour {
    WeekThree weekThree = new WeekThree();

    public void run() {
        if (weekThree.inputString("would you like to run weekFour methods (y/n)? ").equals("y")) {
            switch (weekThree.inputInt("Which weekFour function would you like to run? ")) {
                case 1:
                    exerciseOne();
                    break;
                case 2:
                    exerciseTwo();
                    break;
                case 3:
                    exerciseThree();
                    break;
                case 4:
                    exerciseFour();
                    break;
                case 6:
                    exerciseSix();
                    break;
                case 7:
                    exerciseSeven();
                    break;
                case 8:
                    exerciseEight();
                    break;
                case 9:
                    exerciseNine();
                    break;
                case 10:
                    exerciseTen();
                    break;
                default:
                    System.out.println("Invalid input");
            }
        }
    }
    private void exerciseOne() {
        // display "greater" if the first integer is greater than the second  and "smaller or equal" otherwise.
        int one  = weekThree.inputInt("Please enter integer One: ");
        int two  = weekThree.inputInt("Please enter integer Two: ");
        if (one > two) {
            System.out.println("greater");
        } else {
            System.out.println("smaller or equal");
        }
    }
    private void exerciseTwo() {
        // Displays the sum of 1 + 2... + n, where n = input int
        int positiveInt;
        while (true) {
            positiveInt = weekThree.inputInt("Please enter a positive integer: ");
            if (positiveInt >= 0) {
                break;
            } else {
                System.out.println(positiveInt + " is not a integer");
            }
        }
        int sum = 0;
        for (int i = 1; i <= positiveInt; i++) {
            sum += i;
        }
        System.out.println(sum);
    }

    private void exerciseThree() {
        // Write a program which asks the user to enter an integer until this integer is negative.
        int integer = 0;
        while (integer >= 0) {
            integer = weekThree.inputInt("Please enter an integer: ");
        }
    }

    private void exerciseFour() {
        // enter a month and displays the corresponding number month.
        String[] Month  = {
                "JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE",
                "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"
        };
        String inputMonth = weekThree.inputString("Please enter a month: ").toUpperCase();
        for (int i = 1; i <= Month.length; i++) {
            if (Month[i-1].equals(inputMonth)) {
                System.out.println(i);
                break;
            }
        }
    }
    private int[] arrayInput() {
        int n = weekThree.inputInt("Please enter an integer: ");
        int[] inputs = new int[n];
        for (int i = 0; i < n; i++) {
            inputs[i] = weekThree.inputInt("Please enter an integer: ");
        }
        return inputs;
    }

    private void exerciseSix() {
        // enter integer n and enter n additional int values then display the sum n1 - n2 + n3 - n4 +…
        int sum = 0;
        int[] inputs = arrayInput();
        for (int i = 0; i < inputs.length; i++) {
            if (i % 2 == 0) {
                sum += inputs[i];
            } else {
                sum -= inputs[i];
            }
        }
        System.out.println(sum);
    }

    private void exerciseSeven() {
        // enter an integer n and then asks the user to enter n additional integers, and displays these integers in reverse order.
        int[] firstArray = arrayInput();
        int[] revArray = new int[firstArray.length];
        for (int i = firstArray.length - 1; i >= 0; i--) {
            revArray[(firstArray.length-1) - i] = firstArray[i];
        }
        System.out.println(Arrays.toString(firstArray));
        System.out.println(Arrays.toString(revArray));
    }
    private void exerciseEight() {
        // Write a program which asks the user to enter an integer n and draw the triangle with 2n-1 stars at its base (here illustrated with n=5):
        int base = (2*(weekThree.inputInt("Please enter an integer: ")))-1;
        int temp = 1;
        int buffer;
        while (temp <= base) {
            buffer = ((base - temp)/2)-1;
            if (temp != base) {
                for (int i = 0; i <= buffer; i++) {
                    System.out.print(" ");
                }
            }
            for (int i = temp; i >= 1; i--) {
                System.out.print("*");
            }
            temp +=2;
            System.out.println();
        }
    }

    private void exerciseNine(){
        int positiveInt = weekThree.inputInt("Please enter a positive integer: ");
        while (positiveInt != 1) {
            if (positiveInt % 2 == 0) { //even
                positiveInt = positiveInt / 2;
            } else { // ood
                positiveInt = (positiveInt * 3) + 1;
            }
            System.out.println(positiveInt);
        }
    }

    private void exerciseTen() {
        // Enter two String and displays one of the longest common sequence of the two String
        String stringOne = weekThree.inputString("Please enter a string: ").toLowerCase();
        String stringTwo = weekThree.inputString("Please enter a string: ").toLowerCase();
        String longestCommonSequence = "";
        StringBuilder tempString = new StringBuilder();
        for (int outerWord = 0; outerWord < stringOne.length(); outerWord++) {
            for (int innerWord = 0; innerWord < stringTwo.length(); innerWord++) {
                if (stringOne.charAt(outerWord) == stringTwo.charAt(innerWord)) {
                    tempString.append(stringOne.charAt(outerWord));
                    int y = outerWord + 1;
                    for (int i = innerWord + 1; i < stringTwo.length() && y < stringOne.length();i++, y++) {
                        if (stringOne.charAt(y) == stringTwo.charAt(i)) {
                            tempString.append(stringOne.charAt(y));
                        } else {
                            break;
                        }
                    }
                }
                if (tempString.length() > longestCommonSequence.length()) {
                    longestCommonSequence = tempString.toString();
                }
                tempString.setLength(0);
            }
        }
        if (!longestCommonSequence.isEmpty()) {
            System.out.println(longestCommonSequence);
        } else {
            System.out.println("No common sequence found.");
        }
    }
}
