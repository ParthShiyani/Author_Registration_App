import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';

ScreenshotController screenshotController = ScreenshotController();

CaptureScreenShort({required var res}) async {
  Uint8List image = base64Decode(res["image"]);
  await screenshotController
      .captureFromWidget(
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.memory(
                image,
                height: 300,
              ),
            ),
          ),
          const Spacer(),
          const Divider(color: Colors.black),
          const Text(
            "Author :",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "${res["author"]}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Divider(color: Colors.black),
          const Text(
            "Book :",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "${res["book"]}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Divider(color: Colors.black),
        ],
      ),
    ),
  )
      .then(
    (Uint8List? image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);
        await Share.shareFiles([imagePath.path]);
      }
    },
  );
}
