module {
  func.func @add_same_for_both(%arg0: index) -> i1 {
    %idx1 = index.constant 1
    %idx4294967294 = index.constant 4294967294
    %0 = index.minu %arg0, %idx4294967294
    %1 = index.add %0, %idx1
    %2 = index.cmp uge(%1, %idx1)
    return %2 : i1
  }
  func.func @add_unsigned_ov(%arg0: index) -> i1 {
    %idx1 = index.constant 1
    %idx4294967295 = index.constant 4294967295
    %0 = index.minu %arg0, %idx4294967295
    %1 = index.add %0, %idx1
    %2 = index.cmp uge(%1, %idx1)
    return %2 : i1
  }
  func.func @add_signed_ov(%arg0: index) -> i1 {
    %idx0 = index.constant 0
    %idx1 = index.constant 1
    %idx2147483647 = index.constant 2147483647
    %0 = index.minu %arg0, %idx2147483647
    %1 = index.add %0, %idx1
    %2 = index.cmp sge(%1, %idx0)
    return %2 : i1
  }
  func.func @add_big(%arg0: index) -> i1 {
    %idx1 = index.constant 1
    %idx12884901888 = index.constant 12884901888
    %idx12884967423 = index.constant 12884967423
    %0 = index.maxu %arg0, %idx12884901888
    %1 = index.minu %0, %idx12884967423
    %2 = index.add %1, %idx1
    %3 = index.cmp uge(%1, %idx12884901888)
    return %3 : i1
  }
}

