import '/config/all_imports.dart';

class ReadyToReceiveScreen extends StatelessWidget with CustomToast {
  const ReadyToReceiveScreen({
    required this.productId,
    required this.tableName,
    super.key,
  });

  final String tableName;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BuyProductBloc, BuyProductState>(
      listener: (context, state) {
        if (state is BuyProductFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showToast(message: state.message, context: context);
        } else if (state is BuyProductLoading) {
          customLoading(context);
        } else if (state is BuyProductSuccessfully) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pushReplacementNamed(context, Routes.answerIsYesScreen);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: '',
          functionLeadingButton: () {
            Navigator.pop(context);
          },
        ),
        body: ListView(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidth.w38,
            end: ManagerWidth.w36,
            top: ManagerHeight.h83,
          ),
          physics: NeverScrollableScrollPhysics(),
          children: [
            SvgPicture.asset(
              ManagerAssets.readyToReceive,
              width: ManagerWidth.w201,
              height: ManagerHeight.h223,
            ),
            verticalSpace(ManagerHeight.h47),
            Text(
              ManagerStrings.areYouReadyToReceiveWithinHours,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(
                height: 1.5.h,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: ManagerHeight.h20,
                start: ManagerWidth.w54,
                end: ManagerWidth.w54,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        context.read<BuyProductBloc>().add(BuyProductProcess(
                              tableName,
                              productId,
                            ));
                      },
                      child: Text(
                        ManagerStrings.yes,
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                  ),
                  horizontalSpace(ManagerWidth.w10),
                  Expanded(
                    child: CustomButton(
                      color: context.theme.colorScheme.secondary,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.deliveryTimeScreen,
                          arguments: [tableName, productId],
                        );
                      },
                      child: Text(
                        ManagerStrings.no,
                        style: context.textTheme.titleSmall?.copyWith(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
