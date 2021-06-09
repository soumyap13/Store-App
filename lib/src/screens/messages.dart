import '../models/conversation.dart' as model;
import '../widgets/EmptyMessagesWidget.dart';
import '../widgets/MessageItemWidget.dart';
import '../widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatefulWidget {
  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  var topNavigator1 = true,
      topNavigator2 = false,
      topNavigator3 = false,
      topNavigator4 = false;
  model.ConversationsList _conversationList;
  @override
  void initState() {
    this._conversationList = new model.GroupConversationsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    onPressed: () {
                      setState(() {
                        _conversationList = new model.GroupConversationsList();
                        topNavigator1 = true;
                        topNavigator2 = false;
                        topNavigator3 = false;
                        topNavigator4 = false;
                      });
                    },
                    child: topNavigator1
                        ? topNavigator("Group", Theme.of(context).hintColor)
                        : topNavigator("Group", null),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    onPressed: () {
                      setState(() {
                        _conversationList = new model.ConversationsList();
                        topNavigator1 = false;
                        topNavigator2 = true;
                        topNavigator3 = false;
                        topNavigator4 = false;
                      });
                    },
                    child: topNavigator2
                        ? topNavigator("Chats", Theme.of(context).hintColor)
                        : topNavigator("Chats", null),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    onPressed: () {
                      setState(() {
                        _conversationList = new model.ConversationsList();
                        topNavigator1 = false;
                        topNavigator2 = false;
                        topNavigator3 = true;
                        topNavigator4 = false;
                      });
                    },
                    child: topNavigator3
                        ? topNavigator("Contacts", Theme.of(context).hintColor)
                        : topNavigator("Contacts", null),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    onPressed: () {
                      setState(() {
                        _conversationList =
                            new model.PeopleNearbyConversationsList();
                        topNavigator1 = false;
                        topNavigator2 = false;
                        topNavigator3 = false;
                        topNavigator4 = true;
                      });
                    },
                    child: topNavigator4
                        ? topNavigator("Nearby", Theme.of(context).hintColor)
                        : topNavigator("Nearby", null),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBarWidget(),
          ),
          Offstage(
            offstage: _conversationList.conversations.isEmpty,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 15),
              shrinkWrap: true,
              primary: false,
              itemCount: _conversationList.conversations.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 7);
              },
              itemBuilder: (context, index) {
                return MessageItemWidget(
                  message: _conversationList.conversations.elementAt(index),
                  onDismissed: (conversation) {
                    setState(() {
                      _conversationList.conversations.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          Offstage(
            offstage: _conversationList.conversations.isNotEmpty,
            child: EmptyMessagesWidget(),
          )
        ],
      ),
    );
  }

  Widget topNavigator(String text, Color color) {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          height: 3.0,
          color: color,
        ),
      ],
    );
  }
}
