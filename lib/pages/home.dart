import 'package:flutter/material.dart';
import 'package:flutter_101_designers_and_mobile/models/cars.dart';
import 'package:flutter_101_designers_and_mobile/widgets/custom_text_field.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final car1 = MutableCar(engineIsStarted: false);
  late ImmutableCar car2;
  final car3 = CarWithGetter(engineIsStarted: false);
  final car4 = MutableCar(engineIsStarted: false);

  bool enginesAreRunning = false;

  @override
  void initState() {
    super.initState();
    car2 = ImmutableCar(engineIsStarted: true);
  }

  void _turnTheKey() {
    /// setsState can be read as: rebuildWith () { ... }
    /// It's running the anonymous function first, then rebuilding
    setState(() {
      if (enginesAreRunning == false) {
        enginesAreRunning = true;
        car1.engineIsStarted = true;

        /// car2.engineIsStarted = true;
        car2 = ImmutableCar(engineIsStarted: true);
        car3.engineIsStarted = true;
        car4.engineIsStarted = true;
      } else {
        enginesAreRunning = false;
        car1.engineIsStarted = false;
        car2 = ImmutableCar(engineIsStarted: false);
        car3.engineIsStarted = false;
        car4.engineIsStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// 'widget' means to go get the title variable that belongs
        /// to the parent StatefulWidget
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 88, horizontal: 150),

        /// WARNING: Aligning the child to the center does not cause the
        /// text alignment to be centered. This only becomes apparent when
        /// you have more than one line of text. To center text, use TextAlign
        /// ( see the CustomTextField widget in the widgets folder)
        alignment: Alignment.center,
        decoration: BoxDecoration(
          ///
          /// Hex values are one way of setting colors
          color: Color(0x20000000),
          border: Border.all(
            style: BorderStyle.solid,

            /// There are also preset colors
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Container(
          color: Colors.yellow[100],

          /// Without a specified width, the yellow container will
          /// match the with of the column. However, if we specify
          /// a width, it will force the column to be the same width.
          /// This effects where the text is placed, since the
          /// column is aligning things left (more below)
          ///
          /// double.infinity is Flutter speak for Android's "match parent".
          /// It means to be as big as the parent will allow
          // width: double.infinity,

          child: Column(
            /// This will space the children evenly regardless
            /// of how much space is available
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            /// MainAxisSize.max is the default and will use
            /// all available space in the main axis. Look at
            /// the light yellow to see the actual column size.
            ///
            /// Now, uncomment the below line and see what
            /// happens when you set it to minimum
            // mainAxisSize: MainAxisSize.min,

            /// This aligns children to the left in a language
            /// that reads ltr, and right to one that reads rtl.
            ///
            /// Notice how changing this to center will center
            /// the red container, but it will not cause the text
            /// in it to center
            // crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              /// This approach is simple, but horribly inefficient.
              /// It's rebuilding the whole page, where we could be
              /// rebuilding only the text fields. This is part of
              /// Stat Management, and is far beyond our scope here.
              /// However, it's an important point to know and keep in
              /// mind as you develop Flutter apps.

              /// Again, look at the alignment in each container. It will align
              /// the text object to center within the container, but since
              /// the container is shrinking to match the text, it won't
              /// make any visual difference. It also doesn't affect the
              /// alignment of the text within the text object itself. Again,
              /// see the text widget in the CustomTextField widget.
              ///
              /// These are two different ways of handling an apostrophe
              /// in a string:
              ///
              /// Double quotes (normally we use single-quoted strings
              Container(
                alignment: Alignment.center,
                color: Colors.red[100],
                child: ImmutableCustomTextField(
                    text:
                        "Car1's engine is ${car1.engineIsStarted == true ? 'started' : 'off'}"),
              ),

              /// Use an escape ( \ )
              Container(
                alignment: Alignment.center,
                color: Colors.red[100],
                child: ImmutableCustomTextField(
                    text:
                        'Car2\'s engine is ${car2.engineIsStarted == true ? 'started' : 'off'}'),
              ),

              /// These are two different ways of handling multi-line text
              /// Use a different escape ( \n = new line )
              Container(
                alignment: Alignment.center,
                color: Colors.red[100],
                child: ImmutableCustomTextField(
                    text:
                        "Car3's engine is:\n${car3.engineIsStarted == true ? 'started' : 'off'}"),
              ),

              /// Use triple quotes ( ''' = line breaks here will cause line breaks in the UI )
              /// Notice how the second line needs to be all the way left. If we indent it normally,
              /// the indent will show in the UI text
              Container(
                alignment: Alignment.center,
                color: Colors.red[100],
                child: ImmutableCustomTextField(
                  text: '''Car4's engine is:
${car4.engineIsStarted == true ? 'started' : 'off'}''',
                ),
              ),
            ],
          ),
        ),
      ),

      /// The FAB is part of the scaffold. It usually appears at the
      /// bottom, under the body
      floatingActionButton: FloatingActionButton(
        /// In an onPressed or onTap, don't use the () as this will
        /// cause the function to trigger on build, instead of only
        /// when the button is pressed
        onPressed: _turnTheKey,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
