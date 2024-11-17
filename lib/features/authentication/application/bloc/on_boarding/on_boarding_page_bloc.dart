import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/authentication/application/bloc/on_boarding/on_boarding_page_event.dart';
import 'package:lakoe_pos/features/authentication/application/bloc/on_boarding/on_boarding_page_state.dart';

class OnBoardingPageBloc
    extends Bloc<OnBoardingPageEvent, OnBoardingPageState> {
  OnBoardingPageBloc() : super(OnBoardingPageState(pageIndex: 0)) {
    on<OnBoardingPageNextPageEvent>((event, emit) {
      final int nextPageIndex = state.pageIndex + 1;
      if (nextPageIndex > state.maxPage) return;
      state.pageController.jumpToPage(nextPageIndex);
      return emit(OnBoardingPageState(pageIndex: nextPageIndex));
    });

    on<OnBoardingPagePreviousPageEvent>((event, emit) {
      final int previousPageIndex = state.pageIndex - 1;
      if (previousPageIndex < 0) return;
      state.pageController.jumpToPage(previousPageIndex);
      return emit(OnBoardingPageState(pageIndex: previousPageIndex));
    });

    on<OnBoardingPageUpdatePageIndicator>((event, emit) {
      state.pageController.jumpToPage(event.index);
      return emit(OnBoardingPageState(pageIndex: event.index));
    });

    on<OnBoardingPageDotNavigationClickEvent>((event, emit) {
      state.pageController.jumpToPage(event.index);
    });
  }
}
