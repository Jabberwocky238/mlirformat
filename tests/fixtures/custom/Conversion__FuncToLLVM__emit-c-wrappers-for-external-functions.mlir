module {
  func.func private @res_attrs_with_memref_return() -> (memref<f32> {test.returnOne})
  func.func private @res_attrs_with_value_return() -> (f32 {test.returnOne = 1 : i64})
  func.func private @multiple_return() -> (memref<f32> {test.returnOne = 1 : i64}, f32 {test.returnThree = 3 : i64, test.returnTwo = 2 : i64})
  func.func private @multiple_return_missing_res_attr() -> (memref<f32> {test.returnOne = 1 : i64}, i64, f32 {test.returnThree = 3 : i64, test.returnTwo = 2 : i64})
  func.func private @one_arg_attr_no_res_attrs_with_memref_return(memref<f32> {test.argOne = 1 : i64}) -> memref<f32>
  func.func private @one_arg_attr_one_res_attr_with_memref_return(memref<f32> {test.argOne = 1 : i64}) -> (memref<f32> {test.returnOne = 1 : i64})
  func.func private @one_arg_attr_one_res_attr_with_value_return(memref<f32> {test.argOne = 1 : i64}) -> (f32 {test.returnOne = 1 : i64})
  func.func private @multiple_arg_attr_multiple_res_attr(memref<f32> {test.argZero = 0 : i64}, f32, i32 {test.argTwo = 2 : i64}) -> (f32, memref<i32> {test.returnOne = 1 : i64}, i32 {test.returnTwo = 2 : i64})
  func.func private @drop_linkage_attr() -> (memref<f32> {test.returnOne}) attributes {llvm.linkage = #llvm.linkage<weak>}
}

