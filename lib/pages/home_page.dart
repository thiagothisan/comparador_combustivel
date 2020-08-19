import 'package:comparador_combustivel/widgets/input_widget.dart';
import 'package:comparador_combustivel/widgets/loading_buttom_widget.dart';
import 'package:comparador_combustivel/widgets/logo_widget.dart';
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
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Compensa utilizar álcool",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40,
                    fontFamily: "Big Shoulders Display",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                LoadingButtomWidget(
                  busy: false,
                  invert: true,
                  func: () {},
                  text: "CALCULAR NOVAMENTE",
                ),
              ],
            ),
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
