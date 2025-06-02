import 'package:coach/art_core/art_core.dart';
import 'package:coach/core/routes/app_pages.dart';
import 'package:get/get.dart';

class CoachItem extends StatelessWidget {
  final String name;

  final double rate;

  final String imageUrl;

  final String description;

  const CoachItem({
    super.key,
    required this.name,
    required this.rate,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.COACH_DETAILS),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: name,
                      fontSize: 14,
                    ),
                    CustomRatingBar(
                      rating: rate,
                      ignoreGestures: true,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            AppText(
              text: description,
              fontSize: 14,
              maxLines: 3,
              fontWeight: FontWeight.w300,
              color: AppColors.textSecondary,
            ),
          ],
        ).marginAll(12),
      ),
    );
  }
}
