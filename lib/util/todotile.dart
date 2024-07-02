import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';


class TodoTile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  final String helpNote;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  final Function(BuildContext)? getHelpNote;

  TodoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.helpNote,
    required this.getHelpNote,
  }) : super(key: key);

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromARGB(235, 236, 213, 11),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: widget.taskCompleted,
                    onChanged: widget.onChanged,
                    activeColor: Colors.black,
                  ),
                  Expanded(
                    child: Text(
                      widget.taskName,
                      style: TextStyle(
                        decoration: widget.taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.auto_awesome),
                    onPressed: () => widget.getHelpNote?.call(context),
                  ),
                ],
              ),
              if (widget.helpNote.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      // Handle tapping on the help note area if needed
                    },
                    child: Linkify(
                      onOpen: (link) => _launchInBrowserView(Uri.parse(link.url)),
                      text: widget.helpNote,
                      style: TextStyle(fontSize: 14),
                      linkStyle: TextStyle(color: const Color.fromARGB(255, 6, 68, 119)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
