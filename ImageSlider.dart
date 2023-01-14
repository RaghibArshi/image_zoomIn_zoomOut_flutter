import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({Key? key, required this.imageList, required this.currentImage}) : super(key: key);
  List imageList = [];
  int currentImage;
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  late PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = PageController(initialPage: widget.currentImage);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: AssetImage('assets/'+widget.imageList[index]),
                initialScale: PhotoViewComputedScale.contained * 0.8,
                // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
              );
            },
            itemCount: widget.imageList.length,
            pageController: controller,
            onPageChanged: (value){
              // widget.currentImage = value;
              print(value);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 30.0, right: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios, color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
