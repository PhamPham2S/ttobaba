import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/app_button.dart';

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

                Align(
                  alignment: Alignment.centerLeft, // 👈 왼쪽 중앙 정렬
                  child: Text(
                    '아이디',
                    style: AppTextStyles.ptdBold(12)
                        .copyWith(color: AppColors.black0),
                  ),
                ),

                const SizedBox(height: 8),

                // 3. 입력 필드 (아이디)
                const AppTextField(hint: '아이디를 입력해주세요', fontSize: 12),

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerLeft, // 👈 왼쪽 중앙 정렬
                  child: Text(
                    '비밀번호',
                    style: AppTextStyles.ptdBold(12)
                        .copyWith(color: AppColors.black0),
                  ),
                ),

                const SizedBox(height: 8),

                // 4. 입력 필드 (비밀번호)
                const AppTextField(hint: '비밀번호를 입력해주세요', fontSize: 12),

                const SizedBox(height: 12),

                AppButton(
                  text: '시작하기',
                  onPressed: () {
                      // 로그인 성공했다고 가정하고 홈으로 이동!
                      //context.go('/home'); // 아까 설정한 GoRouter 경로
                  }, 
                  borderRadius: 4,
                  height: 40,
                  textStyle: AppTextStyles.ptdBold(12),
                ),
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
}
