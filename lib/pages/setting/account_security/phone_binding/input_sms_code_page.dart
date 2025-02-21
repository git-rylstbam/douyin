import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../widgets/just_tap.dart';
import '../../../../widgets/no_border_text_field.dart';
import '../../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/19 15:41
/// Author: Lee
/// Description:

class InputSmsCodePage extends StatefulWidget {
  const InputSmsCodePage({super.key, required this.phone});

  final String phone;

  @override
  State<InputSmsCodePage> createState() => _InputSmsCodePageState();
}

class _InputSmsCodePageState extends State<InputSmsCodePage> {
  final _codeController = TextEditingController();
  final _statusNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _codeController.dispose();
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
                    '请输入验证码',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF161823),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '验证码已通过短信发送至 +86 ${widget.phone}',
                    style: const TextStyle(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: NoBorderTextField(
                              controller: _codeController,
                              hint: '请输入验证码',
                              hintColor: const Color(0xFFABABAF),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              onChanged: (value) =>
                                  _statusNotifier.value = value.length == 6,
                              cursorWidth: 1.0,
                              cursorHeight: 20.0,
                              cursorColor: const Color(0xFFAFAFAF),
                            ),
                          ),
                          JustTap(
                            onPressed: () {},
                            child: const Text(
                              '秒后重新发送',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xFFABABAF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  _buildConfirmButton(),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildConfirmButton() => Row(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _statusNotifier,
              builder: (_, value, __) => FilledButton(
                onPressed: value
                    ? () {
                        Get.back();
                        Get.back();
                      }
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
                child: const Text('完成', style: TextStyle(fontSize: 14.0)),
              ),
            ),
          ),
        ],
      );
}
