module {
  emitc.func @emitc_do(%arg0: !emitc.ptr<i32>) {
    %0 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32>
    %1 = literal "10" : i32
    %2 = literal "1" : i32
    do {
      verbatim "printf(\22%d\22, *{});" args %arg0 : !emitc.ptr<i32>
      %3 = load %0 : <i32>
      %4 = add %3, %2 : (i32, i32) -> i32
      assign %4 : i32 to %0 : <i32>
    } while {
      %3 = expression %0, %1 : (!emitc.lvalue<i32>, i32) -> i1 {
        %4 = load %0 : <i32>
        %5 = cmp le, %4, %1 : (i32, i32) -> i1
        yield %5 : i1
      }
      yield %3 : i1
    }
    return
  }
  emitc.func @emitc_do_with_expression(%arg0: !emitc.ptr<i32>) {
    %0 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32>
    %1 = literal "10" : i32
    %2 = literal "1" : i32
    %3 = expression %1, %2 : (i32, i32) -> i32 {
      %4 = add %1, %2 : (i32, i32) -> i32
      yield %4 : i32
    }
    do {
      verbatim "printf(\22%d\22, *{});" args %arg0 : !emitc.ptr<i32>
      %4 = load %0 : <i32>
      %5 = add %4, %2 : (i32, i32) -> i32
      assign %5 : i32 to %0 : <i32>
    } while {
      %4 = expression %0, %3 : (!emitc.lvalue<i32>, i32) -> i1 {
        %5 = load %0 : <i32>
        %6 = cmp le, %5, %3 : (i32, i32) -> i1
        yield %6 : i1
      }
      yield %4 : i1
    }
    return
  }
  emitc.func @emitc_double_do() {
    %0 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32>
    %1 = "emitc.variable"() <{value = 0 : i32}> : () -> !emitc.lvalue<i32>
    %2 = literal "1" : i32
    %3 = literal "3" : i32
    %4 = literal "5" : i32
    do {
      %5 = load %0 : <i32>
      do {
        %7 = load %1 : <i32>
        verbatim "printf(\22i = %d, j = %d\22, {}, {});" args %5, %7 : i32, i32
        %8 = add %7, %2 : (i32, i32) -> i32
        assign %8 : i32 to %1 : <i32>
      } while {
        %7 = expression %1, %4 : (!emitc.lvalue<i32>, i32) -> i1 {
          %8 = load %1 : <i32>
          %9 = cmp le, %8, %4 : (i32, i32) -> i1
          yield %9 : i1
        }
        yield %7 : i1
      }
      %6 = add %5, %2 : (i32, i32) -> i32
      assign %6 : i32 to %0 : <i32>
    } while {
      %5 = expression %0, %3 : (!emitc.lvalue<i32>, i32) -> i1 {
        %6 = load %0 : <i32>
        %7 = cmp le, %6, %3 : (i32, i32) -> i1
        yield %7 : i1
      }
      yield %5 : i1
    }
    return
  }
  emitc.func @payload_do_with_empty_body(%arg0: i32, %arg1: i32) -> i1 {
    %0 = cmp lt, %arg0, %arg1 : (i32, i32) -> i1
    return %0 : i1
  }
  func.func @emitc_do_with_empty_body(%arg0: i32, %arg1: i32) {
    emitc.do {
    } while {
      %0 = expression %arg0, %arg1 : (i32, i32) -> i1 {
        %1 = call @payload_do_with_empty_body(%arg0, %arg1) : (i32, i32) -> i1
        yield %1 : i1
      }
      yield %0 : i1
    }
    return
  }
}

