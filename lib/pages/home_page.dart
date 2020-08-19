import 'package:comparador_combustivel/widgets/input_widget.dart';
import 'package:comparador_combustivel/widgets/loading_buttom_widget.dart';
import 'package:comparador_combustivel/widgets/logo_widget.dart';
import 'package:comparador_combustivel/widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatelessWidget {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          LogoWidget(),
          SuccessWidget(
            reset: () {},
            result: "Compensa Utilizar",
          ),
          InputWidget(
            label: "Alcool",
            ctrl: _alcCtrl,
          ),
          InputWidget(
            label: "Gasolina",
            ctrl: _gasCtrl,
          ),
          LoadingButtomWidget(
            busy: true,
            invert: false,
            func: () {},
            text: "CALCULAR",
          ),
        ],
      ),
    );
  }
}
