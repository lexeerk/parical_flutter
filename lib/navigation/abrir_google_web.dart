import 'dart:html' as html;

void abrirGoogle(String consulta) {
  final url = Uri.https('www.google.com', '/search', {'q': consulta});
  html.window.open(url.toString(), '_blank');
}
