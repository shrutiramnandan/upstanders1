import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upstanders/global/theme/colors.dart';

class BuildEditTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final String prefixIconAsset;
   final  List<TextInputFormatter> inputFormatters;
   final void Function(String) onChanged;

  const BuildEditTextField(
    {Key key, this.controller, 
    this.hint, this.inputType, 
    this.prefixIconAsset, this.inputFormatters, @required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
         inputFormatters: inputFormatters,
          keyboardType: inputType,
          controller: controller,
          decoration: new InputDecoration(
            fillColor: MyTheme.white,
            filled: true,
           
              contentPadding: const EdgeInsets.all(8),
               focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyTheme.primaryColor, ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyTheme.grey,),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyTheme.red,),
              ),
            prefixIcon:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Image.asset(
                prefixIconAsset,
                width: 25.0,
                height: 20,
                // color: Colors.grey[600],
              ),
            ),
            hintText: hint,
             hintStyle: TextStyle(
                  fontSize: 13,
                  color: MyTheme.grey,
                  fontWeight: FontWeight.bold),
            // labelText: 'Number',
          ),
          onChanged: onChanged,
          
        ),
      
    );
  }
}