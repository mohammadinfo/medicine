import 'package:flutter/material.dart';
import 'package:medicine/main.dart';

ValueNotifier<double> textSizeValue = ValueNotifier(1.0);

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تنظیمات'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('سایز متن'),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: ValueListenableBuilder(
                      valueListenable: textSizeValue,
                      builder: (context, value, child) {
                        return Slider(
                          min: 0.5,
                          max: 2.0,
                          value: textSizeValue.value,
                          onChanged: (value) {
                            textSizeValue.value = value;
                            prefs.setDouble('textSizeValue', value);
                          },
                        );
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    textSizeValue.value = 1.0;
                    prefs.setDouble('textSizeValue', 1.0);
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
