class ChatMessage {
  final String sender;
  final String profileImage;
  final String location;
  final String sendDate;
  final String message;
  final String? imageUri;

  ChatMessage({
    required this.sender,
    required this.profileImage,
    required this.location,
    required this.sendDate,
    required this.message,
    this.imageUri,
  });
}

List<ChatMessage> chatMessageList = [
  ChatMessage(
    sender: '당근이, ',
    profileImage: 'https://placeimg.com/200/100/people/grayscale',
    location: '대부동',
    sendDate: '1일전',
    message: 'developer 님,근처에 다양한 물품들이 아주 많이있습니다.',
  ),
  ChatMessage(
      sender: 'Flutter ',
      profileImage: 'https://placeimg.com/200/100/people',
      location: '중동',
      sendDate: '2일전',
      message: '안녕하세요 지금 다 예약 상태 인가요?',
      imageUri: 'https://placeimg.com/200/100/tech/grayscale')
];
