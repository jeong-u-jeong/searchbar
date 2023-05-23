import 'dart:js_util';

import 'package:flutter/material.dart';

/// Flutter code sample for pinned [SearchAnchor] while scrolling.

void main() {
  runApp(const PinnedSearchBarApp());
}

class PinnedSearchBarApp extends StatefulWidget {
  const PinnedSearchBarApp({super.key});

  @override
  State<PinnedSearchBarApp> createState() => _PinnedSearchBarAppState();
}

class _PinnedSearchBarAppState extends State<PinnedSearchBarApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black
        )
      ),
      home: Scaffold(
        body: Column(
          children: [
            Container(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SearchBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            Container(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SearchBar(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(LinearBorder.none),
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                textStyle: MaterialStateProperty.all(TextStyle(
                  height: 1.0
                )),
                constraints: BoxConstraints.tight(Size.fromHeight(44)),
                shadowColor: MaterialStateProperty.all(
                  Colors.transparent
                ),
                trailing: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.close)
                  )
                ],
              ),
            ),


            Container(height: 50,),

            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: SearchAnchor.bar(
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<Widget>.generate(
                    5,
                        (int index) {
                      return ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        title: Text('Initial list item $index'),
                      );
                    },
                  );
                },
              ),
            ),

            Container(height: 50,),

            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: SearchAnchor.bar(

                viewConstraints: BoxConstraints(maxHeight: 320),
                barOverlayColor: MaterialStatePropertyAll(Colors.transparent),

                barShape: MaterialStateProperty.all(LinearBorder.none),
                viewShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                constraints: BoxConstraints.tight(Size.fromHeight(48)),
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<Widget>.generate(
                    5,
                        (int index) {
                      return ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        title: Text('Initial list item $index'),
                      );
                    },
                  );
                },
              ),
            ),


            // SearchAnchor(builder: builder, suggestionsBuilder: suggestionsBuilder)
          ],
        ),
      ),
    );
  }
}
