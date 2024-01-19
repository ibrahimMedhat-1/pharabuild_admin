import 'package:flutter/material.dart';

import '../../../../../../models/review_model.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel reviewModel;
  const ReviewItem({
    super.key,
    required this.reviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              reviewModel.description!,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          )),
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width - 40,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ]),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${reviewModel.name}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    reviewModel.description!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              minRadius: 30,
              backgroundImage: NetworkImage(reviewModel.profileImage ?? ''),
            )
          ],
        ),
      ),
    );
  }
}
