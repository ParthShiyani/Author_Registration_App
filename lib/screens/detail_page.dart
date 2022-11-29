import 'dart:convert';
import 'package:author_registration_app/components/screenshot_capture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              await CaptureScreenShort(res: res);
            },
            icon: const Icon(Icons.share_rounded),
          ),
          IconButton(
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(
                  text: "Author : ${res["author"]}\nBook : ${res["book"]}",
                ),
              ).then(
                (value) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.grey.shade700,
                    content: const Text(
                      "Copied Successfully..",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.content_copy_rounded),
          ),
        ],
      ),
      body: Ink(
        decoration: BoxDecoration(
          color: Colors.teal.shade100,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: MemoryImage(
                        base64Decode(res["image"]),
                      ),
                    ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
