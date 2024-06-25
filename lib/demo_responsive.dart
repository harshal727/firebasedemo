import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //500
    //1024
    print("Width ${size.width}");
    return Scaffold(
      body: size.width < 510
          ? const MobileView()
          : size.width > 510 && size.width < 1024
              ? const TabletView()
              : const DesktopView(),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildExpanded(Colors.red),
        buildExpanded(Colors.blue),
        buildExpanded(Colors.green),
      ],
    );
  }
}

class TabletView extends StatelessWidget {
  const TabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              buildExpanded(Colors.red),
              buildExpanded(Colors.blue),
            ],
          ),
        ),
        buildExpanded(Colors.green),
      ],
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildExpanded(Colors.red),
        buildExpanded(Colors.blue),
        buildExpanded(Colors.green),
      ],
    );
  }
}

Expanded buildExpanded(Color color) {
  return Expanded(
    child: Container(
      color: color,
    ),
  );
}

Padding buildPadding() {
  return const Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20));
}
