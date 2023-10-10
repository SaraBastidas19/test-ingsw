import 'package:proyecto1/pagina2.dart'; // Asegúrate de que la ruta sea correcta
import 'dart:html';

import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  @override
  _Pagina2State createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  bool areaPrivada = false;
  bool nuevo = false;

  TextStyle customTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    fontSize: 24.0,
    color: Colors.white,
    shadows: [
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 5.0,
        color: Colors.black,
      ),
    ],
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
            fontSize: 64.0,
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
                _buildOptionRow('Área Privada', areaPrivada),
                SizedBox(height: 20.0),
                _buildOptionRow('Nuevo', nuevo),
                SizedBox(height: 40.0), // Espacio adicional antes del botón
                _buildCalculateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataRow(String labelText) {
    return Row(
      children: [
        Expanded(
          child: Text(
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
        ),
        SizedBox(width: 20.0),
        Expanded(
          child: TextFormField(
            style: TextStyle(
              color: Colors.white,
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
        Expanded(
          child: Text(
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
                  if (labelText == 'Área Privada') {
                    areaPrivada = value ?? false;
                  } else if (labelText == 'Nuevo') {
                    nuevo = value ?? false;
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
                  if (labelText == 'Área Privada') {
                    areaPrivada = value ?? false;
                  } else if (labelText == 'Nuevo') {
                    nuevo = value ?? false;
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


