 import 'package:cloud_firestore/cloud_firestore.dart';

final productsCollection = FirebaseFirestore.instance.collection("products");
final categoriesCollection = FirebaseFirestore.instance.collection("categories");
final usersCollection = FirebaseFirestore.instance.collection("users");
final likeDislikesCollection = FirebaseFirestore.instance.collection("likeDislikes");