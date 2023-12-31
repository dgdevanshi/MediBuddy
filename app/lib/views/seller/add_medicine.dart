import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/controller/seller_service.dart';

import '../../models/medicine.dart';
import '../registration/customtextfield.dart';
import '../registration/rounded_button.dart';

class AddMedicine extends StatefulWidget {
  static const routeName = '/add-medicine';
  AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final stockController = TextEditingController();

  final descriptionController = TextEditingController();

  final companyController = TextEditingController();

  final priceController = TextEditingController();

  final saltController = TextEditingController();

  SellerService sellerService = SellerService();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: color1,
              ),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Add",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'GilroyBold',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  TextSpan(
                    text: " Medicine",
                    style: TextStyle(
                      color: color1,
                      fontSize: 25,
                      fontFamily: 'GilroyBold',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomTextField(
                  title: "Name",
                  controller: nameController,
                  hintText: "Enter medicine name",
                ),
                CustomTextField(
                  title: "Company",
                  controller: companyController,
                  hintText: "Enter company name",
                ),
                CustomTextField(
                  title: "Description",
                  controller: descriptionController,
                  hintText: "Enter medicine's description",
                ),
                CustomTextField(
                  title: "Salt",
                  controller: saltController,
                  hintText: "Enter medicine's salt",
                ),
                CustomTextField(
                  title: "Stock",
                  controller: stockController,
                  hintText: "Enter quantity",
                ),
                CustomTextField(
                  title: "Price",
                  controller: priceController,
                  hintText: "Enter price",
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                RoundedButton(
                  size: size,
                  title: 'UPLOAD',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    await sellerService.addMedicine(
                        medicineName: nameController.text,
                        context: context,
                        salt: saltController.text,
                        company: companyController.text,
                        price: priceController.text,
                        quantity: stockController.text,
                        description: descriptionController.text);
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ]),
            ),
          ),
        ),
        isLoading
            ? Center(
                child: CircularProgressIndicator(color: Colors.orange.shade800))
            : Container()
      ]),
    );
  }
}
