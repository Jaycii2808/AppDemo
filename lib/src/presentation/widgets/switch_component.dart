import 'package:flutter/material.dart';

class SwitchComponent extends StatefulWidget {
  const SwitchComponent({super.key});

  @override
  State<SwitchComponent> createState() => _SwitchComponentState();
}

class _SwitchComponentState extends State<SwitchComponent> {
  bool light = false;
  Color color = Colors.grey.withOpacity(0.2);
  InteractiveInkFeatureFactory splashFactory = InkRipple.splashFactory;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          autofocus: true,
          onFocusChange: (bool value) {
            print('on focus inkwell value: $value');
          },
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              // if (states.contains(MaterialState.)) {
              //   return Colors.red;
              // }
              return Colors.black.withOpacity(0.09);
            },
          ),
          splashFactory: splashFactory,
          onTap: () {
            setState(() {
              focusNode.requestFocus();
              light = !light;
              onSwitchChange(light);
            });
          },
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              const Text('Text'),
              const Spacer(),
              SizedBox(
                width: 80,
                child: FocusableActionDetector(
                  autofocus: true,
                  onFocusChange: (bool value) {
                    print('on focus inkwell value: $value');
                  },
                  child: Switch(
                    focusNode: focusNode,
                    value: light,
                    activeColor: Colors.cyanAccent.withOpacity(0.2),
                    // materialTapTargetSize: MaterialTapTargetSize.padded,
                    onChanged: (bool value) {
                      setState(() {
                        light = value;
                        onSwitchChange(light);
                        debugPrint('Switch change to $value');
                      });
                    },
                    // thumbIcon: MaterialStateProperty.resolveWith<Icon>(
                    //   (Set<MaterialState> states) {
                    //     if (states.contains(MaterialState.disabled)) {
                    //       return const Icon(Icons.accessible_outlined);
                    //     }
                    //     return const Icon(Icons.accessible_sharp);
                    //   },
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSwitchChange(bool switchValue) {
    if (switchValue) {
      color = Colors.lightBlueAccent.withOpacity(0.5);
      splashFactory = InkSplash.splashFactory;
    } else {
      color = Colors.grey.withOpacity(0.2);
      splashFactory = InkRipple.splashFactory;
    }
  }
}
