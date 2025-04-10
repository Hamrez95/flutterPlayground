import 'package:flutter/material.dart';

/// کلاس محاسبه اندازه پوزیشن
class PositionSizeCalculator {
  static double calculate({
    required double capital,
    required double risk,
    required double leverage,
    required double stopLoss,
  }) {
    if (leverage > 0 && stopLoss > 0) {
      return (capital * (risk / 100)) / (leverage * (stopLoss / 100));
    }
    return 0.0;
  }
}

/// صفحه اصلی برای محاسبه
class PositionCalculatorPage extends StatefulWidget {
  @override
  _PositionCalculatorPageState createState() =>
      _PositionCalculatorPageState();
}

class _PositionCalculatorPageState extends State<PositionCalculatorPage> {
  final TextEditingController _capitalController = TextEditingController();
  final TextEditingController _riskController = TextEditingController();
  final TextEditingController _leverageController = TextEditingController();
  final TextEditingController _stopLossController = TextEditingController();

  double _positionSize = 0.0;
  double _capital = 0.0;

  void _calculatePositionSize() {
    double capital = double.tryParse(_capitalController.text) ?? 0;
    double risk = double.tryParse(_riskController.text) ?? 0;
    double leverage = double.tryParse(_leverageController.text) ?? 1;
    double stopLoss = double.tryParse(_stopLossController.text) ?? 0;

    setState(() {
      _capital = capital;
      _positionSize = PositionSizeCalculator.calculate(
        capital: capital,
        risk: risk,
        leverage: leverage,
        stopLoss: stopLoss,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C54),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C54),
        elevation: 0,
        title: const Text(
          'Position Size Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Monthly Payment',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: _capital > 0 ? _positionSize / _capital : 0.0, // مقدار دایره بر اساس capital
                    backgroundColor: Colors.grey.shade800,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        const Color(0xFF6C63FF)),
                    strokeWidth: 12,
                  ),
                ),
                Text(
                  '\$${_positionSize.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(_capitalController, 'Capital'),
                    _buildTextField(_riskController, 'Risk Percentage'),
                    _buildTextField(_leverageController, 'Leverage'),
                    _buildTextField(_stopLossController, 'Stop Loss Percentage'),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _calculatePositionSize,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2C2C54),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Recalculate',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

/// متد اصلی برای اجرا
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PositionCalculatorPage(),
  ));
}