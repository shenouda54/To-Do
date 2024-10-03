import 'package:flutter/material.dart';

class SettingTub extends StatelessWidget {
  const SettingTub({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 120,
          ),
          Text("Mode"),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              // showModalBottomSheet(
              //   isScrollControlled: true,
              //   context: context,
              //   builder: (context) {
              //     return ThemeBottomSheet(
              //     );
              //   },
              // );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Colors.transparent)),
              child: Text("Light"),
            ),
          ),
          SizedBox(
            height: 44,
          ),
          Text("Language"),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              // showModalBottomSheet(
              //   isScrollControlled: true,
              //   context: context,
              //   builder: (context) {
              //     return LanguageBottomSheet(
              //     );
              //   },
              // );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Colors.transparent)),
              child: Text("Arbic"),
            ),
          )
        ],
      ),
    );
  }
}
