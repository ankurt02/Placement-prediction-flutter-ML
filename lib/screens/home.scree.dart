// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cgpaController = TextEditingController();
  final TextEditingController _internshipsController = TextEditingController();
  final TextEditingController _projectsController = TextEditingController();
  final TextEditingController _aptitudeTestScoreController =
      TextEditingController();
  final TextEditingController _softSkillsRatingController =
      TextEditingController();
  final TextEditingController _extracurricularActivitiesController =
      TextEditingController();
  final TextEditingController _placementTrainingController =
      TextEditingController();
  final TextEditingController _sscMarksController = TextEditingController();
  final TextEditingController _hscMarksController = TextEditingController();
  String _prediction = '';

  Future<void> _predictPlacement() async {
    final url = Uri.parse('http://127.0.0.1:5000/predict');

    try {
      final payload = jsonEncode(<String, String>{
        'CGPA': _cgpaController.text,
        'Internships': _internshipsController.text,
        'Projects': _projectsController.text,
        'AptitudeTestScore': _aptitudeTestScoreController.text,
        'SoftSkillsRating': _softSkillsRatingController.text,
        'ExtracurricularActivities': _extracurricularActivitiesController.text,
        'PlacementTraining': _placementTrainingController.text,
        'SSC_Marks': _sscMarksController.text,
        'HSC_Marks': _hscMarksController.text,
      });

      print('Request payload: $payload'); // Debugging line

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: payload,
      );


      print('Response status: ${response.statusCode}'); // Debugging line
      print('Response body: ${response.body}'); // Debugging line

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        setState(() {
          _prediction = responseJson['placement'] == 1
              ? 'You have high chances of getting placed!!!'
              : 'You have low chances of getting placed.';
        });
      } else {
        setState(() {
          _prediction = 'Failed to load prediction';
        });
      }
    } catch (e) {
      setState(() {
        _prediction = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placement Prediction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _cgpaController,
                decoration: InputDecoration(
                  labelText: 'CGPA',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                          color: const Color.fromRGBO(156, 39, 176, 1),
                          width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                ),
                keyboardType: TextInputType.number,
              ),
              Gap(10),
              TextFormField(
                controller: _internshipsController,
                decoration: InputDecoration(
                  labelText: 'Internships',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                ),
                keyboardType: TextInputType.number,
              ),
              Gap(10),
              TextFormField(
                controller: _projectsController,
                decoration: InputDecoration(
                  hintText: 'Projects',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                ),
                keyboardType: TextInputType.number,
              ),
              Gap(10),
              TextFormField(
                controller: _aptitudeTestScoreController,
                decoration: InputDecoration(
                  labelText: 'Aptitude Test Score',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                ),
                keyboardType: TextInputType.number,
              ),
              Gap(10),
              TextFormField(
                controller: _softSkillsRatingController,
                decoration: InputDecoration(
                  labelText: 'Soft Skills Rating',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                ),
                keyboardType: TextInputType.number,
              ),
              Gap(10),
              TextFormField(
                controller: _extracurricularActivitiesController,
                decoration: InputDecoration(
                  labelText: 'Extracurricular Activities',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                ),
                keyboardType: TextInputType.number,
              ),
              Gap(10),
              TextFormField(
                controller: _placementTrainingController,
                decoration: InputDecoration(
                  labelText: 'Placement Training',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                ),
                keyboardType: TextInputType.number,
              ),
              Gap(10),
              TextFormField(
                controller: _sscMarksController,
                decoration: InputDecoration(
                  labelText: 'SSC Marks',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                ),
                keyboardType: TextInputType.number,
              ),
              Gap(10),
              TextFormField(
                controller: _hscMarksController,
                decoration: InputDecoration(
                  labelText: 'HSC Marks',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                ),
                keyboardType: TextInputType.number,
              ),
              Gap(16),
              Gap(20),
              OutlinedButton(
                onPressed: _predictPlacement,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 66, 155, 245),
                  side: BorderSide(width: 2.0, color: Colors.blue.shade200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Predict Placement',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
              Gap(12),
              Text(
                _prediction,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
