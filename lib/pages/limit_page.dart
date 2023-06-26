import 'package:flutter/material.dart';
import 'package:rnd_flutter_app/routes/app_routes.dart';

class LimitPage extends StatelessWidget {
  const LimitPage({Key? key}) : super(key: key);

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
          title: const Text('Tcash Limit'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Monthly Transaction Limits:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Monthly Send Money Limit:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '100,000',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Monthly Cash Out Limit:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '100,000',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Payment:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Unlimited',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Add Money:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Unlimited',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Transaction Charges:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Table(
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Transaction Type',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Charge Fee',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
                          child: Text(
                            'Send Money',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '5 taka per thousand',
                            style: TextStyle(fontSize: 16, color: Colors.black),
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
                          child: Text(
                            'Cash Out',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '9.99 taka per thousand',
                            style: TextStyle(fontSize: 16, color: Colors.black),
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
                          child: Text(
                            'Payment',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'No charge',
                            style: TextStyle(fontSize: 16, color: Colors.black),
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
                          child: Text(
                            'Pay Bill',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'No charge',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Annual Transaction Limit:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Annual Send Money Limit:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '1200,000',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Annual Cash Out Limit:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '1200,000',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Payment:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Unlimited',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Add Money:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Unlimited',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Referral Bonus:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Per Refer: 50 taka bonus',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )));
  }
}
