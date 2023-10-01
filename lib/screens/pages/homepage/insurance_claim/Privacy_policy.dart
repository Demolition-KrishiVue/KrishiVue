import 'package:flutter/material.dart';

class PrivacyPolicyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Privacy Policy',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PrivacyPolicyScreen(),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Compensation Calculation:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'D0 doesn\'t give any compensation',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'D1 gives 0.5 times the premium',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'D2 gives 1 times the premium',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'D3 gives 2 times the premium',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'D4 gives 2.5 times the premium',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Compensation Calculation Trigger:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Compensation calculation is triggered by keepers offchain. Keepers are paid 0.01 ETH each time a compensation is calculated.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Insurance Company Requirements:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Insurance company has to stake enough ETH for every agricultural cycle in order to ensure that there will be always enough balance to compensate farmers in case there are drought. If there are not enough ETH staked in the contract then onboarding of new farmers are refused.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
