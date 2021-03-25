part of 'package:cart_app/screens/detail_product/detail_product_screen.dart';

class _Carousel extends StatelessWidget {
  final List imgList;

  _Carousel({Key key, this.imgList}) : super(key: key);

  final _currentNotifier = ValueNotifier<int>(0);

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _currentNotifier,
        builder: (_, value, __) => Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 200.0,
                      onPageChanged: (index, reason) {
                        _currentNotifier.value = index;
                      }),
                  items: imgList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.white),
                            child: Image.network(
                              i,
                              fit: BoxFit.cover,
                            ));
                      },
                    );
                  }).toList(),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(imgList, (index, url) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentNotifier.value == index
                                ? Colors.orange
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ));
  }
}
