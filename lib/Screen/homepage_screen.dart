import 'package:all_about_api/State/homepage_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomePageState>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (BuildContext context, state, Widget? child) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                state.fetching = true;
                state.CheckConnection(context);

                print("sucess");
              },
              child: Text(
                "Show Data",
              ),
            ),
          ),
        );
      },
    );
  }
}
