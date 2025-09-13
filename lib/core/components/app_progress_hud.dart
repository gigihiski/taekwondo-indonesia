import 'package:flutter/material.dart';
import 'package:taekwondo/core/themes/app_assets.dart';

class AppProgressHUD extends StatefulWidget {
  final Widget child;
  final Color indicatorColor;
  final Widget? indicatorWidget;
  final Color backgroundColor;
  final Radius backgroundRadius;
  final Color borderColor;
  final double borderWidth;
  final bool barrierEnabled;
  final Color barrierColor;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;

  const AppProgressHUD({
    super.key,
    required this.child,
    this.indicatorColor = Colors.white,
    this.indicatorWidget,
    this.backgroundColor = Colors.black12,
    this.backgroundRadius = const Radius.circular(8.0),
    this.borderColor = Colors.white,
    this.borderWidth = 0.0,
    this.barrierEnabled = true,
    this.barrierColor = Colors.black12,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 14.0),
    this.padding = const EdgeInsets.all(0.0),
  });

  static AppProgressHUDState? of(BuildContext context) {
    final progressHudState = context
        .findAncestorStateOfType<AppProgressHUDState>();

    assert(() {
      if (progressHudState == null) {
        throw FlutterError(
          'ProgressHUD operation requested with a context that does not include a ProgressHUD.\n'
          'The context used to show ProgressHUD must be that of a widget '
          'that is a descendant of a ProgressHUD widget.',
        );
      }
      return true;
    }());

    return progressHudState;
  }

  @override
  AppProgressHUDState createState() => AppProgressHUDState();
}

class AppProgressHUDState extends State<AppProgressHUD>
    with SingleTickerProviderStateMixin {
  bool isShow = false;
  bool barrierVisible = false;
  String? title;

  late AnimationController controller;
  late Animation animation;

  void show() {
    if (mounted) {
      setState(() {
        title = null;
        controller.forward();
        isShow = true;
      });
    }
  }

  void showWithText(String text) {
    if (mounted) {
      setState(() {
        title = text;
        controller.forward();
        isShow = true;
      });
    }
  }

  void dismiss() {
    if (mounted) {
      setState(() {
        controller.reverse();
        isShow = false;
      });
    }
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );

    animation.addStatusListener((status) {
      setState(() {
        barrierVisible = status != AnimationStatus.dismissed;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (widget.barrierEnabled) {
      children.add(
        Visibility(
          visible: barrierVisible,
          child: ModalBarrier(color: widget.barrierColor, dismissible: false),
        ),
      );
    }
    children.add(Center(child: buildProgress()));

    return Stack(
      children: <Widget>[
        widget.child,
        IgnorePointer(
          ignoring: !isShow,
          child: TickerMode(
            enabled: isShow,
            child: FadeTransition(
              opacity: animation as Animation<double>,
              child: Stack(children: children),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProgress() {
    final contentChildren = <Widget>[
      widget.indicatorWidget ?? buildDefaultIndicator(),
    ];

    if (title != null && title!.isNotEmpty) {
      contentChildren.addAll(<Widget>[
        SizedBox(height: 16.0),
        Text(title!, style: widget.textStyle),
      ]);
    }

    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: widget.backgroundColor.withAlpha(200),
        borderRadius: BorderRadius.all(widget.backgroundRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: contentChildren,
      ),
    );
  }

  Widget buildDefaultIndicator() {
    return SizedBox(
      width: 175.0,
      height: 175.0,
      child: Image.asset(AppAssets.logo, width: 120),
    );
  }
}
