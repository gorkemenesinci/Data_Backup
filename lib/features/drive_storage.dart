import 'package:flutter/material.dart';
import 'package:google_drive_storage/features/screens/backup_view.dart';
import 'package:google_drive_storage/features/screens/drive_backup.dart';

class DriveStorage extends StatefulWidget {
  const DriveStorage({super.key});

  @override
  State<DriveStorage> createState() => _DriveStorageState();
}

class _DriveStorageState extends State<DriveStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DriveBackup()));
                },
                child: const Text("Drive Backup")),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BackupView()));
                },
                child: const Text("Backup View"))
          ],
        ),
      ),
    );
  }
}
