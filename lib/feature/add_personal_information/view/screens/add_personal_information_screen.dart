import 'package:tabadul/core/widgets/custom_toast.dart';

import '/config/all_imports.dart';

class AddPersonalInformationScreen extends StatelessWidget with CustomToast {
  const AddPersonalInformationScreen({
    required this.phoneNumber,
    super.key,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    var controller = context.read<AddPersonalInformationBloc>();
    return BlocListener<AddPersonalInformationBloc,
        AddPersonalInformationState>(
      listener: (context, state) {
        if (state is AddPersonalInformationSuccessfully) {
          context.pop();
          context.pushReplacementNamed(Routes.accountCreatedSuccessfullyScreen);
          disposeAddPersonalInformation();
        }
        if (state is AddPersonalInformationFailure) {
          context.pop();
          showToast(context: context, message: state.messageError, error: true);
        }
        if (state is AddPersonalInformationLoading) {
          customLoading(context);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: ManagerStrings.addInformation,
          iconLeading: Icons.arrow_back_ios_new,
          functionLeadingButton: () {
            context.pop();
            disposeAddPersonalInformation();
          },
        ),
        body: Form(
          key: controller.formKey,
          child: ListView(
            primary: false,
            padding: EdgeInsetsDirectional.only(
              top: ManagerHeight.h41,
              bottom: ManagerHeight.h10,
              start: ManagerWidth.w38,
              end: ManagerWidth.w36,
            ),
            children: [
              SvgPicture.asset(
                ManagerAssets.addPersonalInformation,
                height: ManagerHeight.h211,
                width: ManagerWidth.w211,
              ),
              verticalSpace(ManagerHeight.h44),
              CustomTextField(
                keyboardType: TextInputType.text,
                textEditingController: controller.firstName,
                hintText: ManagerStrings.firstName,
                textInputAction: TextInputAction.next,
                helperText: ' ',
                validator: (v) => Validator.firstNameValidator(v),
              ),
              CustomTextField(
                helperText: ' ',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textEditingController: controller.lastName,
                hintText: ManagerStrings.lastName,
                validator: (v) => Validator.lastNameValidator(v),
              ),
              BlocSelector<AddPersonalInformationBloc,
                  AddPersonalInformationState, List<String>>(
                selector: (state) => state is AddPersonalInformationInitial &&
                        state.cities.isNotEmpty
                    ? state.cities
                    : [],
                builder: (context, cities) {
                  return CustomDropdownSearch(
                    items: cities,
                    onChangedFunction: (v) {
                      if (v != null) {
                        controller.add(SelectCity(v));
                      }
                    },
                    hintText: ManagerStrings.city,
                    validator: (v) => Validator.dropdownSearchCity(v),
                    textInputAction: TextInputAction.next,
                  );
                },
              ),
              BlocSelector<AddPersonalInformationBloc,
                  AddPersonalInformationState, List<String>>(
                selector: (state) => state is AddPersonalInformationInitial &&
                        state.regions.isNotEmpty
                    ? state.regions
                    : [],
                builder: (context, regions) {
                  return CustomDropdownSearch(
                    items: regions,
                    validator: (v) => Validator.dropdownSearchRegionStreet(v),
                    hintText: ManagerStrings.regionAndStreet,
                    textInputAction: TextInputAction.done,
                    onChangedFunction: (v) {
                      if (v != null) {
                        controller.add(SelectRegionAndStreet(v));
                      }
                    },
                  );
                },
              ),
              verticalSpace(ManagerHeight.h10),
              CustomButton(
                textButton: ManagerStrings.next,
                onPressed: () =>
                    controller.add(AddPersonalInformationProcess(phoneNumber)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
