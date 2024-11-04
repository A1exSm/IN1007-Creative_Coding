import java.util.Scanner;
static final Scanner sc = new Scanner(System.in);
boolean close = false;
String inputString(String statement) {
  //Scanner sc = new Scanner(System.in);
  System.out.println(statement);
  return sc.nextLine();
}

int inputInt(String statement) {
  //Scanner sc = new Scanner(System.in);
  System.out.println(statement);
  return sc.nextInt();
}

void exerciseZero(String[] arguments) {
  //Checks whether any arguments have been provided, and gives an appropriate greeting.
  if (arguments.length > 0) System.out.println("Hello " + arguments[0]);
  else System.out.println("Hello");
}


void exerciseFive() {
  String name_of_the_TA = inputString("Please enter the name of a TA:\n");
  String name_of_the_student = inputString("Please enter your name:\n");
  System.out.println("Dear " + name_of_the_TA + ",\nI enjoy your tutorials, they are awesome!\n" + name_of_the_student + ".");
}

void exerciseSix() {
  int num1 = inputInt("Please enter the first number:\n");
  int num2 = inputInt("Please enter the second number:\n");
  int num3 = inputInt("Please enter the third number:\n");
  if (num1 < num2 && num2 < num3) System.out.println("True");
  else System.out.println("False");
}

void exerciseSeven() {
  String word = inputString("Please enter the Sequence:\n");
  StringBuilder newString = new StringBuilder();

  for (int i = word.length() - 1; i >= 0; i--) newString.append(word.charAt(i));

  if (newString.toString().equals(word)) System.out.println("This sequence is a Palindrome!");
  else System.out.println("This sequence is not a Palindrome!");
}

void notice(String text) {
  textSize(20);
  textAlign(CENTER);
  fill(250);
  rect((width/2)-200, (height/2)-100, 400, 200);
  fill(50);
  text(text, width/2, height/2);
  noFill();
}

void keyPressed() {
  if (keyCode == java.awt.event.KeyEvent.VK_F1) {
    if (!close) {
      close = true;
      notice("If you wan't to exit the programme:\nPress F1 again");
    } else {
      exit();
    }
  } else {
    close = false;
  }
}
// this function ensures what is drawn on the screen stays when it needs to
void refresh() {
  if (close) { // if close is true, then we are currently asking whether the programming should be exited.
    //println("Refresh skipped");
  } else {
    background(150);
  }
}

// Method that properly closes the programme by closing the scanner.
void exit() {
  sc.close();
  super.exit();
}
