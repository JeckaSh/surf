import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/domain/animals.dart';
import 'package:surf_flutter_courses_template/core/entity/input_types.dart';
import 'package:surf_flutter_courses_template/presentation/pages/reg_page/reg_page_widget_model.dart';
import 'package:surf_flutter_courses_template/presentation/theme/text_style_extension.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/custom_checkbox.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/custom_radio_button.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/custom_text_field.dart';

/// Виджет формы регистрации животного
class RegForm extends StatefulWidget {
  /// Форма регистрации животного
  const RegForm({super.key});

  @override
  State<RegForm> createState() => _RegistrationFormState();
}

/// Состояние виджета формы регистрации
class _RegistrationFormState extends State<RegForm> {
  RegPageWidgetModel get widgetModel => context.read<RegPageWidgetModel>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widgetModel.formKey,
      child: Column(
        children: [
          const AnimalTypeSection(),
          const FieldsSection(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: widgetModel.currentPet.canHaveVaccination
                ? const VaccinationSection()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class AnimalTypeSection extends StatefulWidget {
  const AnimalTypeSection({super.key});

  @override
  State<AnimalTypeSection> createState() => _AnimalTypeSectionState();
}

class _AnimalTypeSectionState extends State<AnimalTypeSection> {
  RegPageWidgetModel get widgetModel => context.read<RegPageWidgetModel>();

  var animals = 0;

  /// Изменить выбранный тип животного, на животное с [index] в перечислении [Animals]
  _changePetType(int index) {
    setState(() {
      animals = index;
    });
    widgetModel.setCurrentPet(
      Animals.values[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomRadioButton(
          groupValue: animals,
          pet: Animals.dog,
          onTap: _changePetType,
          onChanged: _changePetType,
        ),
        CustomRadioButton(
          groupValue: animals,
          pet: Animals.cat,
          onTap: _changePetType,
          onChanged: _changePetType,
        ),
        CustomRadioButton(
          groupValue: animals,
          pet: Animals.parrot,
          onTap: _changePetType,
          onChanged: _changePetType,
        ),
        CustomRadioButton(
          groupValue: animals,
          pet: Animals.hamster,
          onTap: _changePetType,
          onChanged: _changePetType,
        ),
      ],
    );
  }
}

class FieldsSection extends StatefulWidget {
  const FieldsSection({super.key});

  @override
  State<FieldsSection> createState() => _FieldsSectionState();
}

class _FieldsSectionState extends State<FieldsSection> {
  RegPageWidgetModel get widgetModel => context.read<RegPageWidgetModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          formKey: widgetModel.formKey,
          label: AppStrings.petName,
          inputType: NameType(),
          controller: widgetModel.nameController,
        ),
        CustomTextField(
          formKey: widgetModel.formKey,
          label: AppStrings.petBirthday,
          inputType: DateType(),
          controller: widgetModel.birthdayController,
        ),
        CustomTextField(
          formKey: widgetModel.formKey,
          label: AppStrings.petWeight,
          inputType: WeightType(),
          controller: widgetModel.weightController,
        ),
        CustomTextField(
          formKey: widgetModel.formKey,
          label: AppStrings.email,
          inputType: EmailType(),
          controller: widgetModel.emailController,
        ),
      ],
    );
  }
}

class VaccinationSection extends StatefulWidget {
  const VaccinationSection({super.key});

  @override
  State<VaccinationSection> createState() => _VaccinationSectionState();
}

class _VaccinationSectionState extends State<VaccinationSection> {
  RegPageWidgetModel get widgetModel => context.read<RegPageWidgetModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppStrings.checkboxTitle,
            style: CustomTextTheme.bigTextStyle,
          ),
        ),
        CustomCheckBox(
          title: AppStrings.rabies,
          controller: widgetModel.rabiesController,
        ),
        CustomCheckBox(
          title: AppStrings.covid,
          controller: widgetModel.covidController,
        ),
        CustomCheckBox(
          title: AppStrings.malaria,
          controller: widgetModel.malariaController,
        ),
      ],
    );
  }
}
