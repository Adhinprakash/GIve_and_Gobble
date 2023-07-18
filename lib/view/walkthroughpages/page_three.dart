import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/pexels-riya-kumari-low q.jpg"),
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
                          "We’re in  together.",
                          style: textStyleFuc(
                              weight: FontWeight.bold,
                              color: Colors.white,
                              size: 26),
                        ),
                        Text(
                          "We can be  the generation  that ends hunger",
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