import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../routes.dart';
import '../../../../widgets/just_tap.dart';
import '../../../../widgets/no_border_text_field.dart';
import '../../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/19 11:13
/// Author: Lee
/// Description:

class PhoneBindingPage extends StatefulWidget {
  const PhoneBindingPage({super.key});

  @override
  State<PhoneBindingPage> createState() => _PhoneBindingPageState();
}

class _PhoneBindingPageState extends State<PhoneBindingPage> {
  final _phoneController = TextEditingController();
  final _statusNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _phoneController.dispose();
    _statusNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SettingTopBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: .4,
              thickness: .4,
              color: Color(0xFFD0D1D3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '请输入手机号',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF161823),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    '换绑新手机号之后，可以用新的手机号及当前密码登录',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF73747B),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      color: Color(0xFFF8F8F8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          _buildCountryCode(),
                          const SizedBox(
                            height: 8.0,
                            child: VerticalDivider(
                              width: .4,
                              thickness: .4,
                              color: Color(0xFFABABAF),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: NoBorderTextField(
                              controller: _phoneController,
                              hint: '请输入手机号',
                              hintColor: const Color(0xFFABABAF),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(11),
                              ],
                              onChanged: (value) =>
                                  _statusNotifier.value = value.length == 11,
                              cursorWidth: 1.0,
                              cursorHeight: 20.0,
                              cursorColor: const Color(0xFFAFAFAF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  _buildObtainSMSCodeButton(),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildCountryCode() => JustTap(
        onPressed: () {},
        child: const Row(
          children: [
            Text(
              '+86',
              style: TextStyle(fontSize: 14.0, color: Color(0xFF161823)),
            ),
            Icon(
              Icons.arrow_drop_down_rounded,
              size: 20.0,
              color: Color(0xFF161823),
            ),
          ],
        ),
      );

  Widget _buildObtainSMSCodeButton() => Row(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _statusNotifier,
              builder: (_, value, __) => FilledButton(
                onPressed: value
                    ? () => Get.toNamed(
                          Routes.input_sms_code,
                          parameters: {'phone': _phoneController.text},
                        )
                    : null,
                style: FilledButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  disabledBackgroundColor: const Color(0xFFFC94AA),
                  disabledForegroundColor: Colors.white,
                  backgroundColor: const Color(0xFFFC2958),
                  foregroundColor: Colors.white,
                ),
                child: const Text('获取短信验证码', style: TextStyle(fontSize: 14.0)),
              ),
            ),
          ),
        ],
      );
}
