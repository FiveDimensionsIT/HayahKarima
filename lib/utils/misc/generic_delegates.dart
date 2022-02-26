// region Action

typedef void Action();

typedef void Action1<T1>(T1 t1);

typedef void Action2<T1, T2>(T1 t1, T2 t2);

typedef void Action3<T1, T2, T3>(T1 t1, T2 t2, T3 t3);

typedef void Action4<T1, T2, T3, T4>(T1 t1, T2 t2, T3 t3, T4 t4);

typedef void Action5<T1, T2, T3, T4, T5>(T1 t1, T2 t2, T3 t3, T4 t4, T5 t5);

typedef void Action6<T1, T2, T3, T4, T5, T6>(
    T1 t1, T2 t2, T3 t3, T4 t4, T5 t5, T6 t6);

//endregion

//region Func

typedef R Func<R>();

typedef R Func1<R, T1>(T1 t1);

typedef R Func2<R, T1, T2>(T1 t1, T2 t2);

typedef R Func3<R, T1, T2, T3>(T1 t1, T2 t2, T3 t3);

typedef R Func4<R, T1, T2, T3, T4>(T1 t1, T2 t2, T3 t3, T4 t4);

typedef R Func5<R, T1, T2, T3, T4, T5>(T1 t1, T2 t2, T3 t3, T4 t4, T5 t5);

typedef R Func6<R, T1, T2, T3, T4, T5, T6>(
    T1 t1, T2 t2, T3 t3, T4 t4, T5 t5, T6 t6);

//endregion

//region Tuple

class Tuble1<T1> {
  T1 item1;

  Tuble1(this.item1);
}

class Tuble2<T1, T2> {
  T1 item1;
  T2 item2;

  Tuble2(this.item1, this.item2);
}

class Tuble3<T1, T2, T3> {
  T1 item1;
  T2 item2;
  T3 item3;

  Tuble3(this.item1, this.item2, this.item3);
}

class Tuble4<T1, T2, T3, T4> {
  T1 item1;
  T2 item2;
  T3 item3;
  T4 item4;

  Tuble4(this.item1, this.item2, this.item3, this.item4);
}

class Tuble5<T1, T2, T3, T4, T5> {
  T1 item1;
  T2 item2;
  T3 item3;
  T4 item4;
  T5 item5;

  Tuble5(this.item1, this.item2, this.item3, this.item4, this.item5);
}

class Tuble6<T1, T2, T3, T4, T5, T6> {
  T1 item1;
  T2 item2;
  T3 item3;
  T4 item4;
  T5 item5;
  T6 item6;

  Tuble6(
      this.item1, this.item2, this.item3, this.item4, this.item5, this.item6);
}

//endregion
