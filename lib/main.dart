import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.poppins(),
        ),
        textTheme: TextTheme(
          bodyText2: GoogleFonts.poppins(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const PermissionApp(),
    ),
  );
}

class PermissionApp extends StatefulWidget {
  const PermissionApp({Key? key}) : super(key: key);

  @override
  State<PermissionApp> createState() => _PermissionAppState();
}

class _PermissionAppState extends State<PermissionApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permission App", style: TextStyle(color: Colors.black, fontSize: 18),),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoButton.filled(
              child: const Text("Camera Permission"),
              onPressed: () async {
               await Permission.camera.request();
              },
            ),
            CupertinoButton.filled(
              child: const Text("Storage Permission"),
              onPressed: () async {
               await Permission.storage.request();
              },
            ),
            CupertinoButton.filled(
              child: const Text("Location Permission"),
              onPressed: () async {
                await Permission.location.request();
              },
            ),
            CupertinoButton.filled(
              child: const Text("Photos Permission"),
              onPressed: () async {
                await Permission.photos.request();
              },
            ),
            CupertinoButton.filled(
              child: const Text("Contacts Permission"),
              onPressed: () async {
                await Permission.contacts.request();
              },
            ),
            CupertinoButton.filled(
              child: const Text("SMS Permission"),
              onPressed: () async {
                await Permission.sms.request();
              },
            ),
            CupertinoButton.filled(
              child: const Text("Phone Permission"),
              onPressed: () async {
                await Permission.phone.request();
              },
            ),
            CupertinoButton.filled(
              child: const Text("Calendar Permission"),
              onPressed: () async {
                await Permission.calendar.request();
              },
            ),
            CupertinoButton.filled(
              child: const Text("All Permission"),
              onPressed: () async {
                Map<Permission, PermissionStatus> status = await [
                  Permission.location,
                  Permission.storage,
                  Permission.phone,
                  Permission.camera,
                  Permission.audio,
                  Permission.bluetooth,
                  Permission.calendar,
                  Permission.contacts,
                  Permission.videos,
                  Permission.speech,
                  Permission.sms,
                  Permission.photos,
                  Permission.notification
                ].request();
                if(status[0]!.isGranted || status[1]!.isGranted || status[2]!.isGranted || status[3]!.isGranted || status[4]!.isGranted
                    || status[5]!.isGranted || status[6]!.isGranted || status[7]!.isGranted || status[8]!.isGranted || status[9]!.isGranted
                    || status[10]!.isGranted || status[11]!.isGranted || status[12]!.isGranted) {
                  print("Multiple Permission is Succesfully Done.....");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
