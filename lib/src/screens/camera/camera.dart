import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  static String routeName = '/camera';
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  double zoomLevel = 1.0;
  Offset translation = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text('CAMERA-001'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            translation += details.delta / zoomLevel;
          });
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.scale(
                scale: zoomLevel,
                child: Transform.translate(
                  offset: translation,
                  child: Container(
                    color: Colors.grey,
                    child: Image.asset(
                      'assets/images/room.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ActionButton(
              onPressed: () {
                setState(() {
                  zoomLevel += 0.1;
                });
              },
              icon: const Icon(
                Icons.zoom_in,
                color: Colors.white,
              ),
            ),
            ActionButton(
              onPressed: () {
                setState(() {
                  zoomLevel -= 0.1;
                });
              },
              icon: const Icon(
                Icons.zoom_out,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  const ActionButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(5),
      child: MaterialButton(
        color: Colors.blue,
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
