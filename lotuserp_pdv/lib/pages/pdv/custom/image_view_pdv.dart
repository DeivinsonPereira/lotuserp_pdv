import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageViewPdv {
  
  Widget getImage (String ip,String file) {
    try{
      return CachedNetworkImage(
      alignment:
          const Alignment(0, 0),
      imageUrl:
          '${ip}getimagem?categoria=PRO&file=$file&result=URL',
    );
    }catch(e){
      return Container();
    }
  }

}