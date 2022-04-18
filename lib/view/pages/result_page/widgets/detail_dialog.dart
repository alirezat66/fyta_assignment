import 'dart:io';

import 'package:flutter/material.dart';

class DetailDialog extends StatelessWidget {
  final File file;
  final String name;
  const DetailDialog({Key? key, required this.file, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        insetPadding: const EdgeInsets.all(16),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: Image.file(
                      file,
                      fit: BoxFit.fitHeight,
                    ),
                  ))
            ],
          ),
        ));
  }
}
