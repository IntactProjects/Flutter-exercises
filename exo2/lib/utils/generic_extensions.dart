extension<T> on T? {
  // ignore: unused_element
  R? let<R>(R? Function(T value) cb) {
    return this == null ? null : cb(this!);
  }
}
