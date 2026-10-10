#map = affine_map<(d0, d1)[s0] -> (d0 * 1024 + s0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>) -> (), sym_name = "multi_buffer"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {someAttribute} : () -> memref<4x128xf32>
    %1 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    "scf.for"(%2, %1, %3) ({
    ^bb0(%arg1: index):
      %4 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 4, 128>, static_strides = array<i64: 1, 1>}> : (memref<1024x1024xf32>, index) -> memref<4x128xf32, #map>
      "memref.copy"(%4, %0) : (memref<4x128xf32, #map>, memref<4x128xf32>) -> ()
      "some_use"(%0) : (memref<4x128xf32>) -> ()
      "some_use"(%0) : (memref<4x128xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (d0 * 1024 + s0 + d1)>
#map1 = affine_map<() -> (1)>
#map2 = affine_map<() -> (1024)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>) -> (), sym_name = "multi_buffer_affine"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x128xf32>
    %1 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 3 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %4 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 4, 128>, static_strides = array<i64: 1, 1>}> : (memref<1024x1024xf32>, index) -> memref<4x128xf32, #map>
      "memref.copy"(%4, %0) : (memref<4x128xf32, #map>, memref<4x128xf32>) -> ()
      "some_use"(%0) : (memref<4x128xf32>) -> ()
      "some_use"(%0) : (memref<4x128xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (d0 * 1024 + s0 + d1)>
#map1 = affine_map<(d0, d1) -> (d0 * 128 + d1 + 1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>) -> (), sym_name = "multi_buffer_subview_use"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x128xf32>
    %1 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    "scf.for"(%2, %1, %3) ({
    ^bb0(%arg1: index):
      %4 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 4, 128>, static_strides = array<i64: 1, 1>}> : (memref<1024x1024xf32>, index) -> memref<4x128xf32, #map>
      "memref.copy"(%4, %0) : (memref<4x128xf32, #map>, memref<4x128xf32>) -> ()
      %5 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 1>, static_sizes = array<i64: 4, 127>, static_strides = array<i64: 1, 1>}> : (memref<4x128xf32>) -> memref<4x127xf32, #map1>
      "some_use"(%5) : (memref<4x127xf32, #map1>) -> ()
      "some_use"(%0) : (memref<4x128xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (d0 * 1024 + s0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>) -> (), sym_name = "multi_buffer_negative"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x128xf32>
    %1 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    "scf.for"(%2, %1, %3) ({
    ^bb0(%arg1: index):
      "blocking_use"(%0) : (memref<4x128xf32>) -> ()
      %4 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 4, 128>, static_strides = array<i64: 1, 1>}> : (memref<1024x1024xf32>, index) -> memref<4x128xf32, #map>
      "memref.copy"(%4, %0) : (memref<4x128xf32, #map>, memref<4x128xf32>) -> ()
      "some_use"(%0) : (memref<4x128xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

