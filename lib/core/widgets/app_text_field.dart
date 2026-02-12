import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController? controller;

  // 커스텀을 위한 추가 파라미터들
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? height; // 높이도 가끔 바꿀 수 있게 추가

  const AppTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.controller,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.borderColor,
    this.focusedBorderColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // 보내준 코드의 기본값 40 유지, 필요시 변경 가능
      height: height ?? 40, 
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.center,
        // 입력 글자 스타일: 기본 16, Regular, Black0
        style: AppTextStyles.ptdRegular(fontSize ?? 16).copyWith(
          color: AppColors.black0,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: hint,
          // 힌트 스타일: 기본 16, Regular, Grey0
          hintStyle: AppTextStyles.ptdRegular(fontSize ?? 16).copyWith(
            color: AppColors.grey0,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          
          // 기본 테두리: 기본 Radius 4, Grey0
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.grey0, 
              width: 1,
            ),
          ),
          // 포커스 테두리: 기본 Primary, 두께 1
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            borderSide: BorderSide(
              color: focusedBorderColor ?? AppColors.primary, 
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}