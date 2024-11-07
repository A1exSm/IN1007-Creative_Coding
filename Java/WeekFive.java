import java.util.Arrays;
public class WeekFive {
    WeekThree weekThree = new WeekThree();
    public void run() {
        if (weekThree.inputString("would you like to run Five methods (y/n)? ").equals("y")) {
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
                case 5:
                    exerciseFive();
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
                default:
                    System.out.println("Invalid input");
            }
        }
    }
    private int localParam() {
        // takes as parameter an integer n and returns 4n + 5.
        return 4*weekThree.inputInt("Please enter a integer: ") + 5;
    }

    private int exerciseOne() {
        // displays the result of 4 × n + 5.
        //System.out.println(localParam());
        return localParam();
    }
    private int arithmeticMean(int... a) {
        int sum = 0;
        for (int i : a) {
            sum += i;
        }
        return sum/a.length;
    }
    private double geometricMean(int... a) {
        double product = 1.0;
        for (int i : a) {
            product *= i;
        }
        return Math.pow((product),(1.0 / a.length));
    }
    private void exerciseTwo() {
        // displays true if the arithmetic mean is greater than geometric
        int a = weekThree.inputInt("Please enter int a: ");
        int b = weekThree.inputInt("Please enter int b: ");
        System.out.println(arithmeticMean(a, b) > geometricMean(a, b));
    }
    int count3 = 0;
    int temp3;
    int sum3 = 0;
    private void exerciseThree() {
        count3++;
        if (temp3 == 0) {
            temp3 = weekThree.inputInt("Please enter an integer: ");
        }
        if (!(count3 > temp3)) {
            sum3 += count3;
            exerciseThree();
        } else {
            System.out.println(sum3);
        }
    }
    private void exerciseFour() {}
    private void exerciseFive() {
        int a = 5;
        int b = 7;
        int c = 7;
        System.out.println(arithmeticMean(a, b, c) > geometricMean(a, b, c));
    }

    private void triangleOne(int base) {
        // asks the user to enter an integer n and draw a right angle triangle with stars at its base:
        int temp = 0;
        while (temp < base) {
            for (int i = 0; i < base-temp-1; i++) {
                System.out.print(" ");
            }
            for (int j = 0; j <= temp; j++) {
                System.out.print("*");
            }
            System.out.println();
            temp ++;
        }
    }

    private void triangleTwo(int base) {
        int temp = base;
        while (temp > 0) {
            for (int i = 0; i < base-temp; i++) {
                System.out.print(" ");
            }
            for (int j = 0; j < temp; j++) {
                System.out.print("*");
            }
            System.out.println();
            temp --;
        }
    }

    private void triangleThree(int base) {
        base = (base*2);
        int temp = base;
        while (temp > 0) {
            for (int i = 0; i <= ((base-temp)/2)-1; i++) {
                System.out.print(" ");
            }
            for (int j = 0; j < temp; j++) {
                System.out.print("*");
            }
            System.out.println();
            temp -=2;
        }
    }

    private void triangleFour(int base) {
        triangleOne(base);
        triangleTwo(base);
        triangleThree(base);
    }

    private void exerciseSix() {
        int base = weekThree.inputInt("Please enter an integer: ");
        triangleOne(base);
        System.out.println();
        triangleTwo(base);
        System.out.println();
        triangleThree(base);
        System.out.println();
        triangleFour(base);
        System.out.println();

    }
    int count4 = 0;
    int n = 0; // f0
    int n1 = 1; // f1
    int n2 = 1; // f2
    int f = 0; // f(n)
    private int exerciseSeven() {
        if (f <= 0) {
            f = weekThree.inputInt("Please enter an integer above 2: ");
            if (f<=2) {
                f = weekThree.inputInt("Error: enter a value greater than 2");
                return -1;
            }
        }
        if (count4 < f-2) {
            n = n1 + n2;
            System.out.println(n);
            n2 = n1;
            n1 = n;
            count4++;
            exerciseSeven();
        }
        return 0;
    }
    private void exerciseEight() {
        // this is need to have the outer for loop replaced with a recursion method and use a swap method.
        int[] array = {4, 6, 2, 3, 6, 7, 8, 8, 3, 4, 2};
        for (int j = 0; j < 1000; j++) {
            int pivot = array[array.length - 1];
            int pivot_position = array.length - 1;
            int temp;
            for (int i = array.length - 2; i > 0; i--) {
                if (array[i] > pivot) {
                    array[pivot_position] = array[i];
                    System.out.println(array[i] + " moves from " + i + " to " + pivot_position);
                    array[i] = pivot;
                    System.out.println("Pivot (s) moves from " + pivot_position + " to " + i);
                    pivot_position = i;
                    System.out.println(Arrays.toString(array));
                }
            }
        }
    }
//    private void exerciseEight() {}
}
