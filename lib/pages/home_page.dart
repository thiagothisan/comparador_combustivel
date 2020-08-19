import 'package:comparador_combustivel/widgets/logo_widget.dart';
import 'package:comparador_combustivel/widgets/submit_form_widget.dart';
import 'package:comparador_combustivel/widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color = Colors.deepPurple;
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  bool _busy = false;
  bool _completed = false;
  String _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1200),
        color: _busy ? Colors.amber : Theme.of(context).primaryColor,
        child: ListView(
          children: <Widget>[
            LogoWidget(),
            _completed
                ? SuccessWidget(
                    reset: reset,
                    result: _resultText,
                  )
                : SubmitFormWidget(
                    alcCtrl: _alcCtrl,
                    gasCtrl: _gasCtrl,
                    submitFunc: calculate,
                    busy: _busy,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    print("calculate");
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
    });

    return Future.delayed(Duration(seconds: 3), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina!";
        } else {
          _resultText = "Compensa utilizar Álcool!";
        }
        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _alcCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
