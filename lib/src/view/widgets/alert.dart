import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/enum/alert_type.dart';

class Alert {
  dialog(BuildContext context, AlertType type, String message, {VoidCallback? onPress}) {
    String title;
    String okButton;
    String? cancelButton;

    switch (type) {
      case AlertType.error:
        title = "Erro";
        okButton = "OK";
        break;
      case AlertType.warning:
        title = "Atenção";
        okButton = "CONFIRMAR";
        cancelButton = "CANCELAR";
        break;
      case AlertType.sucess:
        title = "Sucesso";
        okButton = "OK";
        break;
      default:
        title = "Erro";
        okButton = "OK";
        break;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => true,
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    // onPressed: onPress,
                    onPressed: () {
                      if (type == AlertType.warning) {
                        onPress == null ? Navigator.pop(context) : onPress();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Text(okButton),
                  ),
                  if (type == AlertType.warning)
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(cancelButton!),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  snack(BuildContext context, String message, {String? buttonLabel}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
        child: Text(
          message,
        ),
      ),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(label: (buttonLabel ?? "OK"), onPressed: () {}),
    ));
  }
}

final alertaProvider = Provider((_) => Alert());
