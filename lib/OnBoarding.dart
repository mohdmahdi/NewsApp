import 'package:flutter/material.dart';
import 'pagemodel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  List<PageModel> pages;
  
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);


  void _addPages(){
    pages = List<PageModel>();
  pages.add(PageModel('Welcome1', 'Description 1', Icons.ac_unit, 'assets/images/bg.png'));
  pages.add(PageModel('Welcome2', 'Description 2', Icons.add_a_photo, 'assets/images/bg2.png'));
  pages.add(PageModel('Welcome3', 'Description 3', Icons.title, 'assets/images/bg3.png'));
  pages.add(PageModel('Welcome4', 'Description 4', Icons.add_call, 'assets/images/bg4.png'));
  
}

  @override
  Widget build(BuildContext context) {
    _addPages();
    return  Stack(
        children: <Widget>[
          Scaffold(
            body: PageView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(pages[index].image,),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Transform.translate(
                            child: Icon(
                              pages[index].icon,
                              size: 120,
                              color: Colors.white,
                            ),
                            offset: Offset(0, -100),
                          ),
                          Text(
                            pages[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: Text(
                              pages[index].description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: pages.length,
            ),
          ),
          Transform.translate(
            offset: Offset(0, 150),
            child: Align(
              alignment: Alignment.center,
              child: _displauPageIndicators(pages.length)
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 24,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: RaisedButton(
                  color: Colors.red.shade900,
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      );
  }
  
  Widget _displauPageIndicators(int length){
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.black87,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.black45,
        ),
      ),
    );
  }
}




