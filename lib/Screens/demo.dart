import 'package:url_launcher/url_launcher.dart';

// ... other imports

class LoggedInPage extends StatelessWidget {
  const LoggedInPage({Key? key}) : super(key: key);

  Future<void> _launchURL(BuildContext context, String urlString) async {
    try {
      final Uri url = Uri.parse(urlString);
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not open the link: $urlString')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening link: $e')),
        );
      }
    }
  }

  void _handleViewAnalytics(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Analytics Links',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    _launchURL(context, 'https://recommendationapp-9xhvzouxewkvk4vcatztkx.streamlit.app/');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Analytics Link 1',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _launchURL(context, 'https://sales-forecasting-app-trmqssbds3aukgrjdfvev9.streamlit.app/');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Analytics Link 2',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _launchURL(context, 'https://appfraudmldsn-ermuzqwjxv3nmx9bmg9etw.streamlit.app/');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Analytics Link 3',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

// ... rest of your code remains the same
}