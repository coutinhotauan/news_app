import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchNewsItem extends StatelessWidget {
  String? imageUrl;
  String? title;
  String? source;
  String? author;

  SearchNewsItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.source,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Image.network(
              imageUrl ?? '',
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorBuilder: (_, e, stack) {
                return Container(
                  color: Colors.grey.shade500,
                  child: const Center(
                    child: Text('error loading image'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Text(
              title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Source: ${source ?? ''}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text(
              "By: ${author ?? ''}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
