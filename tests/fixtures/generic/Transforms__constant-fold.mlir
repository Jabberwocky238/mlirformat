"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (8)>
#map2 = affine_map<() -> (128)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "affine_for"}> ({
  ^bb0(%arg0: memref<f32>):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg2: index):
        %0 = "arith.constant"() <{value = 4.500000e+00 : f32}> : () -> f32
        %1 = "arith.constant"() <{value = 1.500000e+00 : f32}> : () -> f32
        %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "memref.store"(%2, %arg0) : (f32, memref<f32>) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, sym_name = "simple_addf"}> ({
    %0 = "arith.constant"() <{value = 4.500000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.500000e+00 : f32}> : () -> f32
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xf32>, sym_name = "addf_splat_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<4.500000e+00> : tensor<4xf32>}> : () -> tensor<4xf32>
    %1 = "arith.constant"() <{value = dense<1.500000e+00> : tensor<4xf32>}> : () -> tensor<4xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (tensor<4xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%2) : (tensor<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xf32>, sym_name = "addf_dense_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<[1.500000e+00, 2.500000e+00, 3.500000e+00, 4.500000e+00]> : tensor<4xf32>}> : () -> tensor<4xf32>
    %1 = "arith.constant"() <{value = dense<[1.500000e+00, 2.500000e+00, 3.500000e+00, 4.500000e+00]> : tensor<4xf32>}> : () -> tensor<4xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (tensor<4xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%2) : (tensor<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xf32>, sym_name = "addf_dense_and_splat_tensors"}> ({
    %0 = "arith.constant"() <{value = dense<[1.500000e+00, 2.500000e+00, 3.500000e+00, 4.500000e+00]> : tensor<4xf32>}> : () -> tensor<4xf32>
    %1 = "arith.constant"() <{value = dense<1.500000e+00> : tensor<4xf32>}> : () -> tensor<4xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (tensor<4xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%2) : (tensor<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "simple_addi"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, i32) -> (i1, i32), sym_name = "simple_and"}> ({
  ^bb0(%arg0: i1, %arg1: i32):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 31 : i32}> : () -> i32
    %3 = "arith.andi"(%arg0, %0) : (i1, i1) -> i1
    %4 = "arith.andi"(%arg1, %1) : (i32, i32) -> i32
    %5 = "arith.andi"(%4, %2) : (i32, i32) -> i32
    "func.return"(%3, %5) : (i1, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "and_index"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 31 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1 : index}> : () -> index
    %2 = "arith.andi"(%arg0, %0) : (index, index) -> index
    %3 = "arith.andi"(%2, %1) : (index, index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2xi32>) -> tensor<2xi32>, sym_name = "tensor_and"}> ({
  ^bb0(%arg0: tensor<2xi32>):
    %0 = "arith.constant"() <{value = dense<-1> : tensor<2xi32>}> : () -> tensor<2xi32>
    %1 = "arith.constant"() <{value = dense<31> : tensor<2xi32>}> : () -> tensor<2xi32>
    %2 = "arith.constant"() <{value = dense<[31, -1]> : tensor<2xi32>}> : () -> tensor<2xi32>
    %3 = "arith.andi"(%arg0, %0) : (tensor<2xi32>, tensor<2xi32>) -> tensor<2xi32>
    %4 = "arith.andi"(%3, %1) : (tensor<2xi32>, tensor<2xi32>) -> tensor<2xi32>
    %5 = "arith.andi"(%4, %2) : (tensor<2xi32>, tensor<2xi32>) -> tensor<2xi32>
    "func.return"(%5) : (tensor<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi32>) -> vector<2xi32>, sym_name = "vector_and"}> ({
  ^bb0(%arg0: vector<2xi32>):
    %0 = "arith.constant"() <{value = dense<-1> : vector<2xi32>}> : () -> vector<2xi32>
    %1 = "arith.constant"() <{value = dense<31> : vector<2xi32>}> : () -> vector<2xi32>
    %2 = "arith.constant"() <{value = dense<[31, -1]> : vector<2xi32>}> : () -> vector<2xi32>
    %3 = "arith.andi"(%arg0, %0) : (vector<2xi32>, vector<2xi32>) -> vector<2xi32>
    %4 = "arith.andi"(%3, %1) : (vector<2xi32>, vector<2xi32>) -> vector<2xi32>
    %5 = "arith.andi"(%4, %2) : (vector<2xi32>, vector<2xi32>) -> vector<2xi32>
    "func.return"(%5) : (vector<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<8xi32>, sym_name = "addi_splat_vector"}> ({
    %0 = "arith.constant"() <{value = dense<1> : vector<8xi32>}> : () -> vector<8xi32>
    %1 = "arith.constant"() <{value = dense<5> : vector<8xi32>}> : () -> vector<8xi32>
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "func.return"(%2) : (vector<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, sym_name = "simple_subf"}> ({
    %0 = "arith.constant"() <{value = 4.500000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.500000e+00 : f32}> : () -> f32
    %2 = "arith.subf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<4xf32>, sym_name = "subf_splat_vector"}> ({
    %0 = "arith.constant"() <{value = dense<4.500000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %1 = "arith.constant"() <{value = dense<1.500000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %2 = "arith.subf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%2) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (i32, i32), sym_name = "simple_subi"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.subi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %4 = "arith.subi"(%arg0, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%3, %4) : (i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xi32>, sym_name = "subi_splat_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<4> : tensor<4xi32>}> : () -> tensor<4xi32>
    %1 = "arith.constant"() <{value = dense<1> : tensor<4xi32>}> : () -> tensor<4xi32>
    %2 = "arith.subi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi32>
    "func.return"(%2) : (tensor<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (d0 floordiv 128 + s0 + d1 mod 128)>
#map1 = affine_map<(d0, d1)[s0] -> ((s0 ceildiv 128) * 128)>
#map2 = affine_map<(d0) -> (42)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index, index), sym_name = "affine_apply"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 177 : index}> : () -> index
    %1 = "arith.constant"() <{value = 211 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1075 : index}> : () -> index
    %3 = "affine.apply"(%0, %1, %2) <{map = #map}> : (index, index, index) -> index
    %4 = "affine.apply"(%0, %1, %2) <{map = #map1}> : (index, index, index) -> index
    %5 = "affine.apply"(%arg0) <{map = #map2}> : (index) -> index
    "func.return"(%3, %4, %5) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, sym_name = "simple_mulf"}> ({
    %0 = "arith.constant"() <{value = 4.500000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.500000e+00 : f32}> : () -> f32
    %2 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xf32>, sym_name = "mulf_splat_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<4.500000e+00> : tensor<4xf32>}> : () -> tensor<4xf32>
    %1 = "arith.constant"() <{value = dense<1.500000e+00> : tensor<4xf32>}> : () -> tensor<4xf32>
    %2 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (tensor<4xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%2) : (tensor<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i32, i32, i32), sym_name = "simple_divi_signed"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 6 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "arith.divsi"(%1, %2) : (i32, i32) -> i32
    %4 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %5 = "arith.divsi"(%1, %4) : (i32, i32) -> i32
    %6 = "arith.divsi"(%1, %0) : (i32, i32) -> i32
    "func.return"(%3, %5, %6) : (i32, i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (tensor<4xi32>, tensor<4xi32>, tensor<4xi32>), sym_name = "divi_signed_splat_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<0> : tensor<4xi32>}> : () -> tensor<4xi32>
    %1 = "arith.constant"() <{value = dense<6> : tensor<4xi32>}> : () -> tensor<4xi32>
    %2 = "arith.constant"() <{value = dense<2> : tensor<4xi32>}> : () -> tensor<4xi32>
    %3 = "arith.divsi"(%1, %2) : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi32>
    %4 = "arith.constant"() <{value = dense<-2> : tensor<4xi32>}> : () -> tensor<4xi32>
    %5 = "arith.divsi"(%1, %4) : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi32>
    %6 = "arith.divsi"(%1, %0) : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi32>
    "func.return"(%3, %5, %6) : (tensor<4xi32>, tensor<4xi32>, tensor<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i32, i32, i32), sym_name = "simple_divi_unsigned"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 6 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "arith.divui"(%1, %2) : (i32, i32) -> i32
    %4 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %5 = "arith.divui"(%1, %4) : (i32, i32) -> i32
    %6 = "arith.divui"(%1, %0) : (i32, i32) -> i32
    "func.return"(%3, %5, %6) : (i32, i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (tensor<4xi32>, tensor<4xi32>, tensor<4xi32>), sym_name = "divi_unsigned_splat_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<0> : tensor<4xi32>}> : () -> tensor<4xi32>
    %1 = "arith.constant"() <{value = dense<6> : tensor<4xi32>}> : () -> tensor<4xi32>
    %2 = "arith.constant"() <{value = dense<2> : tensor<4xi32>}> : () -> tensor<4xi32>
    %3 = "arith.divui"(%1, %2) : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi32>
    %4 = "arith.constant"() <{value = dense<-2> : tensor<4xi32>}> : () -> tensor<4xi32>
    %5 = "arith.divui"(%1, %4) : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi32>
    %6 = "arith.divui"(%1, %0) : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi32>
    "func.return"(%3, %5, %6) : (tensor<4xi32>, tensor<4xi32>, tensor<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i32, i32, i32, i32, i32), sym_name = "simple_arith.floordivsi"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "arith.floordivsi"(%1, %2) : (i32, i32) -> i32
    %4 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %5 = "arith.floordivsi"(%1, %4) : (i32, i32) -> i32
    %6 = "arith.constant"() <{value = -9 : i32}> : () -> i32
    %7 = "arith.floordivsi"(%6, %2) : (i32, i32) -> i32
    %8 = "arith.constant"() <{value = -13 : i32}> : () -> i32
    %9 = "arith.floordivsi"(%8, %4) : (i32, i32) -> i32
    %10 = "arith.floordivsi"(%1, %0) : (i32, i32) -> i32
    "func.return"(%3, %5, %7, %9, %10) : (i32, i32, i32, i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i32, i32, i32, i32, i32), sym_name = "simple_arith.ceildivsi"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "arith.ceildivsi"(%1, %2) : (i32, i32) -> i32
    %4 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %5 = "arith.ceildivsi"(%1, %4) : (i32, i32) -> i32
    %6 = "arith.constant"() <{value = -9 : i32}> : () -> i32
    %7 = "arith.ceildivsi"(%6, %2) : (i32, i32) -> i32
    %8 = "arith.constant"() <{value = -15 : i32}> : () -> i32
    %9 = "arith.ceildivsi"(%8, %4) : (i32, i32) -> i32
    %10 = "arith.ceildivsi"(%1, %0) : (i32, i32) -> i32
    "func.return"(%3, %5, %7, %9, %10) : (i32, i32, i32, i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i8, i16, i32), sym_name = "simple_arith.ceildivsi_overflow"}> ({
    %0 = "arith.constant"() <{value = 7 : i8}> : () -> i8
    %1 = "arith.constant"() <{value = -128 : i8}> : () -> i8
    %2 = "arith.ceildivsi"(%1, %0) : (i8, i8) -> i8
    %3 = "arith.constant"() <{value = 7 : i16}> : () -> i16
    %4 = "arith.constant"() <{value = -32768 : i16}> : () -> i16
    %5 = "arith.ceildivsi"(%4, %3) : (i16, i16) -> i16
    %6 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = -2147483648 : i32}> : () -> i32
    %8 = "arith.ceildivsi"(%7, %6) : (i32, i32) -> i32
    "func.return"(%2, %5, %8) : (i8, i16, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i32, i32, i32, i32, i32), sym_name = "simple_arith.ceildivui"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "arith.ceildivui"(%1, %2) : (i32, i32) -> i32
    %4 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %5 = "arith.ceildivui"(%1, %4) : (i32, i32) -> i32
    %6 = "arith.constant"() <{value = -8 : i32}> : () -> i32
    %7 = "arith.ceildivui"(%6, %2) : (i32, i32) -> i32
    %8 = "arith.constant"() <{value = -15 : i32}> : () -> i32
    %9 = "arith.ceildivui"(%8, %4) : (i32, i32) -> i32
    %10 = "arith.ceildivui"(%1, %0) : (i32, i32) -> i32
    "func.return"(%3, %5, %7, %9, %10) : (i32, i32, i32, i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (i32, i32, i32), sym_name = "simple_arith.remsi"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %4 = "arith.remsi"(%0, %1) : (i32, i32) -> i32
    %5 = "arith.remsi"(%0, %3) : (i32, i32) -> i32
    %6 = "arith.remsi"(%arg0, %2) : (i32, i32) -> i32
    "func.return"(%4, %5, %6) : (i32, i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (i32, i32, i32), sym_name = "simple_arith.remui"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %4 = "arith.remui"(%0, %1) : (i32, i32) -> i32
    %5 = "arith.remui"(%0, %3) : (i32, i32) -> i32
    %6 = "arith.remui"(%arg0, %2) : (i32, i32) -> i32
    "func.return"(%4, %5, %6) : (i32, i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "muli"}> ({
    %0 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "arith.muli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<4xi32>, sym_name = "muli_splat_vector"}> ({
    %2 = "arith.constant"() <{value = dense<4> : vector<4xi32>}> : () -> vector<4xi32>
    %3 = "arith.constant"() <{value = dense<2> : vector<4xi32>}> : () -> vector<4xi32>
    %4 = "arith.muli"(%2, %3) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%4) : (vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x4xf32>) -> index, sym_name = "dim"}> ({
  ^bb0(%arg0: tensor<8x4xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<8x4xf32>, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1), sym_name = "cmpi"}> ({
    %0 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %2 = "arith.cmpi"(%0, %1) <{predicate = 0 : i64}> : (i32, i32) -> i1
    %3 = "arith.cmpi"(%0, %1) <{predicate = 1 : i64}> : (i32, i32) -> i1
    %4 = "arith.cmpi"(%0, %1) <{predicate = 2 : i64}> : (i32, i32) -> i1
    %5 = "arith.cmpi"(%0, %1) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %6 = "arith.cmpi"(%0, %1) <{predicate = 4 : i64}> : (i32, i32) -> i1
    %7 = "arith.cmpi"(%0, %1) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %8 = "arith.cmpi"(%0, %1) <{predicate = 6 : i64}> : (i32, i32) -> i1
    %9 = "arith.cmpi"(%0, %1) <{predicate = 7 : i64}> : (i32, i32) -> i1
    %10 = "arith.cmpi"(%0, %1) <{predicate = 8 : i64}> : (i32, i32) -> i1
    %11 = "arith.cmpi"(%0, %1) <{predicate = 9 : i64}> : (i32, i32) -> i1
    "func.return"(%2, %3, %4, %5, %6, %7, %8, %9, %10, %11) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1), sym_name = "cmpf_normal_numbers"}> ({
    %0 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %2 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 0 : i64}> : (f32, f32) -> i1
    %3 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1
    %4 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
    %5 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f32, f32) -> i1
    %6 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f32, f32) -> i1
    %7 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 5 : i64}> : (f32, f32) -> i1
    %8 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 6 : i64}> : (f32, f32) -> i1
    %9 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 7 : i64}> : (f32, f32) -> i1
    %10 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 8 : i64}> : (f32, f32) -> i1
    %11 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 9 : i64}> : (f32, f32) -> i1
    %12 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 10 : i64}> : (f32, f32) -> i1
    %13 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
    %14 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 12 : i64}> : (f32, f32) -> i1
    %15 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 13 : i64}> : (f32, f32) -> i1
    %16 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 14 : i64}> : (f32, f32) -> i1
    %17 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 15 : i64}> : (f32, f32) -> i1
    "func.return"(%2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1), sym_name = "cmpf_nan"}> ({
    %0 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0xFFFFFFFF : f32}> : () -> f32
    %2 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 0 : i64}> : (f32, f32) -> i1
    %3 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1
    %4 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
    %5 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f32, f32) -> i1
    %6 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f32, f32) -> i1
    %7 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 5 : i64}> : (f32, f32) -> i1
    %8 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 6 : i64}> : (f32, f32) -> i1
    %9 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 7 : i64}> : (f32, f32) -> i1
    %10 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 8 : i64}> : (f32, f32) -> i1
    %11 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 9 : i64}> : (f32, f32) -> i1
    %12 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 10 : i64}> : (f32, f32) -> i1
    %13 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
    %14 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 12 : i64}> : (f32, f32) -> i1
    %15 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 13 : i64}> : (f32, f32) -> i1
    %16 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 14 : i64}> : (f32, f32) -> i1
    %17 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 15 : i64}> : (f32, f32) -> i1
    "func.return"(%2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1), sym_name = "cmpf_inf"}> ({
    %0 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    %2 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 0 : i64}> : (f32, f32) -> i1
    %3 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1
    %4 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
    %5 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f32, f32) -> i1
    %6 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f32, f32) -> i1
    %7 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 5 : i64}> : (f32, f32) -> i1
    %8 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 6 : i64}> : (f32, f32) -> i1
    %9 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 7 : i64}> : (f32, f32) -> i1
    %10 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 8 : i64}> : (f32, f32) -> i1
    %11 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 9 : i64}> : (f32, f32) -> i1
    %12 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 10 : i64}> : (f32, f32) -> i1
    %13 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
    %14 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 12 : i64}> : (f32, f32) -> i1
    %15 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 13 : i64}> : (f32, f32) -> i1
    %16 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 14 : i64}> : (f32, f32) -> i1
    %17 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 15 : i64}> : (f32, f32) -> i1
    "func.return"(%2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "nested_isolated_region"}> ({
    "builtin.module"() ({
      "func.func"() <{function_type = () -> (), sym_name = "isolated_op"}> ({
        %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
        %3 = "arith.addi"(%2, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "foo.yield"(%3) : (i32) -> ()
      }) : () -> ()
    }) : () -> ()
    "foo.unknown_region"() ({
      %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %1 = "arith.addi"(%0, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "foo.yield"(%1) : (i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "custom_insertion_position"}> ({
    "test.one_region_op"() ({
      %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %1 = "arith.addi"(%0, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "foo.yield"(%1) : (i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "subview_scalar_fold"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64>, static_sizes = array<i64>, static_strides = array<i64>}> : (memref<f32>) -> memref<f32>
    "func.return"(%0) : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

