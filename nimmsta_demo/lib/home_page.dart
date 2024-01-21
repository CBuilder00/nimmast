import 'package:flutter/material.dart';
import 'package:nimmsta_lib/nimmsta_exception.dart';
import 'package:nimmsta_lib/nimmsta_lib.dart';
import 'package:nimmsta_model/nimmsta_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserClient _userClient;
  List<User> _users = [];
  bool _isLoading = false;
  String _error = '';

  @override
  void initState() {
    super.initState();
    // Instantiate an instance of UserClient and use throughout the screen. UserClient could be
    // intantiated any number of times at any scope (i.e. at app level or screen level).
    _userClient = UserClient();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Placeholder Users'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? Center(
                  child: Text(
                    _error,
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (_, index) {
                    final user = _users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteUser(user.id),
                      ),
                    );
                  },
                ),
    );
  }

  Future<void> _getUsers() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });
    try {
      // Use the UserClient instance to access different data operations.
      final users = await _userClient.getUsers();
      setState(() => _users = users);
    } catch (e) {
      setState(() {
        _handleError(e);
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _deleteUser(int id) async {
    final confirmed = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Deletion'),
        content: Text('Are you sure you?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        // Use the UserClient instance to access different data operations.
        await _userClient.deleteUser(id);
        _getUsers();
      } catch (e) {
        setState(() {
          _handleError(e);
        });
      }
    }
  }

  void _handleError(Object e) {
    // Handle different type of exceptions thrown by UserClient methods, and customize
    // behavior as needed. Show user message or log error.
    if (e is ResponseException) {
      _error = 'An error has occured.';
    } else if (e is TimeoutException) {
      _error =
          'A timeout has happened, please check your connection or try again later.';
    } else if (e is NetworkException) {
      _error = 'An error has occured.';
    } else {
      _error = 'An error has occured.';
    }
    print(e);
  }
}
