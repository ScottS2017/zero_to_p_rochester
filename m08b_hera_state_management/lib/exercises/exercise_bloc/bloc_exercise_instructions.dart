/// 1)
/// Create an enum called ChangeColorEvent
/// Instantiate it with the values makeGrey and makePurple

/// 2)
/// Create a ColorBloc class that extends Bloc, using two <types> (ColorChangeEvent and Color)
/// Override the initialState getter to return a Color, and have it return purple
/// Override the mapEventToState async function.
/// Return a Stream that here will be of type Color.
/// Pass it a ChangeColorEvent parameter (from our above Enum) called event.
/// Use async* instead of the usual async here, this allows us to use the yield keyword.
/// When it comes time to return a value X, use yield X instead of returning X
/// Inside the function, create a 2 case switch that returns makeGrey or makePurple (or just use an if)

/// 3)
/// Create our BlocExercise class, a StatelessWidget. This will serve as the base of the tree.
/// We're going to Provide our BLoC, so have the build() return a BlocProvider.
/// The builder should return our ColorBloc constructor
/// We will get our new context by calling the BlocPage constructor, that takes no parameters (create it below)

/// 4)
/// Create the BlocPage class, a StatelessWidget
/// Create a ColorBloc variable called counterBloc. Instantiate it as a BlockProvider of a ColorBloc
/// The linter may complain about closing the sink. This is done by the BlocProvider, so you can ignore this warning
///
/// Create a Scaffold with a purple app bar and constant text constructor to show 'BLoC Exercise' in the bar
/// The body will be a BlocBuilder, with types of ColorBloc and Color.
/// In the builder, the second parameter will be our Color type from the BlocBuilder. Name it color.
///
/// The builder will return:
/// Column >
///   Expanded > Container with center alignment, h&w doubleInfinity > Container with h&w 300 and color is our color parameter
///   Padding > Row with main and cross axis aligned center, main axis max >
///     Spacer
///     FAB that will call counterBloc.add and pass in a ChangeColorEvent makePurple enum. Use autoRenew for the icon
///     Spacer
///     FAB that will call counterBloc.add and pass in a ChangeColorEvent makeGrey enum
///     Spacer

