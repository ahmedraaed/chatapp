abstract class NewsState{}

class NewsInitState extends NewsState{}

class NavigationButtomBarState extends NewsState{}


class NewsLoadingState extends NewsState{}
class NewsGetBisnussState extends NewsState{}
class NewsErorrState extends NewsState{
  final String Erorr;
  NewsErorrState(this.Erorr);
}


class LoadingSportsState extends NewsState{}
class GetSportsState extends NewsState{}
class ErorrSportsState extends NewsState{
  final String Erorr;
  ErorrSportsState(this.Erorr);
}


class LoadingScienceState extends NewsState{}
class GetScienceState extends NewsState{}
class ErorrScienceState extends NewsState{
  final String Erorr;
  ErorrScienceState(this.Erorr);
}


class LoadingSearchState extends NewsState{}
class GetSearchState extends NewsState{}
class ErorrSearchState extends NewsState{
  final String Erorr;
  ErorrSearchState(this.Erorr);
}
