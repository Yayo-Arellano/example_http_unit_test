# Flutter Example: Unit testing [http](https://pub.dev/packages/http) requests

Flutter Version: Stable 1.22.6

The main purpose of this example is unit testing https requests. Also, you can see how to handle Exceptions 
thrown in the data layer in the presentation layer. 

We are going to build a small top headlines app to demonstrate how to unit test https request.


| Success Response | Handle ApiKey Invalid | Handle ApiKey missing |
| ---------------- | --------------------- | --------------------- |
| ![](images/Image 1.png) |![](images/Image 2.png) |![](images/Image 3.png) |

# Prerequisites (Optional)

**To run the unit tests is not necessary to get an API key**

- Get an API key from [https://newsapi.org/](https://newsapi.org/)
- Add the API key in the `NewsProvider` class
      
  ````
  class NewsProvider {
    static const String _apiKey = 'Change to your own api key';
  ````
  
- Run the command `pub run build_runner watch --delete-conflicting-outputs` to generate the code. 
