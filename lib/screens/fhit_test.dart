


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fhir/r4.dart' as fhir;

// class FHIRScreen extends StatefulWidget {
//   @override
//   _FHIRScreenState createState() => _FHIRScreenState();
// }

// class _FHIRScreenState extends State<FHIRScreen> {
//   List<fhir.Patient> _patients = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchPatients();
//   }

//   Future<void> _fetchPatients() async {
//     final response = await http.get(
//       Uri.parse('https://your-fhir-server.com/fhir/Patient'),
//       headers: {
//         'Authorization': 'Basic ${base64Encode(utf8.encode('username:password'))}',
//       },
//     );
//     if (response.statusCode == 200) {
//       final patients = fhir.Patient.listFromJson(response.body);
//       setState(() {
//         _patients = patients;
//       });
//     } else {
//       throw Exception('Failed to load patients');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('FHIR Screen')),
//       body: _patients.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _patients.length,
//               itemBuilder: (context, index) {
//                 final patient = _patients[index];
//                 return ListTile(
//                   title: Text(patient.name.first.given.first),
//                   subtitle: Text(patient.gender),
//                 );
//               },
//             ),
//     );
//   }
// }