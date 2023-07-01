import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSection extends StatefulWidget {
  const LoadingSection({super.key});

  @override
  State<LoadingSection> createState() => _LoadingSectionState();
}

class _LoadingSectionState extends State<LoadingSection> {
  @override
  Widget build(BuildContext context) {
    return const Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: SpinKitCircle(
            color: Color(0xFF864879),
            size: 100,
          ),
        ),
      ),
    );
  }
}
