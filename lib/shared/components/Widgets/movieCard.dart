import 'package:flutter/material.dart';
import 'package:imdb_test/shared/components/constants.dart';

import '../../styles/colors.dart';

class movieCard extends StatelessWidget {
  const movieCard({
    super.key, // يفضل إضافة super.key
    required this.movieimage,
    required this.movieName,
    required this.moviegenre,
    required this.movieYear,
    required this.movieRank, // 1. ضيفنا المتغير الجديد هنا
  });

  final String movieimage;
  final String movieName;
  final String moviegenre;
  final int movieYear;
  final int movieRank; // 1. وعرفناه هنا

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130, // ممكن تشيل الـ width ده لو الـ GridView مظبط العرض
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft, // بنحدد مكان العناصر الإضافية
            children: [
              // الطبقة الأساسية:
              // ... داخل الـ Stack في ملف movieCard.dart

// الطبقة الأساسية: الصورة
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  movieimage,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,

                  // 1️⃣ 👇👇 ده الجزء الجديد الخاص بحالة الخطأ 👇👇
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 190,
                      width: double.infinity,
                      color: AppColors.tretiaryColor, // لون خلفية رمادي فاتح
                       child: Image.asset(kLogo, fit: BoxFit.cover),
                    );
                  },

                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 190,
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                          color: AppColors.tretiaryColor, // نفس لون الترتيب
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  },
                ),
              ),


              // الطبقة التانية: الترتيب (فوق الصورة)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: const BoxDecoration(
                    color: AppColors.tretiaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    '#$movieRank',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            movieName, // شيلت علامة التعجب (!) لأننا معرفينها String مش String?
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center, // توسيط النص
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(moviegenre, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text('-', style: TextStyle(color: Colors.grey)),
              ),
              Text(movieYear.toString(), style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}