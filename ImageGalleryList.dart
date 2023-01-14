import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_view_flutter/ImageSlider.dart';

class ImageGalleryList extends StatefulWidget {
  const ImageGalleryList({Key? key}) : super(key: key);

  @override
  State<ImageGalleryList> createState() => _ImageGalleryListState();
}

class _ImageGalleryListState extends State<ImageGalleryList> {
  List bigImgList = ['img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', 'img5.jpg', 'img6.jpg', 'img7.jpg', 'img9.jpg', 'img10.jpg', 'img11.jpg' ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Image Slider'
          ),
        ),
        body: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 3 : 4,
                    childAspectRatio: 1.0
                  // childAspectRatio: (itemWidth / itemHeight),
                ),
                shrinkWrap: true,
                // itemCount: imageGalleryModel!.galleryDetails!.gallery!.length,
                itemCount: bigImgList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ImageSlider(imageList: bigImgList, currentImage: index,);
                      }));
                    },
                    child: Card(
                        color: Colors.white70,
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/'+bigImgList[index],
                              fit: BoxFit.cover),
                        )),
                  );
                },
              ),
            ),
    );
  }
}
