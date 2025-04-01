
import 'package:flutter/material.dart';

@immutable
class MessageModel {
  final String id;
  final String message;
  final bool isUser; //idenfiy ther user

  const MessageModel({required this.id, required this.message, required this.isUser});
}
