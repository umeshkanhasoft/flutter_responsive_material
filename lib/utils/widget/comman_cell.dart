import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

// This class is use for common for movie and web service part
class CommonCell extends StatefulWidget {
  const CommonCell({super.key, this.element});

  final Map<String, dynamic>? element;

  @override
  State<CommonCell> createState() => _CommonCellState();
}

class _CommonCellState extends State<CommonCell> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // -------------Start image designing for web
    var imageUrl = "${widget.element?['IH']}";
    ui.platformViewRegistry.registerViewFactory(
      '${widget.element?['id']}', // A unique view type identifier
      (int viewId) {
        final img = html.ImageElement();
        img.src = imageUrl;
        img.style.borderRadius = "5%";
        img.style.objectFit = 'cover';
        img.style.height = '100%'; // Set height
        img.style.width = '100%'; // Set width
        return img;
      }, // Set the image source
    );
    // -------------End image designing for web
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          // display image
          HtmlElementView(viewType: '${widget.element?['id']}'),

          //black shade of bottom and movie and webservice name
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.topCenter, // Start from the top
                end: Alignment.bottomCenter, // End at the bottom
                colors: [
                  Color(0xFF000000).withValues(alpha: 0.0),
                  Color(0xFF000000).withValues(alpha: 0.7),
                  Color(0xFF000000).withValues(alpha: 1.0),
                ],
                stops: [
                  0.0,
                  0.7,
                  1.0
                ], // Gradual stop points (can adjust based on needs)
              ),
            ),
            child: Container(
              margin:
                  EdgeInsets.only(left: defaultPadding, bottom: defaultPadding),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("${widget.element?['mn']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.white))),
            ),
          ),

          // youtube link redirection
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 35,
              margin:
                  EdgeInsets.only(top: defaultPadding, right: defaultPadding),
              child: FloatingActionButton.extended(
                backgroundColor: secondaryColor.withValues(alpha: 0.5),
                elevation: 5,
                extendedPadding: EdgeInsets.symmetric(horizontal: 10),
                extendedTextStyle: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                onPressed: () => html.window.open(
                    'https://www.youtube.com/watch?v=${widget.element?['trailer']}',
                    '_blank'),
                icon: Icon(Icons.play_arrow, size: 20, color: Colors.white),
                label: Text(
                  "Trailer",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
