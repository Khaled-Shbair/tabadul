import '/config/all_imports.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        functionLeadingButton: () {
          Navigator.of(context).pop();
          disposeDeliveryTime();
        },
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w37,
          end: ManagerWidth.w37,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ManagerStrings.specifyTimeYouWantWithin24HoursOnly,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            ),
            verticalSpace(ManagerHeight.h24),
            BlocBuilder<DeliveryTimeBloc, DeliveryTimeState>(
              builder: (context, state) {
                var controller = context.read<DeliveryTimeBloc>();
                final hour = state.selectedTime.hour.toString().padLeft(2, '0');
                final minute =
                    state.selectedTime.minute.toString().padLeft(2, '0');

                return InkWell(
                  onTap: () async {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      cancelText: ManagerStrings.cancel,
                      confirmText: ManagerStrings.done,
                      helpText: ManagerStrings.selectTime,
                      hourLabelText: ManagerStrings.hours,
                      minuteLabelText: ManagerStrings.minutes,
                      builder: (context, child) {
                        return MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            alwaysUse24HourFormat: true,
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (selectedTime != null) {
                      controller.add(SelectTime(selectedTime));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTimeBox(minute[1]), //second left number
                      horizontalSpace(ManagerWidth.w10),
                      CustomTimeBox(minute[0]), //second right number
                      horizontalSpace(ManagerWidth.w18),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: ManagerRadius.r2d5,
                            backgroundColor: context.theme.primaryColor,
                          ),
                          verticalSpace(ManagerHeight.h13),
                          CircleAvatar(
                            radius: ManagerRadius.r2d5,
                            backgroundColor: context.theme.primaryColor,
                          ),
                        ],
                      ),
                      horizontalSpace(ManagerWidth.w18),
                      CustomTimeBox(hour[1]), //hour right number
                      horizontalSpace(ManagerWidth.w10),
                      CustomTimeBox(hour[0]), //hour left number
                    ],
                  ),
                );
              },
            ),
            verticalSpace(ManagerHeight.h50),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w20,
                end: ManagerWidth.w20,
              ),
              child: CustomButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.waitForPickupScreen);
                  disposeDeliveryTime();
                },
                child: Text(
                  ManagerStrings.done,
                  style: context.textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
