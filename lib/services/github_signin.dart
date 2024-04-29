import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class GitHubSignIn2 {
  final String clientId;
  final String clientSecret;
  final String redirectUrl;

  GitHubSignIn2({
    required this.clientId,
    required this.clientSecret,
    required this.redirectUrl,
  });

  Future<void> _launchURL(Uri url, BuildContext context) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('kontol');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
        ),
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    final url = 'https://github.com/settings/applications';
    try {
      await _launchURL(Uri.parse(url), context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  Future<String> signIn(BuildContext context) async {
    try {
      // Step 1: Construct the GitHub OAuth URL
      final authUrl = Uri.https('github.com', '/login/oauth/authorize', {
        'client_id': clientId,
        'redirect_uri': redirectUrl,
        'scope': 'public_repo%20read:user%20user:email',
      });
      print(authUrl);

      // Step 2: Redirect the user to the GitHub OAuth URL
      // This step should be handled by your UI layer
      _launchURL(authUrl, context);

      // Step 3: Handle the response after the user grants permission
      // For demonstration purposes, let's assume you receive a code parameter after redirection
      final code = 'your_received_code_here';

      // Step 4: Exchange the code for an access token
      final tokenUrl = Uri.https('github.com', '/login/oauth/access_token');
      final response = await http.post(
        tokenUrl,
        body: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'code': code,
          'redirect_uri': redirectUrl,
        },
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Step 5: Parse the access token from the response
        final responseData = json.decode(response.body);
        final accessToken = responseData['access_token'];

        // Step 6: Create a credential from the access token
        // final githubAuthCredential = GithubAuthProvider.credential(accessToken);

        // // Step 7: Sign in with Firebase using the credential
        // final userCredential = await FirebaseAuth.instance
        //     .signInWithCredential(githubAuthCredential);
        return accessToken;
      } else {
        // Handle error cases, such as non-200 status code

        throw "Failed to sign in with GitHub: ${response.body}";
      }
    } catch (e) {
      throw "Failed to sign in with GitHub: ${e.toString()}";
    }
  }
}
