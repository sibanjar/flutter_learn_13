import 'package:flutter/material.dart';
import 'package:flutter_learn_13/oss_licenses.dart';

class PackageDetailsPage extends StatelessWidget {
  final List<Package> packages = ossLicenses;

  const PackageDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package Details'),
      ),
      body:ListView.builder(
    itemCount: packages.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${packages[index].name}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Description: ${packages[index].description}'),
                const SizedBox(height: 8),
                Text('Version: ${packages[index].version}'),
                const SizedBox(height: 8),
                Text('License: ${packages[index].license ?? "Not specified"}'),
                const SizedBox(height: 8),
                Text('Authors: ${packages[index].authors.join(", ")}'),
                const SizedBox(height: 8),
                Text('Homepage: ${packages[index].homepage ?? "Not specified"}'),
                const SizedBox(height: 8),
                Text('Repository: ${packages[index].repository ?? "Not specified"}'),
                const SizedBox(height: 8),
                Text('Is SDK: ${packages[index].isSdk ? "Yes" : "No"}'),
                const SizedBox(height: 8),
                Text('Is Direct Dependency: ${packages[index].isDirectDependency ? "Yes" : "No"}'),
              ],
            ),
          ),
        ),
      );

    }
    ),
    );
  }
}
