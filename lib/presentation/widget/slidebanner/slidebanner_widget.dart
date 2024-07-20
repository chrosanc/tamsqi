import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';

class SlidebannerWidget extends StatefulWidget {
  final String title;
  const SlidebannerWidget({Key? key, required this.title}) : super(key: key);

  @override
  _SlidebannerWidgetState createState() => _SlidebannerWidgetState();
}

class _SlidebannerWidgetState extends State<SlidebannerWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title, style: appTheme.textTheme.titleSmall,),
            Text('Lihat Semua')
          ],
        ),
        const SizedBox(height: 5,),
        Stack(
          children: [
            
            Container(
              height: 125,
              child: PageView.builder(
                controller: _pageController,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: colors[index],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(colors.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                height: 6.0,
                width: _currentPage == index ? 12.0 : 6.0,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              );
                        }),
                      ),
            ),
          ],
        ),
        
      ],
    );
  }
}
