import 'package:flutter/cupertino.dart';
import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await saveBoleto();
    }
  }

  Future<void> saveBoleto() async {
    final instance = await SharedPreferences.getInstance();
    model.value = model.value!.replaceAll("R\$", "R\$ ");
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.insert(0, model.toJson());
    await instance.setStringList("boletos", boletos);

    return;
  }

  Future<void> updateBoleto(BoletoModel boleto) async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.removeWhere((element) => element == boleto.toJson());
    boleto.isPayed = true;
    boletos.insert(0, boleto.toJson());
    await instance.setStringList("boletos", boletos);
    return;
  }

  Future<void> deleteBoleto(BoletoModel boleto) async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.removeWhere((element) => element == boleto.toJson());
    await instance.setStringList("boletos", boletos);
    return;
  }

  void onChange(
      {String? name, String? dueDate, String? value, String? barcode}) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }
}
