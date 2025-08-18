abstract class OutboxQueue<T> {
	Future<void> enqueue(T item);
	Stream<T> watch();
	Future<List<T>> pending();
}