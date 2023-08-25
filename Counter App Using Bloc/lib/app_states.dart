class AppStates{
  int counter;
  AppStates({required this.counter});

}

class InitialStates extends AppStates{
  InitialStates():super(counter: 0);
}