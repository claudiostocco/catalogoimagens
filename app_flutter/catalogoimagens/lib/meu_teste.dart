import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class MeuTeste extends StatefulWidget {
  const MeuTeste({super.key});

  @override
  State<MeuTeste> createState() => _MeuTesteState();
}

class _MeuTesteState extends State<MeuTeste> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController edCpf = TextEditingController();
  TextEditingController edCnpj = TextEditingController();
  TextEditingController edCpfCnpj = TextEditingController();

  void validate() {
    if (form.currentState != null && form.currentState!.validate()) {
      print('Valido!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Form(
              key: form,
              child: Column(
                children: [
                  TextFormField(
                    controller: edCpf,
                    inputFormatters: [CpfInputFormatter()],
                    decoration: const InputDecoration(label: Text('Cpf')),
                  ),
                  TextFormField(
                    controller: edCnpj,
                    inputFormatters: [CnpjInputFormatter()],
                    decoration: const InputDecoration(label: Text('Cnpj')),
                  ),
                  TextFormField(
                    controller: edCpfCnpj,
                    inputFormatters: [CpfOuCnpjFormatter()],
                    decoration: const InputDecoration(label: Text('Cpf/Cnpj')),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: validate,
              label: const Text('Validar'),
              icon: const Icon(Icons.verified),
            ),
            const SizedBox(height: 25),
            Text('Cpf: ${edCpf.text}'),
            Text('Cnpj: ${edCnpj.text}'),
            Text('Cpf/Cnpj: ${edCpfCnpj.text}'),
          ],
        ),
      ),
    );
  }
}
