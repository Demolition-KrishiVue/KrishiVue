import 'package:elearning/screens/pages/homepage/home_page.dart';
import 'package:flutter/material.dart';

class CropInsuranceCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CropInsuranceCalculator(),
    );
  }
}

class CropInsuranceCalculator extends StatefulWidget {
  @override
  _CropInsuranceCalculatorState createState() =>
      _CropInsuranceCalculatorState();
}

class _CropInsuranceCalculatorState extends State<CropInsuranceCalculator> {
  final _landController = TextEditingController();
  final _cropController = TextEditingController();
  final _seasonController = TextEditingController();

  double insuranceAmount = 0.0;

  @override
  void dispose() {
    _seasonController.dispose();
    _cropController.dispose();
    _landController.dispose();
    super.dispose();
  }

  void calculateInsurance() {
    double landArea = double.tryParse(_landController.text) ?? 0.0;
    double cropValue = double.tryParse(_cropController.text) ?? 0.0;
    double insuranceMultiplier = 0.75;
    // double seasonMultiplier = double.tryParse(_seasonController.text) ?? 1.0;

    setState(() {
      insuranceAmount = landArea * cropValue * insuranceMultiplier;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Insurance Calculator'),
        backgroundColor: Colors.green[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    controller: _landController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Land Area (acres)',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    controller: _cropController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Crop Value (per acre)',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    controller: _seasonController,
                    decoration: InputDecoration(
                      hintText: 'Insurance For',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: calculateInsurance,
              child: Text(
                'Calculate Insurance',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary:
                    Colors.green[900], // Set the button color to green[900]
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Insurance Amount: \$${insuranceAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
