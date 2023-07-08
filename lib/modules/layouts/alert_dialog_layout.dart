import 'package:cripto_exchange_ui/theme/current_theme.dart';
import 'package:cripto_exchange_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AlertDialogLayout extends StatelessWidget {
  const AlertDialogLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Color.fromARGB(0, 15, 20, 35),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      content: BgBlur(
        width: MediaQuery.of(context).size.width,
        borderColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CurrentTheme.primaryColor),
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, color: CurrentTheme.textColor)),
                ],
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
