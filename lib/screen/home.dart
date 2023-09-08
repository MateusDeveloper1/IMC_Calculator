import 'package:flutter/material.dart';
import 'package:imc_calculate/widgets/Form_imc.dart';

import '../controller/imc_controller.dart';

class HomeImc extends StatefulWidget {
  const HomeImc({super.key});

  @override
  State<HomeImc> createState() => _HomeImcState();
}

class _HomeImcState extends State<HomeImc> {
  final _formKey = GlobalKey<FormState>();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  String result = "";
  String imcValue = "";

  @override
  void dispose() {
    super.dispose();
    pesoController.dispose();
    alturaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.deepPurple,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Seu IMC é: $imcValue",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    FormImc(
                      nameInput: "Peso",
                      placeholder: "Digite seu peso",
                      controller: pesoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo não pode ser vázio";
                        }
                        if (value.length <= 1) {
                          return "Valor inválido";
                        }
                        return null;
                      },
                    ),
                    FormImc(
                      nameInput: "Altura",
                      placeholder: "Digite sua altura",
                      controller: alturaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo não pode ser vázio";
                        }
                        if (value.length <= 1) {
                          return "Valor inválido";
                        }
                        return null;
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var peso = double.parse(pesoController.text);
                          var altura = double.parse(alturaController.text);

                          setState(() {
                            result = ImcController.imcResult(peso, altura);
                            imcValue = ImcController.totalCalc(peso, altura);
                          });
                        }
                      },
                      child: const Text(
                        "Calcular",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
