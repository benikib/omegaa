
import 'package:flutter/material.dart';
navigation(context,pageCible){
  Navigator.pop(context);
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext cnt)
  {
    return pageCible;
  }

  ));
}