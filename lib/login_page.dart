import 'package:flutter/material.dart';
import 'package:proyecto1/pagina2.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});
  static List<String> ids = [];
  static TextEditingController controlador = TextEditingController();
  static bool yaHaIngresado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff53B3C1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ApartaApp',
              style: TextStyle(
                fontFamily: 'Inter', // Tipo de letra "Inter"
                fontWeight: FontWeight.bold, // Negritas
                fontSize: 100.0, // Tamaño de fuente reducido
                color: Colors.white, // Texto blanco
                letterSpacing: 10.0, // Espaciado personalizado entre letras
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0), // Desplazamiento de la sombra
                    blurRadius: 5.0, // Radio de desenfoque de la sombra
                    color: Colors.black, // Color de la sombra
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Espacio entre líneas de texto
            Text(
              'Ingresa tu ID',
              style: TextStyle(
                fontFamily: 'Inter', // Tipo de letra "Inter"
                fontWeight: FontWeight.w600, // Negritas semi bold
                fontSize: 32.0, // Tamaño de fuente reducido
                color: Colors.white, // Texto blanco
              ),
            ),
            const SizedBox(height: 20), // Espacio entre líneas de texto y campo de texto
            SizedBox(
              width: 300, // Ancho del campo de texto
              child: TextFormField(
                controller: controlador,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black, // Texto blanco
                ),
                decoration: InputDecoration(
                  hintText: 'Ingresa algo', // Utiliza hintText en lugar de labelText
                  hintStyle: TextStyle(
                    color: Colors.white, // Color del texto de sugerencia (hint)
                  ),
                  filled: true, // Relleno blanco
                  fillColor: Colors.white, // Color del relleno
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white, // Bordes blancos
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white, // Bordes blancos cuando está enfocado
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Espacio entre campo de texto y botón
           ElevatedButton(
  onPressed: () {
    if (ids.contains(controlador.text)){
      yaHaIngresado = true;
    }else{
      yaHaIngresado = false;
    }
    ids.insert(0,controlador.text);
    print(LoginPage.ids);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Pagina2(),
      ),
    );
  },
  child: Text(
    'Iniciar Sesión',
    style: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 25.0,
    ),
  ),
  style: ElevatedButton.styleFrom(
    primary: const Color(0xff2986AE),
  ),
),

          ],
        ),
      ),
    );
  }
}