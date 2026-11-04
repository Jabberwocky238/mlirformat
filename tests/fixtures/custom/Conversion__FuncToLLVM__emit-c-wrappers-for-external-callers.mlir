module {
  func.func @res_attrs_with_memref_return() -> (memref<f32> {test.returnOne}) {
    %alloc = memref.alloc() : memref<f32>
    return %alloc : memref<f32>
  }
  func.func @res_attrs_with_value_return() -> (f32 {test.returnOne = 1 : i64}) {
    %cst = arith.constant 1.000000e+00 : f32
    return %cst : f32
  }
  func.func @multiple_return() -> (memref<f32> {test.returnOne = 1 : i64}, f32 {test.returnThree = 3 : i64, test.returnTwo = 2 : i64}) {
    %alloc = memref.alloc() : memref<f32>
    %cst = arith.constant 1.000000e+00 : f32
    return %alloc, %cst : memref<f32>, f32
  }
  func.func @multiple_return_missing_res_attr() -> (memref<f32> {test.returnOne = 1 : i64}, i64, f32 {test.returnThree = 3 : i64, test.returnTwo = 2 : i64}) {
    %alloc = memref.alloc() : memref<f32>
    %c2_i64 = arith.constant 2 : i64
    %cst = arith.constant 1.000000e+00 : f32
    return %alloc, %c2_i64, %cst : memref<f32>, i64, f32
  }
  func.func @one_arg_attr_no_res_attrs_with_memref_return(%arg0: memref<f32> {test.argOne = 1 : i64}) -> memref<f32> {
    %alloc = memref.alloc() : memref<f32>
    return %alloc : memref<f32>
  }
  func.func @one_arg_attr_one_res_attr_with_memref_return(%arg0: memref<f32> {test.argOne = 1 : i64}) -> (memref<f32> {test.returnOne = 1 : i64}) {
    %alloc = memref.alloc() : memref<f32>
    return %alloc : memref<f32>
  }
  func.func @one_arg_attr_one_res_attr_with_value_return(%arg0: memref<f32> {test.argOne = 1 : i64}) -> (f32 {test.returnOne = 1 : i64}) {
    %cst = arith.constant 1.000000e+00 : f32
    return %cst : f32
  }
  func.func @multiple_arg_attr_multiple_res_attr(%arg0: memref<f32> {test.argZero = 0 : i64}, %arg1: f32, %arg2: i32 {test.argTwo = 2 : i64}) -> (f32, memref<i32> {test.returnOne = 1 : i64}, i32 {test.returnTwo = 2 : i64}) {
    %cst = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<i32>
    %c2_i32 = arith.constant 2 : i32
    return %cst, %alloc, %c2_i32 : f32, memref<i32>, i32
  }
  func.func @drop_linkage_attr() -> (memref<f32> {test.returnOne}) attributes {llvm.linkage = #llvm.linkage<external>} {
    %alloc = memref.alloc() : memref<f32>
    return %alloc : memref<f32>
  }
}

