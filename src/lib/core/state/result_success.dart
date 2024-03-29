import 'package:wizarding_world/core/state/index.dart';

class ResultSuccess<TResult> extends ResultState<TResult> {
  const ResultSuccess(TResult result) : super(result: result);
}
