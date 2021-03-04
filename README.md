# Flutter Example: Unit testing [http](https://pub.dev/packages/http) requests

Flutter Version: Stable 2.0.0

The main purpose of this example is unit testing [https requests](https://pub.dev/packages/http). Also, you can see how to handle Exceptions thrown in
the data layer in the presentation layer.

We are going to build a small top headlines app to demonstrate how to unit test https request.

# Prerequisites (Optional)

**To run the unit tests is not necessary to get an API key**

- Get an API key from [https://newsapi.org/](https://newsapi.org/)
- Add the API key in the `NewsProvider` class

  ````
  class NewsProvider {
    static const String _apiKey = 'Change to your own api key';
  ````

- Run the command `flutter pub run build_runner watch --delete-conflicting-outputs` to generate the code. 

# Screenshots
| Success Response | Handle ApiKey Invalid | Handle ApiKey missing |
| ---------------- | --------------------- | --------------------- |
| ![Image 1](https://github.com/Yayo-Arellano/example_http_unit_test/blob/master/images/Image%201.png?raw=true) |![Image 2](https://github.com/Yayo-Arellano/example_http_unit_test/blob/master/images/Image%202.png?raw=true) |![Image 3](https://github.com/Yayo-Arellano/example_http_unit_test/blob/master/images/Image%203.png?raw=true) |

