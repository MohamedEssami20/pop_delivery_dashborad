import 'dart:io';
import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/core/utils/backend_endpoints.dart';

import '../../../../../core/utils/cusotm_text_field.dart';
import '../../../../../core/utils/custom_button.dart';
import 'choose_product_type.dart';
import 'image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  late bool isFeatured = false;
  late bool isOraganic = false;
  late int expeireationMonths, numberOfCalories, unitAmount;
  File? imageFile;
  List<File> productImagesFiles = [];
  String productType = BackendEndpoints.offers;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomTextFormFiled(
              onSaved: (value) {
                name = value!;
              },
              hintText: "product name",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            ChosseProductType(
              value: productType,
              onchanged: (value) {
                setState(() {
                  productType = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                price = num.parse(value!);
              },
              hintText: "product price",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                code = value!.toLowerCase();
              },
              hintText: "product code",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                expeireationMonths = int.parse(value!);
              },
              hintText: "expeireation Months",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                numberOfCalories = int.parse(value!);
              },
              hintText: "number Of Calories",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                unitAmount = int.parse(value!);
              },
              hintText: "unit Amount",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                description = value!;
              },
              hintText: "product descrption",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Text("add product image", style: TextStyle(color: Colors.black)),
            ImageField(
              null,
              onChanged: (value) {
                imageFile = value;
              },
            ),
            const SizedBox(height: 20),
            Text(
              "add product other images",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: ImageField(
                    250,
                    onChanged: (value) {
                      productImagesFiles.add(value!);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () async {
                if (imageFile != null) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    autovalidateMode = AutovalidateMode.disabled;
                    setState(() {});
                    // AddProductInputEntity addProductInputEntity =
                    //     AddProductInputEntity(
                    //   id: generateProductId(),
                    //   name: name,
                    //   price: price,
                    //   code: code,
                    //   description: description,
                    //   image: imageFile!,
                    //   isFeatured: isFeatured,
                    //   isOraganic: isOraganic,
                    //   unitAmount: unitAmount,
                    //   expeireationMonths: expeireationMonths,
                    //   numberOfCalories: numberOfCalories,
                    //   productType: productType,
                    // );
                    // await context.read<AddProductCubit>().addProduct(
                    //     addProductInputEntity: addProductInputEntity);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                }
              },
              text: "Add Product",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
