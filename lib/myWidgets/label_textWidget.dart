import 'package:flutter/material.dart';

class Label_TextWidget extends StatefulWidget {
  TextEditingController tec1 = new TextEditingController();
  String label_Metin;
  String textField_Metin;
  bool sifreMi;


  Label_TextWidget(this.tec1,this.label_Metin,this.textField_Metin,this.sifreMi, {Key key}) : super(key: key);

  @override
  _Label_TextWidgetState createState() => _Label_TextWidgetState();
}

class _Label_TextWidgetState extends State<Label_TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(widget.label_Metin),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: widget.sifreMi,
              controller: widget.tec1,
              decoration: InputDecoration(
                  labelText: widget.textField_Metin, border: OutlineInputBorder()),
            ),
          ),
        ),
      ],
    );
  }
}
