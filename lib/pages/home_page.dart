import 'package:comparador_combustivel/widgets/input_widget.dart';
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
          InputWidget(
            label: "Alcool",
            ctrl: _alcCtrl,
          ),
          InputWidget(
            label: "Gasolina",
            ctrl: _gasCtrl,
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(
                60,
              ),
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "CALCULAR",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
