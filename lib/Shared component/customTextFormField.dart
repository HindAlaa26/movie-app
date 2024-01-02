import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {

 TextEditingController controller;
 String validatorText ;
 IconData? prefixIcon;
 IconData? suffixIcon;
 String hintText;
 bool obscureText;
 TextInputType keyboardType;
 bool isPassword ;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();

 CustomTextFormField(
     {super.key, this.prefixIcon,required this.isPassword,this.suffixIcon,required this.controller, required this.validatorText, required this.hintText,this.obscureText = false ,required this.keyboardType});
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
         controller: widget.controller,
        keyboardType: widget.keyboardType,
        cursorColor: const Color.fromRGBO(255, 187, 59, 1),
        validator:(value)
        {
          if(value!.isEmpty)
            {
              return "${widget.validatorText} must not be Empty";
            }
        },
        style: const TextStyle(color: Colors.grey,fontSize: 20,letterSpacing: 2,shadows: [BoxShadow(blurRadius: 0,),],fontWeight: FontWeight.normal),
        obscureText:widget.isPassword ,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon,color: Colors.grey),
          suffixIcon:widget.obscureText?(widget.isPassword ? IconButton(onPressed: (){
           setState(() {
             widget.isPassword = !widget.isPassword ;
           });
         },icon: const Icon(Icons.visibility_off_outlined),):IconButton(onPressed: (){
           setState(() {
             widget.isPassword = !widget.isPassword ;
           });
         },icon: const Icon(Icons.visibility),) ): null,
         suffixIconColor: Colors.grey,
         errorStyle: const TextStyle(
             color: Colors.grey,
            fontSize: 12,
           fontWeight: FontWeight.normal
         ),
         errorBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.grey.shade700),borderRadius: BorderRadius.circular(40)) ,
          focusedErrorBorder:  OutlineInputBorder(borderSide: BorderSide(color:Colors.grey.shade700),borderRadius: BorderRadius.circular(40)),

          hintText: widget.hintText,
          hintStyle:const TextStyle(color: Colors.grey,letterSpacing: 2,fontSize: 20) ,
          border: OutlineInputBorder(borderSide: const BorderSide(color:Colors.grey),borderRadius: BorderRadius.circular(40)),
          fillColor: const Color.fromRGBO(36, 36, 38, 1.0),
          filled: true,
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromRGBO(255, 187, 59, 1),),borderRadius: BorderRadius.circular(40))

        ),


      ),
    );
  }
}

