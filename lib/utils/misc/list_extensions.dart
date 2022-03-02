extension ListExtensions<Y> on List<Y> {
  List<List<Y>> splitToChunks<T>(int chunkLength) {
    List<List<Y>> chunks = [];

    for (var i = 0; i < length; i += chunkLength) {
      var end = (i + chunkLength < length) ? i + chunkLength : length;
      chunks.add(this.sublist(i, end));
    }
    //
    return chunks;
  }
}
