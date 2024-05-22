import 'package:flutter/material.dart';

abstract class IPasswordCloseRegister {
  Future<void> navigationToConfirmPassword(BuildContext context);
  Future<void> navigationToCloseRegister(BuildContext context);
}
