import 'package:flutter/material.dart';

class AnimatedSuccessIcon extends StatefulWidget {
  const AnimatedSuccessIcon({super.key});

  @override
  State<AnimatedSuccessIcon> createState() => _AnimatedSuccessIconState();
}

class _AnimatedSuccessIconState extends State<AnimatedSuccessIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _outerRingAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700), // مدة ظهور الدائرة الخارجية
    );

    // تعريف الحركة: ستبدأ قيمة الحركة من 0.0 (لا يوجد حدود) وتصل إلى 1.0 (الحدود الكاملة)
    _outerRingAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastEaseInToSlowEaseOut,
      ), // منحنى حركة ناعم
    );

    // بدء الحركة بعد تأخير قصير عند فتح الشاشة
    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward(); // تشغيل الحركة للأمام
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // التخلص من الـ controller عند إغلاق الـ widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // تحديد أحجام الدوائر
    const double innerCircleSize = 120.0; // حجم الدائرة الخضراء الداخلية
    const double outerRingMaxThickness =
        25.0; // أقصى سمك للدائرة الخارجية (الظل)

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ✅ الإطار الخارجي الغامق (ثابت)
          Container(
            width: innerCircleSize + outerRingMaxThickness * 2 + 6, // نضيف 6 علشان يكون أوسع من الأخضر الفاتح
            height: innerCircleSize + outerRingMaxThickness * 2 + 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:  Colors.green.shade400, // أخضر غامق
                width: 2, // سمك رفيع
              ),
            ),
          ),

          // ✅ الدائرة الخارجية الفاتحة (متحركة)
          AnimatedBuilder(
            animation: _outerRingAnimation,
            builder: (context, child) {
              final double currentOuterSize =
                  innerCircleSize + (outerRingMaxThickness * 2 * _outerRingAnimation.value);
              final double currentBorderWidth =
                  outerRingMaxThickness * _outerRingAnimation.value;

              return Container(
                width: currentOuterSize,
                height: currentOuterSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green.shade100, // أخضر فاتح جداً
                    width: currentBorderWidth,
                  ),
                ),
              );
            },
          ),

          // ✅ الدائرة الداخلية الأساسية
          Container(
            width: innerCircleSize,
            height: innerCircleSize,
            decoration: const BoxDecoration(
              color: Color(0xFF4CAF50), // الأخضر الأساسي
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 60,
            ),
          ),
        ],
      ),
    );
  }
}
