import 'package:bloc/src/blocs/blocs.dart';
import 'package:bloc/src/models/models.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  final int userId;

  UserDetail({Key key, @required this.userId}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  //TODO implement the ability to edit
  bool _edit;

  @override
  void initState() {
    _edit = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = UsersProvider.of(context);

    return StreamBuilder(
      stream: bloc.users,
      builder: (context, AsyncSnapshot<List<User>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final user = snapshot.data
            .firstWhere((user) => user.id == widget.userId, orElse: () => null);

        return buildPage(user);
      },
    );
  }

  Widget buildPage(User user) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(),
                head(user),
                subhead(),
                label('Name'),
                name(user),
                label('Email'),
                email(user),
                label('Phone'),
                phone(user),
                label('Website'),
                website(user),
                label('Company'),
                companyName(user),
                Row(
                  children: [
                    Expanded(child: label('City')),
                    horizontalSpace(24.0),
                    Expanded(child: label('Street')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: addressCity(user.address)),
                    horizontalSpace(24.0),
                    Expanded(child: addressStreet(user.address)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: label('Suite')),
                    horizontalSpace(24.0),
                    Expanded(child: label('Zip Code')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: addressSuite(user.address)),
                    horizontalSpace(24.0),
                    Expanded(child: addressZipcode(user.address)),
                  ],
                ),
                verticalSpace(24.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        horizontalSpace(16.0),
        Text(
          'PROFILE',
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }

  Widget head(User user) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70,
            child: Image(image: AssetImage('assets/images/profile.png')),
          ),
          Positioned(
              bottom: 0.0,
              right: 0.0,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 25.0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.camera_alt),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ))
        ],
      ),
    );
  }

  Widget subhead() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Personal Information',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          horizontalSpace(16.0),
          _edit
              ? Container()
              : Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: editIcon(),
                  ),
                )
        ],
      ),
    );
  }

  Widget editIcon() {
    return CircleAvatar(
      backgroundColor: Colors.red,
      radius: 14.0,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.edit,
          size: 14.0,
        ),
        color: Colors.white,
        onPressed: () {
          setState(() {
            _edit = true;
          });
        },
      ),
    );
  }

  Widget label(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget horizontalSpace(double width) {
    return SizedBox(width: width);
  }

  Widget verticalSpace(double height) {
    return SizedBox(height: height);
  }

  Widget name(User user) {
    return TextField(
      controller: TextEditingController(text: user.name),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'Enter Name',
        enabled: _edit,
      ),
    );
  }

  Widget email(User user) {
    return TextField(
      controller: TextEditingController(text: user.email),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter Email',
        enabled: _edit,
      ),
    );
  }

  Widget phone(User user) {
    return TextField(
      controller: TextEditingController(text: user.phone),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Enter Phone',
        enabled: _edit,
      ),
    );
  }

  Widget website(User user) {
    return TextField(
      controller: TextEditingController(text: user.website),
      keyboardType: TextInputType.url,
      decoration: InputDecoration(
        hintText: 'Enter Website',
        enabled: _edit,
      ),
    );
  }

  Widget companyName(User user) {
    return TextField(
      controller: TextEditingController(text: user.company.name),
      decoration: InputDecoration(
        hintText: 'Enter Company Name',
        enabled: _edit,
      ),
    );
  }

  Widget addressCity(Address address) {
    return TextField(
      controller: TextEditingController(text: address.city),
      decoration: InputDecoration(
        hintText: 'Enter City',
        enabled: _edit,
      ),
    );
  }

  Widget addressStreet(Address address) {
    return TextField(
      controller: TextEditingController(text: address.street),
      decoration: InputDecoration(
        hintText: 'Enter Street',
        enabled: _edit,
      ),
    );
  }

  Widget addressSuite(Address address) {
    return TextField(
      controller: TextEditingController(text: address.suite),
      decoration: InputDecoration(
        hintText: 'Enter Suite',
        enabled: _edit,
      ),
    );
  }

  Widget addressZipcode(Address address) {
    return TextField(
      controller: TextEditingController(text: address.zipcode),
      decoration: InputDecoration(
        hintText: 'Enter Zip Code',
        enabled: _edit,
      ),
    );
  }
}
