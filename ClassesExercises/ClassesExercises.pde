void setup()
{
  String message = "Our first two weeks of CreativeCoding are nearly over";
  println(message.toUpperCase());
  println(message.toLowerCase());
  println(message.length());
  println(message.charAt(5));
  if (message.contains("day")) {
    println("Day found");
  } else {
    println("No match found");
  }
}
