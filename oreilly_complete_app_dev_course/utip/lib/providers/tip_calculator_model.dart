import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TipCalculatorModel extends ChangeNotifier {
  
  TipCalculatorModel();

  int _personCount = 0;
  double _sliderval = 0.0;
  double _sliderPos = 0;
  double _tipPercentPerPerson = 0;
  double _tipPerPerson = 0;
  double _tipTotal = 0;
  double _costPerPerson = 0;
  double _totalCost = 0.0;
  String _finalCostPerPersonOutput = "0.00";
  String _finalTipPerPersonOutput = "0.00";
  String _finalTipTotalOutput = "0.00";

  double _totalPP = 0;
  double _totalT = 0;

  int get personCount => _personCount;
  double get sliderval => _sliderval;
  double get sliderPos => _sliderPos;
  double get tipPercentPerPerson => _tipPercentPerPerson;
  double get tipPerPerson => _tipPerPerson;
  double get tipTotal => _tipTotal;
  double get costPerPerson => _costPerPerson;
  double get totalCost => _totalCost;
  String get finalCostPerPersonOutput => _finalCostPerPersonOutput;
  String get finalTipPerPersonOutput => _finalTipPerPersonOutput;
  String get finalTipTotalOutput => _finalTipTotalOutput;

  double get totalPP => _totalPP;
  double get totalT => _totalT;

  void decrementCounter() {
    if (_personCount > 1) _personCount--;
    handleBillAmount(totalCost);
    notifyListeners();
  }

  void incrementCounter() {
    _personCount++;
    handleBillAmount(_totalCost);
    notifyListeners();
  }

  void setSliderValue(sliderValue) {
    debugPrint("setting to sliderValue of: $sliderValue...");
    _tipPercentPerPerson = _sliderPos = sliderValue;
    handleBillAmount(_totalCost);
    notifyListeners();
  }

  // These need to convert to getters
  void totalPerPerson() {
    _totalPP =
        ((_totalCost * (_tipPercentPerPerson / 100)) + (_totalCost)) /
        (_personCount);
    notifyListeners();
  }

  void totalTip() {
    _totalT = ((_totalCost * _tipPercentPerPerson) / 100);
    notifyListeners();
  }

  void handleBillAmount(totalBillAmount) {
    try {
      if (totalBillAmount is String) {
        totalBillAmount = double.parse(totalBillAmount);
      }

      if (totalBillAmount != null) {
        _totalCost = totalBillAmount;
        if (personCount > 0) {
          _costPerPerson = totalBillAmount / personCount;
          _tipTotal =
              totalBillAmount * (_sliderPos / 100); // added to account for 6.22
          _tipPerPerson = (totalBillAmount * (_sliderPos / 100)) / _personCount;
        }
      } else {
        _tipPerPerson = 0.0;
        _tipTotal = 0.0;
      }
    } on TypeError catch (err) {
      debugPrint(err.toString());
      totalBillAmount = 0;
    } on Exception catch (err) {
      debugPrint(err.toString());
      totalBillAmount = 0;
    }

    final formatCurrency = NumberFormat.simpleCurrency(locale: "en_GB");

    _finalTipPerPersonOutput = formatCurrency.format(_tipPerPerson);
    _finalTipTotalOutput = formatCurrency.format(_tipTotal);
    _finalCostPerPersonOutput = formatCurrency.format(
      _costPerPerson + _tipPerPerson,
    );

    // course method
    totalPerPerson();
    notifyListeners();
  }
}
