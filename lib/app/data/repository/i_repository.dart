import 'package:codequizzers/app/core/provider/i_provider.dart';

abstract class IRepository<T> {
  IProvider<T> get provider;
}
