import 'package:flutter/material.dart';

const kAnimationDuration = const Duration(milliseconds: 500);
const kAnimationDurationForScreenFadeIn = const Duration(milliseconds: 1000);

class ImplicitAnimations extends StatefulWidget {
  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool isNewDimensions = false;
  bool isDescriptionShown = true;
  bool isChangeBackgroundColor = false;
  bool isChangeButtonsLayout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: kAnimationDuration,
            color: (isChangeBackgroundColor) ? Colors.black : Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      AnimatedContainer(
                        width: (isNewDimensions) ? 350 : 250,
                        height: (isNewDimensions) ? 300 : 200,
                        duration: kAnimationDuration,
                        curve: Curves.easeInCubic,
                        child: Image.asset(
                          "assets/images/bird.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  AnimatedSize(
                    duration: kAnimationDuration,
                    child: Container(
                      height: isDescriptionShown ? null : 0.0,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Birds are vertebrates (animals with backbones) with wings and feathers.Most birds can fly , using powerful muscles to flap their wings._Birds' bodies are covered with a lignt,tough layer of feathers and they have very light skeletons. Instead of teeth, they have hornlike beaks , or bills.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isChangeBackgroundColor ? Colors.white : Colors.black
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  AnimatedSize(
                    duration: kAnimationDuration,
                    child: AnimatedSwitcher(
                      duration: kAnimationDuration,
                      child:(isChangeButtonsLayout) ?
                      PrimaryButtonsInWrap(
                        onTapChangeDimension: () {
                          setState(() {
                            isNewDimensions = !isNewDimensions;
                            debugPrint(
                                "check dimension status= ${isNewDimensions} ");
                          });
                        },
                        onTapHideOrShowDescription: () {
                          setState(() {
                            isDescriptionShown = !isDescriptionShown;
                          });
                        },
                        onTapChangeTheme: () {
                          setState(() {
                            setState(() {
                              isChangeBackgroundColor = !isChangeBackgroundColor;
                            });
                          });
                        },
                        isDescriptionShown: isDescriptionShown,
                      ):
                      PrimaryButtonsInColumn(
                        onTapChangeDimension: () {
                          setState(() {
                            isNewDimensions = !isNewDimensions;
                            debugPrint(
                                "check dimension status= ${isNewDimensions} ");
                          });
                        },
                        onTapHideOrShowDescription: () {
                          setState(() {
                            isDescriptionShown = !isDescriptionShown;
                          });
                        },
                        onTapChangeTheme: () {
                          setState(() {
                            setState(() {
                              isChangeBackgroundColor = !isChangeBackgroundColor;
                            });
                          });
                        },
                        isDescriptionShown: isDescriptionShown,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  PrimaryButton(onTap: (){
                    setState(() {
                      isChangeButtonsLayout = !isChangeButtonsLayout;
                    });
                  }, label: "Change Button Layout",
                  color: Colors.red,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class PrimaryButtonsInColumn extends StatefulWidget {
  Function onTapChangeDimension;
  Function onTapHideOrShowDescription;
  Function onTapChangeTheme;
  bool isDescriptionShown;

  PrimaryButtonsInColumn(
      {super.key,
        required this.onTapHideOrShowDescription,
        required this.onTapChangeDimension,
        required this.onTapChangeTheme,
        required this.isDescriptionShown});

  @override
  State<PrimaryButtonsInColumn> createState() => _PrimaryButtonsInColumnState();
}

class _PrimaryButtonsInColumnState extends State<PrimaryButtonsInColumn> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryButton(
            onTap: () => widget.onTapChangeDimension(),
            label: "Change Dimensions",
          ),
          PrimaryButton(
            onTap: () => widget.onTapHideOrShowDescription(),
            label: "Show Description",
          ),
          PrimaryButton(
            onTap: () => widget.onTapChangeTheme(),
            label: "Change Theme",
          ),
        ],
      ),
    );
  }
}
class PrimaryButtonsInWrap extends StatefulWidget {
  Function onTapChangeDimension;
  Function onTapHideOrShowDescription;
  Function onTapChangeTheme;
  bool isDescriptionShown;

  PrimaryButtonsInWrap(
      {super.key,
      required this.onTapHideOrShowDescription,
      required this.onTapChangeDimension,
      required this.onTapChangeTheme,
      required this.isDescriptionShown});

  @override
  State<PrimaryButtonsInWrap> createState() => _PrimaryButtonsInWrapState();
}

class _PrimaryButtonsInWrapState extends State<PrimaryButtonsInWrap> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          PrimaryButton(
            onTap: () => widget.onTapChangeDimension(),
            label: "Change Dimensions",
          ),
          SizedBox(width: 10,),
          PrimaryButton(
            onTap: () => widget.onTapHideOrShowDescription(),
            label: "Show Description",
          ),
          SizedBox(width: 10,),
          PrimaryButton(
            onTap: () => widget.onTapChangeTheme(),
            label: "Change Theme",
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final Color color;

  PrimaryButton(
      {super.key,
      required this.onTap,
      required this.label,
      this.color = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onTap();
      },
      child: Text(label),
      textColor: Colors.white,
      color: color,
    );
  }
}
