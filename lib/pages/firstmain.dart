import 'package:flutter/material.dart';
import 'package:lab2/pages/twomain.dart';

final _formKey = GlobalKey<FormState>();
String _name = '';
String _username = '';
String _password = '';
double _weight = 60;
double _height = 170;

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/1.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกชื่อของคุณ';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกชื่อผู้ใช้งานของคุณ';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกรหัสผ่านของคุณ';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    'น้ำหนัก: ${_weight.round()} กิโลกรัม',
                    style: TextStyle(fontSize: 16),
                  ),
                  Slider(
                    value: _weight,
                    min: 30,
                    max: 150,
                    divisions: 120,
                    label: _weight.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _weight = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    'ส่วนสูง: ${_height.round()} เซนติเมตร',
                    style: TextStyle(fontSize: 16),
                  ),
                  Slider(
                    value: _height,
                    min: 100,
                    max: 250,
                    divisions: 150,
                    label: _height.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TwomainPage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'ถัดไป',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
