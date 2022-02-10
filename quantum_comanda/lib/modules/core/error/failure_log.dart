// ignore_for_file: avoid_print

class Failure {
  static String message = "";

  static void log(Object ex, StackTrace st) {
    message = "${DateTime.now()}\n$ex\n$st";

    //print(message);
    //debugPrint(message);
  }
}
