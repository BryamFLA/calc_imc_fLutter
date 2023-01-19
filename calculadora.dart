class CalculadoraIMC {
  late String valueHeight;
  late String valueWeight;
  late double resultValue;
  late String resultType;

  void setValues(String vH, String vW) {
    valueHeight = vH.replaceAll(',', '.');
    valueWeight = vW.replaceAll(',', '.');
  }

  String calcularValueIMC() {
    resultValue = double.parse(valueWeight) /
        (double.parse(valueHeight) * double.parse(valueHeight));
    return resultValue.toStringAsFixed(2);
  }

  String calcularTypeIMC() {
    if (resultValue < 18.5) {
      resultType = 'ABAIXO DO PESO';
    } else if (resultValue >= 18.5 && resultValue < 25) {
      resultType = 'PESO NORMAL';
    } else if (resultValue >= 25 && resultValue < 30) {
      resultType = 'ACIMA DO PESO';
    } else if (resultValue >= 30 && resultValue < 35) {
      resultType = 'OBESIDADE I';
    } else if (resultValue >= 35 && resultValue < 40) {
      resultType = 'OBESIDADE II';
    } else {
      resultType = 'OBESIDADE III';
    }
    return resultType;
  }
}
