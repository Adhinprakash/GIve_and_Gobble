import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return     Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/pexels-ifenacho-solomon-13162766 (1) low quality.jpg"),
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
                          "Just One Tap",
                          style: textStyleFuc(
                              weight: FontWeight.bold,
                              color: Colors.white,
                              size: 26),
                        ),
                        Text(
                          " Make a difference in Peoples lives with just one tap",
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