import '/config/all_imports.dart';

class ListServicesProvidersScreen extends StatelessWidget {
  const ListServicesProvidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: ManagerStrings.listServiceProvide,
          functionLeadingButton: () {
            disposeListServiceProvide();
            Navigator.pop(context);
          },
        ),
        body: BlocBuilder<ListServiceProvidersBloc, ListServiceProvidersState>(
          builder: (context, state) {
            if (state is ListServiceProvidersLoading) {
              return const CustomLoading();
            } else if (state is ListServiceProvidersError) {
              if(state.message==ManagerStrings.noInternetConnection){
                CustomNoInternetConnection(
                  refreshButton: () {
                    context.read<ListServiceProvidersBloc>().add(RefreshServiceProviders());
                  },
                );
              }
              return Center(
                child:  Text(
                  state.message,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: ManagerColors.errorColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is ListServiceProvidersLoaded
                || state is ListServiceProvidersLoadingMore) {
              final serviceProviders = state is ListServiceProvidersLoaded
                  ? state.serviceProviders
                  : (state as ListServiceProvidersLoadingMore).serviceProviders;
              final hasReachedMax = state is ListServiceProvidersLoaded
                  ? state.hasReachedMax : false;

              return RefreshIndicator(
                onRefresh: ()  async=>
                  context.read<ListServiceProvidersBloc>().add(RefreshServiceProviders()),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (!hasReachedMax &&
                        scrollInfo.metrics.pixels
                            ==
                            scrollInfo.metrics.maxScrollExtent) {
                      context.read<ListServiceProvidersBloc>().add(LoadMoreServiceProviders());
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: serviceProviders.length + (hasReachedMax ? 0 : 1),
                    padding: EdgeInsetsDirectional.only(
                      start: ManagerWidth.w38,
                      end: ManagerWidth.w36,
                      top: ManagerHeight.h15,
                      bottom: ManagerHeight.h15,
                    ),
                    itemBuilder: (context, index) {
                      if (index >= serviceProviders.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CustomLoading(),
                          ),
                        );
                      }

                      return Padding(
                        padding: EdgeInsetsDirectional.only(bottom: ManagerHeight.h10),
                        child: CustomServiceProviderItem(
                          serviceProvider: serviceProviders[index],
                        ),
                      );
                    },
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
    );
  }
}
