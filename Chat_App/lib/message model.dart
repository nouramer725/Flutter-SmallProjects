
class Message {
  final String message;
  final String Id;
  Message(this.message, this.Id);

  factory Message.fromJson(jsonData) {
    return Message(jsonData['Message'], jsonData['Id']);
  }
}