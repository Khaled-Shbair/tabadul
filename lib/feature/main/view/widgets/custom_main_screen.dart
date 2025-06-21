import '/config/all_imports.dart';

class CustomMainScreen extends StatelessWidget {
  CustomMainScreen({super.key});

  final List<String> _iconBottomNavigationBar = [
    ManagerAssets.homeIcon,
    ManagerAssets.notificationIcon,
    ManagerAssets.registerAsServiceProviderIcon,
    ManagerAssets.userIcon,
  ];

  final List<Widget> _screen = [
    HomeScreen(),
    NotificationsScreen(),
    ListProvideServiceScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var controller = context.read<MainBloc>();
    return Scaffold(
      bottomNavigationBar: Container(
        height: ManagerHeight.h49,
        margin: EdgeInsetsDirectional.only(
          start: ManagerWidth.w38,
          end: ManagerWidth.w36,
          bottom: ManagerHeight.h24,
        ),
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: BorderRadius.circular(ManagerRadius.r10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ManagerRadius.r40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                _iconBottomNavigationBar.length,
                (index) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        final currentState = controller.state;
                        if (currentState is BottomNavIndexChanged &&
                            currentState.index != index) {
                          controller.add(BottomNavIndexChange(index));
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            _iconBottomNavigationBar[index],
                            height: index == 2
                                ? ManagerHeight.h25
                                : ManagerHeight.h18,
                            width: index == 2
                                ? ManagerHeight.h25
                                : ManagerWidth.w18,
                          ),
                          verticalSpace(ManagerHeight.h8),
                          BlocBuilder<MainBloc, MainState>(
                            builder: (context, state) {
                              if (state is BottomNavIndexChanged &&
                                  index == state.index) {
                                return Container(
                                  height: ManagerHeight.h3,
                                  width: ManagerWidth.w5,
                                  decoration: BoxDecoration(
                                    color: context.theme.colorScheme.surface,
                                    borderRadius:
                                        BorderRadius.circular(ManagerRadius.r5),
                                  ),
                                );
                              }
                              return SizedBox.shrink();
                            },
                          ),
                          verticalSpace(ManagerHeight.h7),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is BottomNavIndexChanged) {
            currentIndex = state.index;
          }
          return _screen[currentIndex];
        },
      ),
    );
  }
}
