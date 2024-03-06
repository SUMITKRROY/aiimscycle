import 'dart:math';

String generateCaptcha({int length = 6}) {
  const characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  String captcha = '';

  for (int i = 0; i < length; i++) {
    captcha += characters[random.nextInt(characters.length)];
  }

  return captcha;
}

void main() {
  String captcha = generateCaptcha();
  print('Generated CAPTCHA: $captcha');
}
