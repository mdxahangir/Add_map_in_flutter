import 'package:hive_flutter/hive_flutter.dart';
import '../models/user.dart';
import '../models/address.dart';
import '../models/geo.dart';
import '../models/company.dart';

class DBHelper {
  static Box? _userBox;
  static const String USER_BOX = 'user_box';
  static bool _isInitialized = false;

  static Future<void> initDB() async {
    if (_isInitialized) return;
    
    try {
      await Hive.initFlutter();
      _userBox = await Hive.openBox(USER_BOX);
      _isInitialized = true;
      print('✅ Hive initialized successfully');
    } catch (e) {
      print('❌ Error initializing Hive: $e');
      rethrow;
    }
  }

  static Future<Box> getUserBox() async {
    if (_userBox == null || !_isInitialized) {
      await initDB();
    }
    return _userBox!;
  }

  static Future<void> insertOrUpdateUser(User user) async {
    final box = await getUserBox();
    await box.put('user_${user.id}', {
      'id': user.id,
      'name': user.name,
      'username': user.username,
      'email': user.email,
      'street': user.address.street,
      'suite': user.address.suite,
      'city': user.address.city,
      'zipcode': user.address.zipcode,
      'lat': user.address.geo.lat,
      'lng': user.address.geo.lng,
      'phone': user.phone,
      'website': user.website,
      'companyName': user.company.name,
      'catchPhrase': user.company.catchPhrase,
      'bs': user.company.bs,
    });
    await box.put('current_user_id', user.id);
  }

  static Future<User?> getUser(int id) async {
    final box = await getUserBox();
    final data = box.get('user_$id');

    if (data != null && data is Map) {
      return User(
        id: data['id'] as int,
        name: data['name'] as String,
        username: data['username'] as String,
        email: data['email'] as String,
        phone: data['phone'] as String,
        website: data['website'] as String,
        address: Address(
          street: data['street'] as String,
          suite: data['suite'] as String,
          city: data['city'] as String,
          zipcode: data['zipcode'] as String,
          geo: Geo(
            lat: data['lat'] as String,
            lng: data['lng'] as String,
          ),
        ),
        company: Company(
          name: data['companyName'] as String,
          catchPhrase: data['catchPhrase'] as String,
          bs: data['bs'] as String,
        ),
      );
    }
    return null;
  }

  static Future<User?> getCurrentUser() async {
    final box = await getUserBox();
    final userId = box.get('current_user_id');
    if (userId != null) {
      return await getUser(userId as int);
    }
    return null;
  }

  static Future<void> clearUserData() async {
    final box = await getUserBox();
    await box.delete('current_user_id');
  }

  static Future<void> deleteUser(int id) async {
    final box = await getUserBox();
    await box.delete('user_$id');
  }
}