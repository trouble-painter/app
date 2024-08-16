typedef VoidParam = void;

abstract interface class BaseUsecase<Param, Result> {
  Result call(Param param);
}
