import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TwomainPage(),
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        hintColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class TwomainPage extends StatefulWidget {
  @override
  State<TwomainPage> createState() => _TwomainPageState();
}

class _TwomainPageState extends State<TwomainPage> {
  String? _selectedMajor;
  String? _selectedLanguage;
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Major',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedMajor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select Major',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'Computer Science',
                    child: Text('Computer Science'),
                  ),
                  DropdownMenuItem(
                    value: 'Information Technology',
                    child: Text('Information Technology'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedMajor = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Language',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Column(
                children: <Widget>[
                  RadioListTile<String>(
                    title: Text('Thai'),
                    value: 'Thai',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('English'),
                    value: 'English',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Chinese'),
                    value: 'Chinese',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _agreedToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreedToTerms = value ?? false;
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Agree to Terms and Conditions',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _agreedToTerms
                      ? () {
                          // Implement your registration logic here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Registration successful')),
                          );
                        }
                      : null,
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
