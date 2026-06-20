import 'package:ecommerce/common/widgets/loader/circular_loader.dart';
import 'package:ecommerce/data/repository/address/Address_repository.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
  final _repository = Get.put(AddressRepository());
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  RxBool refreshData = false.obs;

  // Variables
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final Country = TextEditingController();

  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  /// Function to add New address of the user
  Future<void> addNewAddress(state, dynamic country) async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Storing Address');
      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }
      //  Create Address Model
      AddressModel address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        postalCode: postalCode.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        country: country.text.trim(),
        dateTime: DateTime.now(),

      );
      _repository.addAddress(address);
      // Save Address
      String addressId = await _repository.addAddress(address);
      // Update Address
      addressId = addressId;
      // update selected Address
      selectedAddress(address);
      // Stop Loading
      UFullScreenLoader.stopLoading();
      // show success message
      USnackBarHelpers.successSnackBar(title: 'Congratulations',message: 'Your address has been save success');
      // Refresh Address Data
      refreshData.toggle();
      // reset fields
      resetFormFields();
      // Go back
      Navigator.pop(Get.context!);
      Get.back();

    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed',message: e.toString());
    }
  }
  ///  Function to get all address of specific user
  Future<List<AddressModel>> getAllAddresses() async {
    try{
      List<AddressModel> addresses = await _repository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere((address) =>address.selectedAddress ,orElse: () => AddressModel.empty());
      return addresses;
    }catch(e){
      return [];
    }
  }
  /// Function to reset all fields of the form
  void resetFormFields(){
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    street.clear();
    state.clear();
    addressFormKey.currentState!.reset();
  }
  /// Function to select to addresses
 Future<void> selectAddress(AddressModel newSelectedAddress)async {
    try{
      // start loading
      Get.defaultDialog(
        title:'',
        onWillPop: () async => false,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: UCircularLoader());

      if(selectedAddress.value.id.isNotEmpty){
        await _repository.updateSelectedField(selectedAddress.value.id, false, );
      }
      // assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the selected Address to true in the firebase
      await _repository.updateSelectedField(selectedAddress.value.id, true);
      // Go back
      Get.back();
    } catch(e){
      Get.back();
      USnackBarHelpers.errorSnackBar(title: 'Failed',message: e.toString());

    }
 }
}
