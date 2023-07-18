import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/We can be  the generation  that ends hunger-min.jpg"),
                    fit: BoxFit.fitHeight)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No Food waste",
                          style: textStyleFuc(
                              weight: FontWeight.bold,
                              color: Colors.white,
                              size: 26),
                        ),
                        Text(
                          "one third of food produced is lost or wasted around 1.3 billion tons of food ",
                          style: textStyleFuc(
                              weight: FontWeight.w300,
                              color: Colors.white,
                              size: 17),
                        )
                      ],
                    ),
                  ),
                  
           
                ],
              ),
            ),
          ) ;
  }
}