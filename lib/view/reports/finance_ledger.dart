import 'package:flutter/material.dart';

class FinanceLedger extends StatefulWidget {
  const FinanceLedger({super.key});

  @override
  State<FinanceLedger> createState() => _FinanceLedgerState();
}

class _FinanceLedgerState extends State<FinanceLedger> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          title: Text(
            'Ledger (July, 23)',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 60,
                      width: 100,
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(237, 249, 243, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Misc.'),
                          Text(
                            '+₹1,000',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 60,
                      width: 100,
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(254, 239, 238, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Con.'),
                          Text(
                            '-₹1,000',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 60,
                      width: 100,
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 249, 238, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Write off'),
                          Text(
                            '-₹1,000',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: FittedBox(
                  child: DataTable(
                      headingRowColor: MaterialStateProperty.all(
                          const Color.fromRGBO(234, 239, 248, 1)),
                      headingTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      dividerThickness: 2,

                      columns: const [
                        DataColumn(
                          label: Text('DATE'),
                        ),
                        DataColumn(
                          label: Text('TYPE'),
                        ),
                        DataColumn(
                          label: Text('TRAINEE'),
                        ),
                        DataColumn(
                          label: Text('AMOUNT'),
                        ),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('07, July')),
                          DataCell(Text('Con.')),
                          DataCell(Text('Raj Verma')),
                          DataCell(Text('-₹500', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('07, July')),
                          DataCell(Text('Con.')),
                          DataCell(Text('Abhishek Mishra')),
                          DataCell(Text('-₹500',style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('07, July')),
                          DataCell(Text('Misc.')),
                          DataCell(Text('Raj Verma')),
                          DataCell(Text('+₹1000',style: TextStyle(color: Color.fromRGBO(71, 192, 136, 1)),)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('07, July')),
                          DataCell(Text('Write off')),
                          DataCell(Text('Santanu Sharma')),
                          DataCell(Text('-₹1000', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),)),
                        ]),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
