import 'package:flutter/material.dart';
import 'package:rnd_flutter_app/routes/app_routes.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          },
        ),
        title: const Text('Tcash support'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Fees:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Table(
                  defaultColumnWidth: const FlexColumnWidth(2.0),
                  columnWidths: const {
                    1: FlexColumnWidth(3.0),
                  },
                  children: const [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Transaction Type',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Fee Structure',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Send Money'),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('5 taka for amount greater than 1000'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Cash Out'),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('9.99 taka per thousand'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Payment'),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('No Fee'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Pay Bill'),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('No Fee'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Contact Information:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Phone: +1 123-456-7890',
              ),
              const Text(
                'Email: support@tcash.com',
              ),
              const SizedBox(height: 16),
              const Text(
                'For more information, please contact our support team.',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
