import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 키보드가 올라올 때 화면이 잘리지 않도록 SafeArea와 스크롤뷰 사용
      body: SafeArea(
        child: Center(
            // 1. 화면 전체의 중앙을 잡기 위해 Center 추가
            child: SingleChildScrollView(
          child: SizedBox(
            // 2. 여기서 딱 한 번만 정의합니다!
            width: MediaQuery.of(context).size.width * 0.63,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. 로고 섹션 (아까 넣은 로고 파일 사용)
                Center(
                  child: Image.asset(
                    'assets/images/logo.png', // 파일명이 다르면 수정하세요!
                  ),
                ),

                const SizedBox(height: 28),

                // 2. 타이틀 섹션
                Text(
                  '또 사기 전에',
                  style: AppTextStyles.ptdMedium(24),
                ),
                Transform.translate(
                  offset: const Offset(0, -5), // 👈 '또바바'를 위로 8픽셀 강제 이동!
                  child: Text(
                    '또바바',
                    style: AppTextStyles.ptdExtraBold(40),
                  ),
                ),

                const SizedBox(height: 30),

                // 3. 입력 필드 (아이디)
                _buildTextField(
                  label: '아이디',
                  hint: '아이디를 입력해주세요',
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                // 4. 입력 필드 (비밀번호)
                _buildTextField(
                  label: '비밀번호',
                  hint: '비밀번호를 입력해주세요',
                  obscureText: true,
                ),

                const SizedBox(height: 12),

                // 5. 로그인 버튼
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary, // #FFC63D
                      foregroundColor: AppColors.white0,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      // 로그인 성공했다고 가정하고 홈으로 이동!
                      //context.go('/home'); // 아까 설정한 GoRouter 경로
                    },
                    child: Text('시작하기', style: AppTextStyles.ptdBold(12)),
                  ),
                ),

                const SizedBox(height: 35),

                // 5. 하단 회원가입 유도 섹션 (스크린샷 부분)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '아직 회원이 아닌가요? ',
                      style: AppTextStyles.ptdRegular(12)
                          .copyWith(color: AppColors.grey0),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push('/signup'); // 나중에 연결하세요!
                      },
                      child: Text(
                        '회원가입',
                        style: AppTextStyles.ptdRegular(12).copyWith(
                          color: AppColors.black0,
                          decoration: TextDecoration.underline, // 밑줄 쫙!
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 100),

              ],
            ),
          ),
        )),
      ),
    );
  }

  // 입력창 위젯 (중복 코드를 줄이기 위해 메서드로 분리)
  Widget _buildTextField({
    required String label,
    required String hint,
    required bool obscureText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTextStyles.ptdBold(12).copyWith(color: AppColors.black0)),
        const SizedBox(height: 5),

        // 1. SizedBox로 높이를 40으로 강제 고정합니다.
        SizedBox(
          height: 40,
          child: TextField(
            obscureText: obscureText,
            // 2. 글자를 수직 중앙에 오게 만듭니다.
            textAlignVertical: TextAlignVertical.center,
            style:
                AppTextStyles.ptdRegular(12).copyWith(color: AppColors.grey0),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  AppTextStyles.ptdRegular(12).copyWith(color: AppColors.grey0),

              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

              isDense: true, // 4. 내부 여백을 더 타이트하게 잡아주는 옵션입니다.

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.grey0, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.grey0, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
