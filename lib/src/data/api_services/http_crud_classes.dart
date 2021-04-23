abstract class Reader<T> {
  Future<T> fetchData(int page);
}

abstract class Poster<T> {
  Future<T> postData();
}

abstract class Upadater<T> {
  Future<T> updateData();
}

abstract class Puter<T> {
  Future<T> putData();
}

abstract class Deleter<T> {
  Future<T> deleteData();
}
