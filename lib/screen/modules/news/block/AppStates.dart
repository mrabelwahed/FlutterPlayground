abstract class AppStates {}

class InitialState extends AppStates {}

class ChangeCurrentIndex extends AppStates {}

class WebViewLoading extends AppStates {}

class BusinessNewsLoading extends AppStates {}

class BusinessNewsSuccess extends AppStates {}

class DarkThemeState extends AppStates {}

class BusinessNewsError extends AppStates {
  final String error;
  BusinessNewsError(this.error);
}

class SportsNewsLoading extends AppStates {}

class SportsNewsSuccess extends AppStates {}

class SportsNewsError extends AppStates {
  final String error;
  SportsNewsError(this.error);
}

class ScienceNewsLoading extends AppStates {}

class ScienceNewsSuccess extends AppStates {}

class ScienceNewsError extends AppStates {
  final String error;
  ScienceNewsError(this.error);
}