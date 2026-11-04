module {
  func.func @arrayOperations(%arg0: !smt.bool) {
    %0 = smt.array.broadcast %arg0 {smt.some_attr} : !smt.array<[!smt.bool -> !smt.bool]>
    %1 = smt.array.select %0[%arg0] {smt.some_attr} : !smt.array<[!smt.bool -> !smt.bool]>
    %2 = smt.array.store %0[%arg0], %arg0 {smt.some_attr} : !smt.array<[!smt.bool -> !smt.bool]>
    return
  }
}

