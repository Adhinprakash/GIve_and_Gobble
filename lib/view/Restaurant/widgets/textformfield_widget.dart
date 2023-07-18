import 'package:flutter/material.dart';

class ResTextFormfieldWidget extends StatelessWidget {
  const ResTextFormfieldWidget({super.key, required this.labelText});


final String labelText;
  @override
  Widget build(BuildContext context) {
    return  Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey)
                  ),
                  width: 350,
                  height: 180,
    
                  child: TextFormField(
                  
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      
                  labelText:labelText,
                        fillColor: const Color.fromARGB(255, 225, 45, 45),
                      
                        ),
                        
                  ),
                ) ;
  }
}