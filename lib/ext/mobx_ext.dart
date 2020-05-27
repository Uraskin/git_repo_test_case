
import 'package:mobx/mobx.dart';

extension FutureStatusExt on FutureStatus {
  bool get isPendingOrFulfilled =>
      [FutureStatus.fulfilled, FutureStatus.pending].contains(this);
}

extension ObservableListExt<T> on Iterable<T> {
  ObservableList<T> toObservableList() {
    return ObservableList.of(this);
  }
}

extension ObservableFutureExt<T> on T {
  ObservableFuture<T> toObservableFutureValue() {
    return ObservableFuture.value(this);
  }
}

extension ObservableFutureExtOnFuture<T> on Future<T> {
  ObservableFuture<T> toObservableFuture() {
    return ObservableFuture(this);
  }
}