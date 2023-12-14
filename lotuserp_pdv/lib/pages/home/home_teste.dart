// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lotuserp_pdv/core/custom_colors.dart';

class TesteDrawer extends StatefulWidget {
  const TesteDrawer({super.key});

  @override
  State<TesteDrawer> createState() => _TesteDrawerState();
}

List<bool> selected = [
  false,
  false,
  false,
  false,
  false,
  false,
];

class _TesteDrawerState extends State<TesteDrawer> {
  List<String> icons = [
    'assets/images/AbriCaixa.png',
    'assets/images/MovCaixa.png',
    'assets/images/FecharCaixa.png',
    'assets/images/Produtos.png',
    'assets/images/PDV.png',
    'assets/images/CargaDados.png',
  ];

  List<String> text = [
    'Abrir Caixa',
    'Mov. Caixa',
    'Fechar Caixa',
    'Produtos',
    'PDV',
    'Carga Dados',
  ];

  void select(int n) {
    for (int i = 0; i < 6; i++) {
      if (i == n) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
  }

  Color iconsColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.height,
            width: 101.0,
            decoration: BoxDecoration(
              color: CustomColors.customSwatchColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 5,
                  child: Image.asset(
                    'assets/images/logo-nova-branco.png',
                    width: 90,
                  ),
                ),
                Positioned(
                  top: 110,
                  child: Column(
                    children: icons
                        .map(
                          (e) => NavBarItem(
                            icon: e,
                            selected: selected[icons.indexOf(e)],
                            iconColor: iconsColor,
                            onTap: () {
                              setState(() {
                                select(icons.indexOf(e));
                              });
                            },
                            text: text[icons.indexOf(e)],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final String? icon;
  final Function? onTap;
  final String? text;
  final bool? selected;
  final Color? iconColor;
  const NavBarItem({
    Key? key,
    this.icon,
    this.onTap,
    this.text,
    this.selected,
    this.iconColor,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;

  late Animation<double> _anim1;
  late Animation<double> _anim2;
  late Animation<double> _anim3;
  // ignore: unused_field
  late Animation<Color?> _color;

  bool hovered = false;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 275),
    );

    _anim1 = Tween(begin: 101.0, end: 75.0).animate(_controller1);
    _anim2 = Tween(begin: 101.0, end: 25.0).animate(_controller2);
    _anim3 = Tween(begin: 101.0, end: 50.0).animate(_controller2);
    _color =
        ColorTween(end: CustomColors.customSwatchColor, begin: Colors.white)
            .animate(_controller2);

    _controller1.addListener(() {
      setState(() {});
    });
    _controller2.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(NavBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.selected!) {
      Future.delayed(const Duration(milliseconds: 10), () {
        //_controller1.reverse();
      });
      _controller1.reverse();
      _controller2.reverse();
    } else {
      _controller1.forward();
      _controller2.forward();
      Future.delayed(const Duration(milliseconds: 10), () {
        //_controller2.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap!();
      },
      child: MouseRegion(
        onEnter: (value) {
          setState(() {
            hovered = true;
          });
        },
        onExit: (value) {
          setState(() {
            hovered = false;
          });
        },
        child: Container(
          width: 101.0,
          decoration: BoxDecoration(
            color: hovered && !widget.selected!
                ? Colors.transparent
                : Colors.transparent,
            border: Border.all(color: Colors.transparent),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  CustomPaint(
                    painter: CurvePainter(
                      value1: 0,
                      animValue1: _anim3.value,
                      animValue2: _anim2.value,
                      animValue3: _anim1.value,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80.0,
                width: 101.0,
                child: Center(
                  child: Image.asset(
                    widget.icon!,
                    width: 30,
                    height: 30,
                    color: widget.selected! ? widget.iconColor : Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  // Adicione um Text para exibir o texto
                  widget.text!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double? value1;
  final double? animValue1;
  final double? animValue2;
  final double? animValue3;

  CurvePainter({
    this.value1,
    this.animValue1,
    this.animValue2,
    this.animValue3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.moveTo(101, value1!);
    path.quadraticBezierTo(101, value1! + 20, animValue3!, value1! + 20);
    path.lineTo(animValue1!, value1! + 20);
    path.quadraticBezierTo(
        animValue2!, value1! + 20, animValue2!, value1! + 40);
    path.lineTo(101, value1! + 40);
    path.close();

    path.moveTo(101, value1! + 80);
    path.quadraticBezierTo(101, value1! + 60, animValue3!, value1! + 60);
    path.lineTo(animValue1!, value1! + 60);
    path.quadraticBezierTo(
        animValue2!, value1! + 60, animValue2!, value1! + 40);
    path.lineTo(101, value1! + 40);
    path.close();

    paint.color = Colors.white;
    paint.strokeWidth = 101.0;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
