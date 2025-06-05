import '/config/all_imports.dart';

class NotificationsScreen extends StatelessWidget with CustomToast {
  NotificationsScreen({super.key}) {
    initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: instance<NotificationsBloc>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: ManagerStrings.notifications,
          iconLeading: Icons.menu,
          functionLeadingButton: () => ZoomDrawer.of(context)?.open(),
        ),
        body: BlocConsumer<NotificationsBloc, NotificationsState>(
          listener: (context, state) {
            if (state is NotificationsFailure &&
                state.code != ResponseCode.NO_CONTENT.value) {
              showToast(message: state.message, context: context);
            }
          },
          builder: (context, state) {
            if (state is NotificationsSuccessfully ||
                state is MoreNotificationsLoading) {
              final notifications = state is NotificationsSuccessfully
                  ? state.notifications
                  : (state as NotificationsSuccessfully).notifications;

              final isLoadingMore = state is MoreNotificationsLoading;
              return ListView.builder(
                controller: context.read<NotificationsBloc>().scrollController,
                itemCount: notifications.length + (isLoadingMore ? 1 : 0),
                padding: EdgeInsetsDirectional.only(
                  top: ManagerHeight.h20,
                  bottom: ManagerHeight.h20,
                  start: ManagerWidth.w30,
                  end: ManagerWidth.w36,
                ),
                itemBuilder: (context, index) {
                  if (isLoadingMore && index == notifications.length) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: ManagerHeight.h10),
                      child: Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator())),
                    );
                  }
                  return Container(
                    height: ManagerHeight.h66,
                    width: double.infinity,
                    margin: EdgeInsetsDirectional.only(
                      bottom: ManagerHeight.h18,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(ManagerRadius.r10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: ManagerWidth.w7,
                          color: context.theme.primaryColor,
                        ),
                        Expanded(
                          child: Container(
                            height: ManagerHeight.h74,
                            alignment: Alignment.centerRight,
                            margin: EdgeInsetsDirectional.only(
                              start: ManagerWidth.w8,
                              end: ManagerWidth.w15,
                            ),
                            child: Text(
                              state.notifications[index],
                              maxLines: 3,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.labelSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is NotificationsLoading) {
              return Center(child: CustomLoading());
            }
            return Center(
              child: Text(
                ManagerStrings.noNotifications,
                style: context.textTheme.headlineLarge,
              ),
            );
          },
        ),
      ),
    );
  }
}
