import 'package:flutter/material.dart';
import 'package:demoapp/models/note_model.dart';
import 'package:demoapp/screens/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.onNoteDeleted, required this.index});

  final Note note;
  final int index;
  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {

    var time = DateTime.now();
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteView(note: note, index: index, onNoteDeleted: onNoteDeleted,)));
      },
      child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      note.body,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('Current Time: ${time.hour}:${time.minute}:${time.second}'),
                    Text('Current Date: ${time.day}:${time.month}:${time.year}')

                  ],
                ),
              ),
            ),
    );
  }
}