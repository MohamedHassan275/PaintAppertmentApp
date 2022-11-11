import 'package:logger/logger.dart';

class LoggerHelper {
  static late Logger logger;
  static late Logger loggerNoStack;
  static init() {
    logger = Logger(
      //printer: Pretty//printer(),
    );
    loggerNoStack = Logger(
      //printer: Pretty//printer(methodCount: 0),
    );
  }
}
