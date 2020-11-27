import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final Map<String, dynamic> _data;
  final bool _mine;

  ChatMessage(this._data, this._mine);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: [
          !_mine
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_data['senderPhotoUrl']),
                  ),
                )
              : Container(),
          Expanded(
              child: Column(
            crossAxisAlignment:
                _mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              _data['imgUrl'] != null
                  ? Image.network(
                      _data['imgUrl'],
                      width: 250,
                    )
                  : Text(
                      _data['text'],
                      textAlign: _mine ? TextAlign.end : TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
              Text(_data['senderName'],
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
            ],
          )),
          _mine
              ? Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_data['senderPhotoUrl']),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
