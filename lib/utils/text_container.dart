import 'package:flutter/material.dart';

class TextContainer extends StatefulWidget {
  final int text;
  final double width;
  final double fontsize;
  const TextContainer({super.key, required this.text, required this.width, required this.fontsize});

  @override
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  final numero = '0';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        //border: Border.all(color: Colors.white)
      ),
      width: (widget.width/3.427586),
      child: Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: <Widget>[
              Visibility(
                visible: (widget.text<10)?true:false,
                  child: Text('${numero}',
                    style: TextStyle(fontSize: widget.fontsize,fontWeight: FontWeight.w100),)
              ),
              Text(
                '${widget.text}',
                style: TextStyle(fontSize: widget.fontsize,fontWeight: FontWeight.w100),
              ),
            ],
          )
      ),
    );
  }
}
