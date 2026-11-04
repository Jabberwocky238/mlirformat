module {
  func.func @to_sdot(%arg0: vector<4xi8>, %arg1: vector<4xi8>) -> i32 {
    %0 = arith.extsi %arg0 : vector<4xi8> to vector<4xi32>
    %1 = arith.extsi %arg1 : vector<4xi8> to vector<4xi32>
    %2 = arith.muli %0, %1 : vector<4xi32>
    %3 = vector.reduction <add>, %2 : vector<4xi32> into i32
    return %3 : i32
  }
  func.func @to_sdot_acc(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32) -> i32 {
    %0 = arith.extsi %arg0 : vector<4xi8> to vector<4xi32>
    %1 = arith.extsi %arg1 : vector<4xi8> to vector<4xi32>
    %2 = arith.muli %0, %1 : vector<4xi32>
    %3 = vector.reduction <add>, %2, %arg2 : vector<4xi32> into i32
    return %3 : i32
  }
  func.func @to_sdot_i64(%arg0: vector<4xi8>, %arg1: vector<4xi8>) -> i64 {
    %0 = arith.extsi %arg0 : vector<4xi8> to vector<4xi64>
    %1 = arith.extsi %arg1 : vector<4xi8> to vector<4xi64>
    %2 = arith.muli %0, %1 : vector<4xi64>
    %3 = vector.reduction <add>, %2 : vector<4xi64> into i64
    return %3 : i64
  }
  func.func @to_sdot_acc_i64(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i64) -> i64 {
    %0 = arith.extsi %arg0 : vector<4xi8> to vector<4xi64>
    %1 = arith.extsi %arg1 : vector<4xi8> to vector<4xi64>
    %2 = arith.muli %0, %1 : vector<4xi64>
    %3 = vector.reduction <add>, %2, %arg2 : vector<4xi64> into i64
    return %3 : i64
  }
  func.func @to_udot(%arg0: vector<4xi8>, %arg1: vector<4xi8>) -> i32 {
    %0 = arith.extui %arg0 : vector<4xi8> to vector<4xi32>
    %1 = arith.extui %arg1 : vector<4xi8> to vector<4xi32>
    %2 = arith.muli %0, %1 : vector<4xi32>
    %3 = vector.reduction <add>, %2 : vector<4xi32> into i32
    return %3 : i32
  }
  func.func @to_udot_acc(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32) -> i32 {
    %0 = arith.extui %arg0 : vector<4xi8> to vector<4xi32>
    %1 = arith.extui %arg1 : vector<4xi8> to vector<4xi32>
    %2 = arith.muli %0, %1 : vector<4xi32>
    %3 = vector.reduction <add>, %2, %arg2 : vector<4xi32> into i32
    return %3 : i32
  }
  func.func @to_signed_unsigned_dot(%arg0: vector<4xi8>, %arg1: vector<4xi8>) -> i32 {
    %0 = arith.extsi %arg0 : vector<4xi8> to vector<4xi32>
    %1 = arith.extui %arg1 : vector<4xi8> to vector<4xi32>
    %2 = arith.muli %0, %1 : vector<4xi32>
    %3 = vector.reduction <add>, %2 : vector<4xi32> into i32
    return %3 : i32
  }
  func.func @to_signed_unsigned_dot_acc(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32) -> i32 {
    %0 = arith.extsi %arg0 : vector<4xi8> to vector<4xi32>
    %1 = arith.extui %arg1 : vector<4xi8> to vector<4xi32>
    %2 = arith.muli %0, %1 : vector<4xi32>
    %3 = vector.reduction <add>, %2, %arg2 : vector<4xi32> into i32
    return %3 : i32
  }
  func.func @to_unsigned_signed_dot(%arg0: vector<4xi8>, %arg1: vector<4xi8>) -> i32 {
    %0 = arith.extui %arg0 : vector<4xi8> to vector<4xi32>
    %1 = arith.extsi %arg1 : vector<4xi8> to vector<4xi32>
    %2 = arith.muli %0, %1 : vector<4xi32>
    %3 = vector.reduction <add>, %2 : vector<4xi32> into i32
    return %3 : i32
  }
  func.func @to_unsigned_signed_dot_acc(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32) -> i32 {
    %0 = arith.extui %arg0 : vector<4xi8> to vector<4xi32>
    %1 = arith.extsi %arg1 : vector<4xi8> to vector<4xi32>
    %2 = arith.muli %0, %1 : vector<4xi32>
    %3 = vector.reduction <add>, %2, %arg2 : vector<4xi32> into i32
    return %3 : i32
  }
  func.func @to_sdot_vector3(%arg0: vector<3xi8>, %arg1: vector<3xi8>) -> i32 {
    %0 = arith.extsi %arg0 : vector<3xi8> to vector<3xi32>
    %1 = arith.extsi %arg1 : vector<3xi8> to vector<3xi32>
    %2 = arith.muli %0, %1 : vector<3xi32>
    %3 = vector.reduction <add>, %2 : vector<3xi32> into i32
    return %3 : i32
  }
}

// -----
module {
  func.func @too_short(%arg0: vector<2xi8>, %arg1: vector<2xi8>) -> i32 {
    %0 = arith.extsi %arg0 : vector<2xi8> to vector<2xi32>
    %1 = arith.extsi %arg1 : vector<2xi8> to vector<2xi32>
    %2 = arith.muli %0, %1 : vector<2xi32>
    %3 = vector.reduction <add>, %2 : vector<2xi32> into i32
    return %3 : i32
  }
  func.func @too_long(%arg0: vector<6xi8>, %arg1: vector<6xi8>) -> i32 {
    %0 = arith.extsi %arg0 : vector<6xi8> to vector<6xi32>
    %1 = arith.extsi %arg1 : vector<6xi8> to vector<6xi32>
    %2 = arith.muli %0, %1 : vector<6xi32>
    %3 = vector.reduction <add>, %2 : vector<6xi32> into i32
    return %3 : i32
  }
  func.func @wrong_reduction_kind(%arg0: vector<4xi8>, %arg1: vector<4xi8>) -> i32 {
    %0 = arith.extsi %arg0 : vector<4xi8> to vector<4xi32>
    %1 = arith.extsi %arg1 : vector<4xi8> to vector<4xi32>
    %2 = arith.muli %0, %1 : vector<4xi32>
    %3 = vector.reduction <mul>, %2 : vector<4xi32> into i32
    return %3 : i32
  }
  func.func @wrong_arith_op(%arg0: vector<4xi8>, %arg1: vector<4xi8>) -> i32 {
    %0 = arith.extsi %arg0 : vector<4xi8> to vector<4xi32>
    %1 = arith.extsi %arg1 : vector<4xi8> to vector<4xi32>
    %2 = arith.addi %0, %1 : vector<4xi32>
    %3 = vector.reduction <mul>, %2 : vector<4xi32> into i32
    return %3 : i32
  }
}

