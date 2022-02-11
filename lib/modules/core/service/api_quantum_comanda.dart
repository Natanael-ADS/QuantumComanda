// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class ServerBase {
  static String URL = "127.0.0.1";
  static String PORT = "8086";
  static const SERVER = "/datasnap/rest/TSM/";

  static String _baseUrl() => URL + PORT + SERVER;

  static String logginServiceUrl(String id, String password) {
    return _baseUrl() + "Acesso/$id/$password";
  }
}
