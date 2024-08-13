sealed class OnBoardingPageEvent {}

final class OnBoardingPageNextPageEvent extends OnBoardingPageEvent {}

final class OnBoardingPagePreviousPageEvent extends OnBoardingPageEvent {}

final class OnBoardingPageUpdatePageIndicator extends OnBoardingPageEvent {
  int index;

  OnBoardingPageUpdatePageIndicator({required this.index});
}

final class OnBoardingPageDotNavigationClickEvent extends OnBoardingPageEvent {
  int index;

  OnBoardingPageDotNavigationClickEvent({required this.index});
}
