import 'package:flutter/material.dart';
import 'package:proyecto1/login_page.dart';

void main() {
  runApp(MaterialApp(
    home: Pagina2(),
  ));
}

class Pagina2 extends StatefulWidget {
  @override
  
  _Pagina2State createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  bool usado = false;
  String resultado = '';
  String mensajeYaHaIngresado = LoginPage.yaHaIngresado?'Un gusto saludarte de nuevo':'Bienvenido';
  
  Map<String, TextEditingController> controllers = {
  'Coordenadas en X': TextEditingController(),
  'Coordenadas en Y': TextEditingController(),
  'Área Privada Neta': TextEditingController(),
  // Agrega más controladores según sea necesario
};

  TextStyle customTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    fontSize: 24.0,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CARACTERÍSTICAS',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 45.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff53B3C1),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xff53B3C1),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                _buildDataRow('Coordenadas en X'),
                SizedBox(height: 20.0),
                _buildDataRow('Coordenadas en Y'),
                SizedBox(height: 20.0),
            
                _buildDataRow('Área Privada Neta'),
                SizedBox(height: 20.0),
                _buildOptionRow('Usado', usado),
                SizedBox(height: 40.0), // Espacio adicional antes del botón
                _buildCalculateButton(),
                SizedBox(height: 80.0), 
                Row(
                  mainAxisAlignment : MainAxisAlignment.center,
                children:[
                  Text(
                  resultado,
                  style: resultado == 'CARACTERÍSTICAS'
                      ? TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white,
                        )
                      : customTextStyle,
                )]),
                SizedBox(height: 60.0),
                Row(mainAxisAlignment : MainAxisAlignment.center,
                children:[
                  Text(
                  mensajeYaHaIngresado,
                  style:  TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                        )
                      ,
                )
                ]
                )
                

                
                  
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataRow(String labelText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: labelText == 'CARACTERÍSTICAS'
              ? TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white,
                )
              : customTextStyle,
        ),
        SizedBox(width: 20.0),
        if (labelText == 'Coordenadas en X' || labelText == 'Coordenadas en Y' || labelText == 'Área Privada Neta')
          Container(
            width: 150, // Ancho fijo
            child: TextFormField(
              controller: controllers[labelText],
              onChanged:(value){
              },
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                hintText: 'Ingrese $labelText',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildOptionRow(String labelText, bool isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: labelText == 'CARACTERÍSTICAS'
              ? TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white,
                )
              : customTextStyle,
        ),
        SizedBox(width: 20.0),
        Row(
          children: [
            Text(
              'Sí',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            Radio(
              value: true,
              groupValue: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  if (labelText == 'Usado') {
                    usado = value ?? false;
                  }
                });
              },
            ),
            Text(
              'No',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            Radio(
              value: false,
              groupValue: isSelected,
              onChanged: (bool? value) {
                setState(() {
                 if (labelText == 'Usado') {
                    usado = value ?? false;
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCalculateButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Lógica para el botón "Calcular"
          int valorEntero = usado ? 1 : 0;
           setState(() {

        resultado = "el precio es : "+(570116.0*double.parse((controllers['Coordenadas en X']?.text ?? ''))-7914688.73*double.parse((controllers['Coordenadas en Y']?.text ?? ''))+6059.72038*double.parse((controllers['Área Privada Neta']?.text ?? ''))-145040.708*valorEntero+168544654.30620614).toString();
        
    });
        },
        child: Text(
          'Calcular',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xff2986AE),
        ),
      ),
    );
  }
}
