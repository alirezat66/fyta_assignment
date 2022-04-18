import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyta_assignment/data/extension/double_extension.dart';
import 'package:fyta_assignment/view/pages/result_page/widgets/detail_dialog.dart';

class ResultItemWidget extends StatelessWidget {
  final File imageFile;
  final String name;
  final String nameAuthorship;
  final double rate;
  const ResultItemWidget(
      {Key? key,
      required this.imageFile,
      required this.name,
      required this.nameAuthorship,
      required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return DetailDialog(file: imageFile, name: name);
            });
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  child: Image.file(
                    imageFile,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Theme.of(context).colorScheme.onSurface),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        nameAuthorship,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color:  Theme.of(context).colorScheme.onSurface),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.primary,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                          child: Text(
                        rate.percentage,
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
