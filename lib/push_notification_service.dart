import 'package:flutter/cupertino.dart';
import 'package:googleapis/eventarc/v1.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;



class PushNotificationService
{
  static Future<String> getAccessToken() async
  {
    final serviceAccountJson =
    {

        "type": "service_account",
        "project_id": "tinderclone-bc291",
        "private_key_id": "7c6948a248b1ceefafde807474fdd13c1321bfa9",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDbATOepcQ1XSGZ\nt03cfkGBcMWzuuwSpxZuBqOVIWgX7EN1VQWaYEQu9JNzjDi45Apc831+6fGjX6Bg\n/mBw/gB8NnrhUegIYZhlVPpt0IYlT0fV3kCWzjfhKIBy/EKCgg/ooo276rl202Q9\nikwyXzT9ZnE4i0r7L+u4CqUXC7mISN0F0EY6QsVk7pzFWR4Q8kMeQw7bDFK7IT/N\nzU/yK9yuvr2zarEqEvSw9hjefp71CR/RjUoMQFN42aaR1t79PVv+F0uizpTtE192\nf9xbXOaA314t2za5WAD3Wz+Fh1WkEGclBFcgkpFyMqo3IaF0sGbf9+OVmaA/7Nuw\nqyeSxvK/AgMBAAECggEAJTMjDYOivF3BY1bbhuR7Q/1f15Ocnd571NyT1LUD9WxQ\nWRHEDeDkNAWfNjVPPTie+gLyAijCvrlziIYs44SBmJe4b6V2AFZziGLS1uxgnN3G\nmfFSj0sf+sLibqWitoBZK27RHGZWcnSdxkZDgxrg6VoJSU1/wwL0yyIjwLJhJWDK\nmXCqKm3cAsJrHeYrFRP2giXGK9fBLuOInUym8Y0mJ5ftMWjScIS1FyeVpzeqfjjZ\nRV8KEfJRuoTdcXrDQwyp6lY1qQkmkx0wg7+R91/Vt5XKY/R9IDYNh2MBwo1N0mw2\nTAACmdYvhDsZzatpPs4E6kYJ/RzO82sXZqX11BNSoQKBgQDt+tvqee1YRNYuGOfd\n/WrhAMwG72C9FQ4InFVok8aRmm/3kKHHkNfxamD+upwqsR4DewnFMaFoTU9bcYiP\nLzwSKwA1lXOcfyspqOdI1kKYtZ1XHUkjBPdIO5B+xt4jEV9Aho8UUbQK0NTRUsm3\n0GT2BrDSoH82e8r4LekC6sFrawKBgQDrloQNH4ortVWnDetLaHRxhThJ1o+YzreE\nE0R6OK3JLTA3V1rmQZYijfLpC/AHZrRj2lL2b3JnhG6bMWknqBuqnjHavOTeNPj1\n2byA9ns7r5TFQPtJCn8hGxQKTG88sqgenHkoFuCEvCqn2Ftu4UyNFQBSeMOq+tFV\nz4lIwqve/QKBgF6hPgmC6koLNU+nP6waNQG7m2W2kjUdxjLOV3f6Kx+C1bsPnAUL\nJ5Mrxd4EvkyLmW+w4TW0goZDF6c5AiBNnAltZ+vmvc4hEzzBmRZxfJHUxff6ATcX\npmzmopKG6ZXwNnwmBYcC5iDW4YlK7kNVbpAWIQHgKDW2DAOb3ef3CWp5AoGAQziz\nfTsepdIcGoqyNNYdQ7cLlKYQWz3Ax4Ln6yf5DopCU8gtO75DJKD0SuMJHlOD7WoC\neibasgbruISkyJgDLO/uscdsVqsuzpfOXc3249T50j70dKb2F3Aui7G7m8ouhm2H\ndJTyg21djn8Bt+W5fhgb+2xSCJuA18dcGNLTT9ECgYA0Zoq9iIDyfaM/AeHRqB2D\n5aWjbYF7MZ8qz1QmWBIDYzzFdfqZQQgOyVDrO9hR5OWL4wdFc0zdXvWoO4qSBnFj\ncUSpXfNs8DiO+4wpWezIQh0gI994V63WPRsec2A4eb32R+a46nxJvFs7o4Jlmlqz\nRKe3Hgnm59BYNMn8i8nBYA==\n-----END PRIVATE KEY-----\n",
        "client_email": "flutter-tinder-clone@tinderclone-bc291.iam.gserviceaccount.com",
        "client_id": "103968348373366431213",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-tinder-clone%40tinderclone-bc291.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"

    };

    List<String> scopes =
    [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    //get the access token
    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client
    );

    client.close();

    return credentials.accessToken.data;

  }

  static sendNotificationToSelectedDriver(String deviceToken, BuildContext context, String tripID) async
  {
    String dropOffLocationAddress = Provider.of<AppInfo>(context, listen: false).dropOffLocation!.placeName.toString();
    String pickUpAddress = Provider.of<AppInfo>(context, listen: false).pickUpLocation!.placeName.toString();

    final String serverKey = await getAccessToken();
    String endpointFirebaseCloudMessaging = 'https://fcm.googleapis.com/v1/projects/tinderclone-bc291/messages:send';

    final Map<String, dynamic> message =
    {
      'message':
      {
        'token': deviceToken,
        'notification':
        {
          'title':"",
          'body':"",

        }
      }
    };
  }
}