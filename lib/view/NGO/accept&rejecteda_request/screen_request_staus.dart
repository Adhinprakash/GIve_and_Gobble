import 'package:flutter/material.dart';

class ScreenRequestStaus extends StatelessWidget {
  const ScreenRequestStaus({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Food Request"),
        ),
        body: const Column(
          children: [
            TabBar(tabs: [
              Tab(
                text: "APPROVED ",
              ),
              Tab(
                text: 'REJECTED',
              )
            ])
          ],
        ),
      ),
    );
  }
}
