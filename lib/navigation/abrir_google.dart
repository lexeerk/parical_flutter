import 'abrir_google_stub.dart'
    if (dart.library.html) 'abrir_google_web.dart'
    as platform;

void abrirGoogle(String consulta) => platform.abrirGoogle(consulta);
