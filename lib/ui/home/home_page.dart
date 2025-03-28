import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/ui/home/view_models/home_view_model.dart';
import 'package:flutter_clean_arch/utils/input_formatter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cepController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _cepController.addListener(() {
      String formattedCep = formatCep(_cepController.text);
      if (_cepController.text != formattedCep) {
        _cepController.value = _cepController.value.copyWith(
          text: formattedCep,
          selection: TextSelection.collapsed(offset: formattedCep.length),
        );
      }
      setState(() {
        final cep = _cepController.text.replaceAll('-', '');
        isButtonEnabled = cep.length == 8;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CEP Input')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  children: [
                    TextField(
                      controller: _cepController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Digite seu CEP",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed:
                          isButtonEnabled
                              ? () async => await viewModel.getAddress(
                                _cepController.text,
                              )
                              : null,
                      child: const Text("Buscar"),
                    ),
                    const SizedBox(height: 20),
                    if (viewModel.isLoading) ...[
                      const CircularProgressIndicator(color: Colors.blue),
                    ] else if (viewModel.address != null) ...[
                      Text("CEP: ${viewModel.address!.cep}"),
                      Text("Logradouro: ${viewModel.address!.logradouro}"),
                      Text("Complemento: ${viewModel.address!.complemento}"),
                      Text("Bairro: ${viewModel.address!.bairro}"),
                      Text("Estado: ${viewModel.address!.estado}"),
                      Text("UF: ${viewModel.address!.uf}"),
                    ] else if (viewModel.isError) ...[
                      Text("CEP não encontrado ou inválido."),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
