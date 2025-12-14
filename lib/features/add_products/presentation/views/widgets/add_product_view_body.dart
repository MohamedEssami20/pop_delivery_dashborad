import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/core/func/generate_product_id.dart';
import 'package:popo_delivery_dashboard/core/func/get_catogery_food.dart';
import 'package:popo_delivery_dashboard/core/utils/backend_endpoints.dart';
import '../../../../../core/func/get_code_product.dart';
import '../../../../../core/utils/cusotm_text_field.dart';
import '../../../../../core/utils/custom_button.dart';
import '../../../../../core/entities/product_input_entity.dart';
import '../../manager/add_product_cubit/add_product_cubit.dart';
import 'add_product_button_builder.dart';
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
  late String name, description;
  late num price;
  late bool isFeatured = false;
  late bool isOraganic = false;
  late int numberOfCalories, discount;
  File? imageFile;
  List<File?>? productImagesFiles;
  String productType = BackendEndpoints.offers;

  @override
  void initState() {
    productImagesFiles = List.filled(3, null);
    super.initState();
  }

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
              validator: (value) {
                if (value!.isEmpty) {
                  return "product name can't be empty";
                }
                return null;
              },
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "product price can't be empty";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                discount = int.parse(value!);
              },
              hintText: "product discount",
              textInputType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "product discount can't be empty";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                numberOfCalories = int.parse(value!);
              },
              hintText: "number Of Calories",
              textInputType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "number Of Calories can't be empty";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormFiled(
              onSaved: (value) {
                description = value!;
              },
              hintText: "product descrption",
              textInputType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "product descrption can't be empty";
                }
                return null;
              },
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
                      setState(() {
                        productImagesFiles![index] = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (imageFile != null &&
                      productImagesFiles!.isNotEmpty &&
                      productImagesFiles!.length == 3) {
                    autovalidateMode = AutovalidateMode.disabled;
                    setState(() {});
                    ProductInputEntity addProductInputEntity =
                        ProductInputEntity(
                          id: generateProductId(),
                          name: name,
                          price: price.toString(),
                          description: description,
                          calories: numberOfCalories,
                          productType: productType,
                          avrageRating: 0.0,
                          isFavourite: false,
                          imageFile: imageFile,
                          createdAt: DateTime.now(),
                          code: getCodeWithProductType(productType),
                          category: getCategory(productType: productType),
                          productImages: productImagesFiles,
                          discount: discount,
                        );
                    await context.read<AddProductCubit>().addProduct(
                      addProductInputEntity,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("please add all images")),
                    );
                  }
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: const AddProductButtonBuilder(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
