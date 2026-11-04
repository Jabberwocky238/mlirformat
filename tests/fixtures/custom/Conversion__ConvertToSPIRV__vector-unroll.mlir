module {
  func.func @vaddi(%arg0: vector<6xi32>, %arg1: vector<6xi32>) -> vector<6xi32> {
    %0 = arith.addi %arg0, %arg1 : vector<6xi32>
    return %0 : vector<6xi32>
  }
  func.func @vaddi_2d(%arg0: vector<2x2xi32>, %arg1: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = arith.addi %arg0, %arg1 : vector<2x2xi32>
    return %0 : vector<2x2xi32>
  }
  func.func @vaddi_2d_8(%arg0: vector<2x8xi32>, %arg1: vector<2x8xi32>) -> vector<2x8xi32> {
    %0 = arith.addi %arg0, %arg1 : vector<2x8xi32>
    return %0 : vector<2x8xi32>
  }
}

// -----
module {
  func.func @reduction_5(%arg0: vector<5xi32>) -> i32 {
    %0 = vector.reduction <add>, %arg0 : vector<5xi32> into i32
    return %0 : i32
  }
  func.func @reduction_8(%arg0: vector<8xi32>) -> i32 {
    %0 = vector.reduction <add>, %arg0 : vector<8xi32> into i32
    return %0 : i32
  }
}

// -----
module {
  func.func @vaddi_reduction(%arg0: vector<8xi32>, %arg1: vector<8xi32>) -> i32 {
    %0 = arith.addi %arg0, %arg1 : vector<8xi32>
    %1 = vector.reduction <add>, %0 : vector<8xi32> into i32
    return %1 : i32
  }
}

// -----
module {
  func.func @transpose(%arg0: vector<2x3xi32>) -> vector<3x2xi32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x3xi32> to vector<3x2xi32>
    return %0 : vector<3x2xi32>
  }
}

// -----
module {
  func.func @unroll_to_elements_2d() -> (f32, f32, f32, f32) {
    %0 = "test.op"() : () -> vector<2x2xf32>
    %1:4 = vector.to_elements %0 : vector<2x2xf32>
    return %1#0, %1#1, %1#2, %1#3 : f32, f32, f32, f32
  }
}

// -----
module {
  func.func @unroll_from_elements_2d(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: f32) -> vector<2x2xf32> {
    %0 = vector.from_elements %arg0, %arg1, %arg2, %arg3 : vector<2x2xf32>
    %1 = arith.addf %0, %0 : vector<2x2xf32>
    return %1 : vector<2x2xf32>
  }
}

