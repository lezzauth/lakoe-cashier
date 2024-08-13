import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/on_boarding/on_boarding_page_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/on_boarding/on_boarding_page_event.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/on_boarding/on_boarding_page_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnBoardingPageBloc(),
        child: BlocBuilder<OnBoardingPageBloc, OnBoardingPageState>(
          builder: (context, state) => Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    context.read<OnBoardingPageBloc>().add(
                          OnBoardingPageUpdatePageIndicator(index: value),
                        );
                  },
                  controller: state.pageController,
                  children: [
                    Container(
                      color: TColors.primary,
                    ),
                    Container(
                      color: TColors.error,
                    ),
                    Container(
                      color: TColors.primary,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 24.0,
                      ),
                      child: SmoothPageIndicator(
                        controller: state.pageController,
                        count: state.maxPage,
                        onDotClicked: (value) {
                          context.read<OnBoardingPageBloc>().add(
                                OnBoardingPageDotNavigationClickEvent(
                                  index: value,
                                ),
                              );
                        },
                        effect: const SlideEffect(
                          activeDotColor: TColors.primary,
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: TColors.neutralLightLight,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        "Mulailah dari sini...",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w900,
                          fontSize: TSizes.fontSizeHeading1,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 24.0),
                      child: const Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextField(),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            flex: 2,
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24.0,
                            width: 16.0,
                            child: Checkbox(value: true, onChanged: (value) {}),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: 'Saya telah membaca dan menyetujui ',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Syarat & Ketentuan',
                                    style: const TextStyle(
                                      color: TColors.primary,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle the Syarat & Ketentuan tap here
                                        print('Syarat & Ketentuan clicked');
                                        // For example, navigate to another page
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => SyaratKetentuanPage()));
                                      },
                                  ),
                                  const TextSpan(
                                    text: ' dan ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Kebijakan Privasi',
                                    style: const TextStyle(
                                      color: TColors.primary,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle the Kebijakan Privasi tap here
                                        print('Kebijakan Privasi clicked');
                                        // For example, navigate to another page
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => KebijakanPrivasiPage()));
                                      },
                                  ),
                                  const TextSpan(
                                    text: '.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Lanjutkan",
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
