import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import '../common/noon_appbar.dart';
import '../common/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart' show rootBundle;
import '../page2/openCamera.dart';
import 'package:camera/camera.dart';

class SingleCropper extends StatefulWidget {
  const SingleCropper({Key? key}) : super(key: key);

  @override
  _SingleCropperState createState() => _SingleCropperState();
}

class _SingleCropperState extends State<SingleCropper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: new SideBar(),
        body: Stack(children: <Widget>[
          Container(
            color: Colors.black12,
            height: (MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top) * 0.75,// Your screen background color
            margin: EdgeInsets.only(top:AppBar().preferredSize.height +  MediaQuery.of(context).padding.top),
          ),
          Center(
            child: Cropper(),
          ),
          TransparentAppBar(),
        ]),
    );
  }
}


class Cropper extends StatefulWidget {
  @override
  _CropperState createState() => _CropperState();
}

class _CropperState extends State<Cropper> {
  static const _images = const [
    'imgs/apple-logo.png',
    'imgs/main.jpg',
  ];

  final _cropController = CropController();
  final _imageDataList = <Uint8List>[];

  var _loadingImage = false;
  var _currentImage = 0;
  set currentImage(int value) {
    setState(() {
      _currentImage = value;
    });
    _cropController.image = _imageDataList[_currentImage];
  }

  var _isSumbnail = false;
  var _isCropping = false;
  var _isCircleUi = false;
  Uint8List? _croppedData;

  @override
  void initState() {
    _loadAllImages();
    super.initState();
  }

  Future<void> _loadAllImages() async {
    setState(() {
      _loadingImage = true;
    });
    for (final assetName in _images) {
      _imageDataList.add(await _load(assetName));
    }
    setState(() {
      _loadingImage = false;
    });
  }

  Future<Uint8List> _load(String assetName) async {
    final assetData = await rootBundle.load(assetName);
    return assetData.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Visibility(
          visible: !_loadingImage && !_isCropping,
          child: Column(
            children: [
              if (_imageDataList.length >= 4)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      _buildSumbnail(_imageDataList[0]),
                      const SizedBox(width: 16),
                      _buildSumbnail(_imageDataList[1]),
                      const SizedBox(width: 16),
                      _buildSumbnail(_imageDataList[2]),
                      const SizedBox(width: 16),
                      _buildSumbnail(_imageDataList[3]),
                    ],
                  ),
                ),
              //Expanded(
              Container(
                height: (MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top) * 0.75,
                child: Visibility(
                  visible: _croppedData == null,
                  child: Stack(
                    children: [
                      if (_imageDataList.isNotEmpty)
                        Crop(
                          controller: _cropController,
                          image: _imageDataList[_currentImage],
                          onCropped: (croppedData) {
                            setState(() {
                              _croppedData = croppedData;
                              _isCropping = false;
                            });
                          },
                          withCircleUi: _isCircleUi,
                          onStatusChanged: (CropStatus status) => {
                              // CropStatus.nothing: print('Crop has no image data'),
                              // CropStatus.loading: print('Crop is now loading given image'),
                              // CropStatus.ready: print('crop is ready'),
                              // CropStatus.cropping: print('Crop is now cropping image'),
                          },
                          initialSize: 0.5,
                          maskColor: _isSumbnail ? Colors.white : null,
                          cornerDotBuilder: (size, edgeAlignment) => _isSumbnail
                              ? const SizedBox.shrink()
                              : const DotControl(),
                        ),
                      Positioned(
                        right: 16,
                        bottom: 16,
                        child: GestureDetector(
                          onTapDown: (_) => setState(() => _isSumbnail = true),
                          onTapUp: (_) => setState(() => _isSumbnail = false),
                          child: CircleAvatar(
                            backgroundColor:
                            _isSumbnail ? Colors.blue.shade50 : Colors.blue,
                            child: Center(
                              child: Icon(Icons.crop_free_rounded),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  replacement: Center(
                    child: _croppedData == null
                        ? SizedBox.shrink()
                        : Image.memory(_croppedData!),
                  ),
                ),
              ),

              if (_croppedData == null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.crop_7_5),
                            onPressed: () {
                              _isCircleUi = false;
                              _cropController.aspectRatio = 16 / 4;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.crop_16_9),
                            onPressed: () {
                              _isCircleUi = false;
                              _cropController.aspectRatio = 16 / 9;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.crop_5_4),
                            onPressed: () {
                              _isCircleUi = false;
                              _cropController.aspectRatio = 4 / 3;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.crop_square),
                            onPressed: () {
                              _isCircleUi = false;
                              _cropController
                                ..withCircleUi = false
                                ..aspectRatio = 1;
                            },
                          ),
                          IconButton(
                              icon: Icon(Icons.circle),
                              onPressed: () {
                                _isCircleUi = true;
                                _cropController.withCircleUi = true;
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        height:(MediaQuery.of(context).size.height -
                            AppBar().preferredSize.height -
                            MediaQuery.of(context).padding.top) * 0.15,
                        child: IconButton(
                            onPressed: () => main(),
                            tooltip: 'retake',
                            icon: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: SvgPicture.asset(
                                'imgs/redo.svg',
                                alignment: Alignment.centerRight,
                                placeholderBuilder: (BuildContext context) => Container(
                                    child: const CircularProgressIndicator()
                                ),
                              ),
                            )
                        ),
                      )
                  ),
                  //Spacer(),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        height:(MediaQuery.of(context).size.height -
                            AppBar().preferredSize.height -
                            MediaQuery.of(context).padding.top) * 0.15,
                        child:IconButton(
                          onPressed: (){
                            setState(() {
                            _isCropping = true;
                            });
                            _isCircleUi
                            ? _cropController.cropCircle()
                                : _cropController.crop();
                          },
                          tooltip: 'Submit',
                          icon: SvgPicture.asset(
                            'imgs/redo.svg',
                            alignment: Alignment.centerRight,
                            placeholderBuilder: (BuildContext context) => Container(
                                child: const CircularProgressIndicator()
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                          '다시 찍기',
                          style: TextStyle(
                            //color: Colors.white,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1
                              ..color = Colors.lightBlueAccent,
                          ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Spacer(),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(
                          '제출 하기',
                          style: TextStyle(
                          //color: Colors.white,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1
                              ..color = Colors.lightBlueAccent,
                         ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          replacement: const CircularProgressIndicator(),
        ),
      ),


    );
  }

  Expanded _buildSumbnail(Uint8List data) {
    final index = _imageDataList.indexOf(data);
    return Expanded(
      child: InkWell(
        onTap: () {
          _croppedData = null;
          currentImage = index;
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: index == _currentImage
                ? Border.all(
              width: 8,
              color: Colors.blue,
            )
                : null,
          ),
          child: Image.memory(
            data,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}