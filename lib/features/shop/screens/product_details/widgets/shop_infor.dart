import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ShopInfoWidget extends StatelessWidget {
  final String shopName;
  final String location;
  final String onlineStatus;
  final int productCount;
  final double rating;
  final int responseRate;

  const ShopInfoWidget({
    Key? key,
    required this.shopName,
    required this.location,
    required this.onlineStatus,
    required this.productCount,
    required this.rating,
    required this.responseRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Shop Avatar
              CircleAvatar(
                radius: 24,
                backgroundColor: TColors.colorApp,
                child: const Text(
                  "T",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),

              // Shop Information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shopName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      onlineStatus,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Row(
                      children: [
                        Icon(Iconsax.location, size: 17,),
                        SizedBox(width: TSizes.sm - 5,),
                        Text(
                          location,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  minimumSize: Size(100, 36),
                  side: BorderSide(
                    color: TColors.error
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Adjust this value for a moderate round corner
                  ),
                ),
                child: Text(
                  'Xem Shop',
                  style: TextStyle(fontSize: 14,color: TColors.error),
                ),
              ),

            ],
          ),
          const SizedBox(height: 12),

          // Product count, rating, and response rate
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$productCount Sản phẩm",
                style: TextStyle(color: TColors.colorApp),
              ),
              Text(
                "$rating Đánh giá",
                style: TextStyle(color: Colors.grey[800], fontSize: 14),
              ),
              Text(
                "$responseRate% Phản hồi Chat",
                style: TextStyle(color: Colors.grey[800], fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}