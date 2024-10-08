import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TesteExemplo extends StatelessWidget {
  const TesteExemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.keyboard),
                child: Text('Formatters'),
              ),
              Tab(
                icon: Icon(Icons.keyboard),
                child: Text('Formatters With Form'),
              ),
              Tab(
                icon: Icon(Icons.calendar_today),
                child: Text('Datas'),
              ),
              Tab(
                icon: Icon(Icons.smart_display),
                child: Text('Padrões'),
              ),
            ],
          ),
          title: const Text('Brasil Fields'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            children: [
              ListView(
                children: [
                  RowFormatters(
                    label: 'CEP',
                    formatter: CepInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'CPF',
                    formatter: CpfInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'CNPJ',
                    formatter: CnpjInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'CPF/CNPJ',
                    formatter: CpfOuCnpjFormatter(),
                  ),
                  RowFormatters(
                    label: 'Telefone',
                    formatter: TelefoneInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'Data',
                    formatter: DataInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'Hora',
                    formatter: HoraInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'KM',
                    formatter: KmInputFormatter(),
                  ),
                  RowFormatters(label: 'Centavos', formatter: CentavosInputFormatter()),
                  RowFormatters(
                      label: 'Centavos + moeda',
                      formatter: CentavosInputFormatter(moeda: true)),
                  RowFormatters(
                      label: 'Centavos + 3 decimais',
                      formatter: CentavosInputFormatter(casasDecimais: 3)),
                  RowFormatters(
                      label: 'Centavos + 3 decimais + moeda',
                      formatter: CentavosInputFormatter(casasDecimais: 3, moeda: true)),
                  RowFormatters(label: 'Real', formatter: RealInputFormatter()),
                  RowFormatters(
                      label: 'Real + moeda', formatter: RealInputFormatter(moeda: true)),
                  RowFormatters(
                    label: 'Peso',
                    formatter: PesoInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'Altura',
                    formatter: AlturaInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'Cartão Bancário',
                    formatter: CartaoBancarioInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'Validade Cartão Bancário',
                    formatter: ValidadeCartaoInputFormatter(),
                  ),
                  TextField(
                    decoration: const InputDecoration(label: Text('Placa Veículo')),
                    inputFormatters: [PlacaVeiculoInputFormatter()],
                  ),
                  RowFormatters(
                    label: 'Temperatura',
                    formatter: TemperaturaInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'IOF',
                    formatter: IOFInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'NCM',
                    formatter: NCMInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'CEST',
                    formatter: CESTInputFormatter(),
                  ),
                  RowFormatters(
                    label: 'CNS',
                    formatter: CNSInputFormatter(),
                  ),
                ],
              ),
              Form(
                child: ListView(
                  children: [
                    RowFormattersWithForm(
                      label: 'CEP',
                      formatter: CepInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'CPF',
                      formatter: CpfInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'CNPJ',
                      formatter: CnpjInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'CPF/CNPJ',
                      formatter: CpfOuCnpjFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'Telefone',
                      formatter: TelefoneInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'Data',
                      formatter: DataInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'Hora',
                      formatter: HoraInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'KM',
                      formatter: KmInputFormatter(),
                    ),
                    RowFormattersWithForm(
                        label: 'Centavos', formatter: CentavosInputFormatter()),
                    RowFormattersWithForm(
                        label: 'Centavos + moeda',
                        formatter: CentavosInputFormatter(moeda: true)),
                    RowFormattersWithForm(
                        label: 'Centavos + 3 decimais',
                        formatter: CentavosInputFormatter(casasDecimais: 3)),
                    RowFormattersWithForm(
                        label: 'Centavos + 3 decimais + moeda',
                        formatter: CentavosInputFormatter(casasDecimais: 3, moeda: true)),
                    RowFormattersWithForm(label: 'Real', formatter: RealInputFormatter()),
                    RowFormattersWithForm(
                        label: 'Real + moeda',
                        formatter: RealInputFormatter(moeda: true)),
                    RowFormattersWithForm(
                      label: 'Peso',
                      formatter: PesoInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'Altura',
                      formatter: AlturaInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'Cartão Bancário',
                      formatter: CartaoBancarioInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'Validade Cartão Bancário',
                      formatter: ValidadeCartaoInputFormatter(),
                    ),
                    TextField(
                      decoration: const InputDecoration(label: Text('Placa Veículo')),
                      inputFormatters: [PlacaVeiculoInputFormatter()],
                    ),
                    RowFormattersWithForm(
                      label: 'Temperatura',
                      formatter: TemperaturaInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'IOF',
                      formatter: IOFInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'NCM',
                      formatter: NCMInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'CEST',
                      formatter: CESTInputFormatter(),
                    ),
                    RowFormattersWithForm(
                      label: 'CNS',
                      formatter: CNSInputFormatter(),
                    ),
                  ],
                ),
              ),
              const Text('Em breve'),
              const Text('Em breve'),
            ],
          ),
        ),
      ),
    );
  }
}

class RowFormatters extends StatelessWidget {
  final String label;
  final TextInputFormatter formatter;

  const RowFormatters({super.key, required this.label, required this.formatter});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(label)),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter,
      ],
    );
  }
}

class RowFormattersWithForm extends StatelessWidget {
  final String label;
  final TextInputFormatter formatter;

  const RowFormattersWithForm({super.key, required this.label, required this.formatter});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(label: Text(label)),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter,
      ],
    );
  }
}
