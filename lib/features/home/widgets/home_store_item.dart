import 'package:coach/art_core/art_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeStoreItem extends StatelessWidget {
  final bool isFavorite;
  final String imageUrl;
  final String name;
  final String price;
  final String offerPrice;

  const HomeStoreItem({
    super.key,
    required this.isFavorite,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.offerPrice,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.topRight,
              child: SvgPicture.asset("assets/icons/favorite_outlined.svg"),
            ),
            AppText(
              text: name,
              fontSize: 14,
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: offerPrice,
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
                AppText(
                  text: price,
                  fontSize: 12,
                  textDecoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ).marginSymmetric(vertical: 4.h),
            AppButton(
              height: 30.h,
              enableBorder: true,
              color: AppColors.white,
              textColor: AppColors.primaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 14,
              title: "add_to_cart".tr,
              onTap: () {},
            )
          ],
        ).marginSymmetric(horizontal: 8),
      ),
    );
  }
}
