"builtin.module"() ({
  "func.func"() <{function_type = (!shape.shape) -> !shape.size, sym_name = "shape_num_elements"}> ({
  ^bb0(%arg58: !shape.shape):
    %110 = "shape.const_size"() <{value = 1 : index}> : () -> !shape.size
    %111 = "shape.reduce"(%arg58, %110) ({
    ^bb0(%arg59: index, %arg60: !shape.size, %arg61: !shape.size):
      %112 = "shape.mul"(%arg61, %arg60) : (!shape.size, !shape.size) -> !shape.size
      "shape.yield"(%112) : (!shape.size) -> ()
    }) : (!shape.shape, !shape.size) -> !shape.size
    "func.return"(%111) : (!shape.size) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>) -> index, sym_name = "extent_tensor_num_elements"}> ({
  ^bb0(%arg54: tensor<?xindex>):
    %107 = "arith.constant"() <{value = 1 : index}> : () -> index
    %108 = "shape.reduce"(%arg54, %107) ({
    ^bb0(%arg55: index, %arg56: index, %arg57: index):
      %109 = "shape.mul"(%arg57, %arg56) : (index, index) -> index
      "shape.yield"(%109) : (index) -> ()
    }) : (tensor<?xindex>, index) -> index
    "func.return"(%108) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_shape_num_elements_unknown"}> ({
    %104 = "shape.unknown_shape"() : () -> !shape.shape
    %105 = "func.call"(%104) <{callee = @shape_num_elements}> : (!shape.shape) -> !shape.size
    %106 = "shape.print"(%105) : (!shape.size) -> !shape.size
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "const_shape"}> ({
    %102 = "shape.const_shape"() <{shape = dense<[1, 2, 3]> : tensor<3xindex>}> : () -> !shape.shape
    %103 = "shape.const_shape"() <{shape = dense<[4, 5, 6]> : tensor<3xindex>}> : () -> tensor<3xindex>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_shape_num_elements_fixed"}> ({
    %99 = "shape.const_shape"() <{shape = dense<[1, 57, 92]> : tensor<3xindex>}> : () -> !shape.shape
    %100 = "func.call"(%99) <{callee = @shape_num_elements}> : (!shape.shape) -> !shape.size
    %101 = "shape.print"(%100) : (!shape.size) -> !shape.size
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_broadcast_fixed"}> ({
    %95 = "shape.const_shape"() <{shape = dense<[10, 1, 57, 92]> : tensor<4xindex>}> : () -> !shape.shape
    %96 = "shape.const_shape"() <{shape = dense<[4, 57, 92]> : tensor<3xindex>}> : () -> !shape.shape
    %97 = "shape.broadcast"(%95, %96) : (!shape.shape, !shape.shape) -> !shape.shape
    %98 = "shape.print"(%97) : (!shape.shape) -> !shape.shape
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<4xindex>, sym_name = "test_broadcast_extents"}> ({
    %92 = "shape.const_shape"() <{shape = dense<[10, 1, 57, 92]> : tensor<4xindex>}> : () -> tensor<4xindex>
    %93 = "shape.const_shape"() <{shape = dense<[4, 57, 92]> : tensor<3xindex>}> : () -> tensor<3xindex>
    %94 = "shape.broadcast"(%92, %93) : (tensor<4xindex>, tensor<3xindex>) -> tensor<4xindex>
    "func.return"(%94) : (tensor<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_shape_any_fixed"}> ({
    %88 = "shape.const_shape"() <{shape = dense<[4, 57, 92]> : tensor<3xindex>}> : () -> !shape.shape
    %89 = "shape.const_shape"() <{shape = dense<[4, 57, 92]> : tensor<3xindex>}> : () -> !shape.shape
    %90 = "shape.meet"(%88, %89) : (!shape.shape, !shape.shape) -> !shape.shape
    %91 = "shape.print"(%90) : (!shape.shape) -> !shape.shape
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_shape_any_unknown"}> ({
    %84 = "shape.const_shape"() <{shape = dense<[4, -1, 92]> : tensor<3xindex>}> : () -> !shape.shape
    %85 = "shape.const_shape"() <{shape = dense<[-1, 57, 92]> : tensor<3xindex>}> : () -> !shape.shape
    %86 = "shape.meet"(%84, %85) : (!shape.shape, !shape.shape) -> !shape.shape
    %87 = "shape.print"(%86) : (!shape.shape) -> !shape.shape
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_shape_any_fixed_mismatch"}> ({
    %80 = "shape.const_shape"() <{shape = dense<[4, 57, 92]> : tensor<3xindex>}> : () -> !shape.shape
    %81 = "shape.const_shape"() <{shape = dense<[2, 57, 92]> : tensor<3xindex>}> : () -> !shape.shape
    %82 = "shape.meet"(%80, %81) : (!shape.shape, !shape.shape) -> !shape.shape
    %83 = "shape.print"(%82) : (!shape.shape) -> !shape.shape
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_parse_const_shape"}> ({
    %77 = "shape.const_shape"() <{shape = dense<> : tensor<0xindex>}> : () -> !shape.shape
    %78 = "shape.const_shape"() <{shape = dense<[1, 2, 3]> : tensor<3xindex>}> : () -> !shape.shape
    %79 = "shape.const_shape"() <{shape = dense<[1, 2, 3]> : tensor<3xindex>}> : () -> tensor<3xindex>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xindex>, sym_name = "test_shape_of"}> ({
  ^bb0(%arg53: tensor<?xf32>):
    %76 = "shape.shape_of"(%arg53) : (tensor<?xf32>) -> tensor<?xindex>
    "func.return"(%76) : (tensor<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.value_shape) -> tensor<?xf32>, sym_name = "test_value_of"}> ({
  ^bb0(%arg52: !shape.value_shape):
    %75 = "shape.value_of"(%arg52) : (!shape.value_shape) -> tensor<?xf32>
    "func.return"(%75) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_constraints"}> ({
    %64 = "shape.const_shape"() <{shape = dense<> : tensor<0xindex>}> : () -> !shape.shape
    %65 = "shape.const_shape"() <{shape = dense<[1, 2, 3]> : tensor<3xindex>}> : () -> !shape.shape
    %66 = "arith.constant"() <{value = true}> : () -> i1
    %67 = "shape.cstr_broadcastable"(%64, %65) : (!shape.shape, !shape.shape) -> !shape.witness
    %68 = "shape.cstr_eq"(%64, %65) : (!shape.shape, !shape.shape) -> !shape.witness
    %69 = "shape.const_witness"() <{passing = true}> : () -> !shape.witness
    %70 = "shape.const_witness"() <{passing = false}> : () -> !shape.witness
    %71 = "shape.cstr_require"(%66) <{msg = "msg"}> : (i1) -> !shape.witness
    %72 = "shape.assuming_all"(%67, %68, %69, %70, %71) : (!shape.witness, !shape.witness, !shape.witness, !shape.witness, !shape.witness) -> !shape.witness
    %73 = "shape.assuming"(%72) ({
      %74 = "shape.any"(%64, %65) : (!shape.shape, !shape.shape) -> !shape.shape
      "shape.assuming_yield"(%74) : (!shape.shape) -> ()
    }) : (!shape.witness) -> !shape.shape
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>, tensor<?xindex>) -> (), sym_name = "eq_on_extent_tensors"}> ({
  ^bb0(%arg50: tensor<?xindex>, %arg51: tensor<?xindex>):
    %63 = "shape.cstr_eq"(%arg50, %arg51) : (tensor<?xindex>, tensor<?xindex>) -> !shape.witness
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>, tensor<?xindex>) -> (), sym_name = "broadcastable_on_extent_tensors"}> ({
  ^bb0(%arg48: tensor<?xindex>, %arg49: tensor<?xindex>):
    %62 = "shape.cstr_broadcastable"(%arg48, %arg49) : (tensor<?xindex>, tensor<?xindex>) -> !shape.witness
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.size, index) -> (), sym_name = "mul"}> ({
  ^bb0(%arg46: !shape.size, %arg47: index):
    %59 = "shape.mul"(%arg46, %arg46) : (!shape.size, !shape.size) -> !shape.size
    %60 = "shape.mul"(%arg47, %arg47) : (index, index) -> index
    %61 = "shape.mul"(%arg46, %arg47) : (!shape.size, index) -> !shape.size
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.size, index) -> (), sym_name = "div"}> ({
  ^bb0(%arg44: !shape.size, %arg45: index):
    %56 = "shape.div"(%arg44, %arg44) : (!shape.size, !shape.size) -> !shape.size
    %57 = "shape.div"(%arg45, %arg45) : (index, index) -> index
    %58 = "shape.div"(%arg44, %arg45) : (!shape.size, index) -> !shape.size
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.size, index) -> (), sym_name = "add"}> ({
  ^bb0(%arg42: !shape.size, %arg43: index):
    %53 = "shape.add"(%arg42, %arg42) : (!shape.size, !shape.size) -> !shape.size
    %54 = "shape.add"(%arg43, %arg43) : (index, index) -> index
    %55 = "shape.add"(%arg42, %arg43) : (!shape.size, index) -> !shape.size
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "const_size"}> ({
    %50 = "shape.const_size"() <{value = 1 : index}> : () -> !shape.size
    %51 = "shape.const_size"() <{value = 2 : index}> : () -> !shape.size
    %52 = "shape.const_size"() <{value = 2 : index}> : () -> !shape.size
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.shape) -> tensor<3xindex>, sym_name = "test_to_extent_tensor"}> ({
  ^bb0(%arg41: !shape.shape):
    %49 = "shape.to_extent_tensor"(%arg41) : (!shape.shape) -> tensor<3xindex>
    "func.return"(%49) : (tensor<3xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3xindex>) -> tensor<3xindex>, sym_name = "test_identity_to_extent_tensor"}> ({
  ^bb0(%arg40: tensor<3xindex>):
    %48 = "shape.to_extent_tensor"(%arg40) : (tensor<3xindex>) -> tensor<3xindex>
    "func.return"(%48) : (tensor<3xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>) -> !shape.shape, sym_name = "test_from_extent_tensor"}> ({
  ^bb0(%arg39: tensor<?xindex>):
    %47 = "shape.from_extent_tensor"(%arg39) : (tensor<?xindex>) -> !shape.shape
    "func.return"(%47) : (!shape.shape) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.shape) -> !shape.size, sym_name = "rank"}> ({
  ^bb0(%arg38: !shape.shape):
    %46 = "shape.rank"(%arg38) : (!shape.shape) -> !shape.size
    "func.return"(%46) : (!shape.size) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>) -> index, sym_name = "rank_on_extent_tensor"}> ({
  ^bb0(%arg37: tensor<?xindex>):
    %45 = "shape.rank"(%arg37) : (tensor<?xindex>) -> index
    "func.return"(%45) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.shape, !shape.shape) -> i1, sym_name = "shape_eq_on_shapes"}> ({
  ^bb0(%arg35: !shape.shape, %arg36: !shape.shape):
    %44 = "shape.shape_eq"(%arg35, %arg36) : (!shape.shape, !shape.shape) -> i1
    "func.return"(%44) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>, tensor<?xindex>) -> i1, sym_name = "shape_eq_on_tensors"}> ({
  ^bb0(%arg33: tensor<?xindex>, %arg34: tensor<?xindex>):
    %43 = "shape.shape_eq"(%arg33, %arg34) : (tensor<?xindex>, tensor<?xindex>) -> i1
    "func.return"(%43) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>, !shape.shape) -> i1, sym_name = "shape_eq_on_mixed"}> ({
  ^bb0(%arg31: tensor<?xindex>, %arg32: !shape.shape):
    %42 = "shape.shape_eq"(%arg31, %arg32) : (tensor<?xindex>, !shape.shape) -> i1
    "func.return"(%42) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.shape) -> !shape.size, sym_name = "get_extent_on_shape"}> ({
  ^bb0(%arg30: !shape.shape):
    %40 = "shape.const_size"() <{value = 0 : index}> : () -> !shape.size
    %41 = "shape.get_extent"(%arg30, %40) : (!shape.shape, !shape.size) -> !shape.size
    "func.return"(%41) : (!shape.size) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>) -> index, sym_name = "get_extent_on_extent_tensor"}> ({
  ^bb0(%arg29: tensor<?xindex>):
    %38 = "arith.constant"() <{value = 0 : index}> : () -> index
    %39 = "shape.get_extent"(%arg29, %38) : (tensor<?xindex>, index) -> index
    "func.return"(%39) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xindex>) -> index, sym_name = "get_dim"}> ({
  ^bb0(%arg28: memref<?x?xindex>):
    %36 = "arith.constant"() <{value = 0 : index}> : () -> index
    %37 = "shape.dim"(%arg28, %36) : (memref<?x?xindex>, index) -> index
    "func.return"(%37) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>) -> !shape.size, sym_name = "get_extent_on_mixed_operands"}> ({
  ^bb0(%arg27: tensor<?xindex>):
    %34 = "shape.const_size"() <{value = 0 : index}> : () -> !shape.size
    %35 = "shape.get_extent"(%arg27, %34) : (tensor<?xindex>, !shape.size) -> !shape.size
    "func.return"(%35) : (!shape.size) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "any"}> ({
    %28 = "shape.const_shape"() <{shape = dense<[1, 2, 3]> : tensor<3xindex>}> : () -> !shape.shape
    %29 = "shape.const_shape"() <{shape = dense<[4, 5, 6]> : tensor<3xindex>}> : () -> !shape.shape
    %30 = "shape.any"(%28, %29) : (!shape.shape, !shape.shape) -> !shape.shape
    %31 = "shape.const_shape"() <{shape = dense<[1, 2, 3]> : tensor<3xindex>}> : () -> tensor<3xindex>
    %32 = "shape.const_shape"() <{shape = dense<[4, 5, 6]> : tensor<3xindex>}> : () -> tensor<3xindex>
    %33 = "shape.any"(%31, %32) : (tensor<3xindex>, tensor<3xindex>) -> tensor<3xindex>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>) -> index, sym_name = "num_elements_extent_tensor"}> ({
  ^bb0(%arg26: tensor<?xindex>):
    %27 = "shape.num_elements"(%arg26) : (tensor<?xindex>) -> index
    "func.return"(%27) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.shape) -> !shape.size, sym_name = "num_elements_shape"}> ({
  ^bb0(%arg25: !shape.shape):
    %26 = "shape.num_elements"(%arg25) : (!shape.shape) -> !shape.size
    "func.return"(%26) : (!shape.size) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.value_shape, !shape.value_shape) -> !shape.shape, sym_name = "shape_equal_shapes"}> ({
  ^bb0(%arg23: !shape.value_shape, %arg24: !shape.value_shape):
    %23 = "shape.shape_of"(%arg23) : (!shape.value_shape) -> !shape.shape
    %24 = "shape.shape_of"(%arg24) : (!shape.value_shape) -> !shape.shape
    %25 = "shape.meet"(%23, %24) : (!shape.shape, !shape.shape) -> !shape.shape
    "func.return"(%25) : (!shape.shape) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.value_shape, !shape.value_shape) -> !shape.shape, sym_name = "shape_with_shape"}> ({
  ^bb0(%arg21: !shape.value_shape, %arg22: !shape.value_shape):
    %20 = "shape.shape_of"(%arg21) : (!shape.value_shape) -> !shape.shape
    %21 = "shape.with_shape"(%arg22, %20) : (!shape.value_shape, !shape.shape) -> !shape.value_shape
    %22 = "func.call"(%arg21, %21) <{callee = @shape_equal_shapes}> : (!shape.value_shape, !shape.value_shape) -> !shape.shape
    "func.return"(%22) : (!shape.shape) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32>, !shape.value_shape) -> !shape.value_shape, sym_name = "shape_with_shape_extent_tensor_type"}> ({
  ^bb0(%arg19: tensor<?x?x?xf32>, %arg20: !shape.value_shape):
    %18 = "shape.shape_of"(%arg19) : (tensor<?x?x?xf32>) -> tensor<3xindex>
    %19 = "shape.with_shape"(%arg20, %18) : (!shape.value_shape, tensor<3xindex>) -> !shape.value_shape
    "func.return"(%19) : (!shape.value_shape) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.shape, !shape.shape, !shape.shape) -> !shape.shape, sym_name = "any_on_shape"}> ({
  ^bb0(%arg16: !shape.shape, %arg17: !shape.shape, %arg18: !shape.shape):
    %17 = "shape.any"(%arg16, %arg17, %arg18) : (!shape.shape, !shape.shape, !shape.shape) -> !shape.shape
    "func.return"(%17) : (!shape.shape) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>, tensor<?xindex>, !shape.shape) -> !shape.shape, sym_name = "any_on_mixed"}> ({
  ^bb0(%arg13: tensor<?xindex>, %arg14: tensor<?xindex>, %arg15: !shape.shape):
    %16 = "shape.any"(%arg13, %arg14, %arg15) : (tensor<?xindex>, tensor<?xindex>, !shape.shape) -> !shape.shape
    "func.return"(%16) : (!shape.shape) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>, tensor<?xindex>, tensor<?xindex>) -> tensor<?xindex>, sym_name = "any_on_extent_tensors"}> ({
  ^bb0(%arg10: tensor<?xindex>, %arg11: tensor<?xindex>, %arg12: tensor<?xindex>):
    %15 = "shape.any"(%arg10, %arg11, %arg12) : (tensor<?xindex>, tensor<?xindex>, tensor<?xindex>) -> tensor<?xindex>
    "func.return"(%15) : (tensor<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xindex>, tensor<?xindex>) -> i1, sym_name = "is_broadcastable_on_extent_tensors"}> ({
  ^bb0(%arg8: tensor<?xindex>, %arg9: tensor<?xindex>):
    %14 = "shape.is_broadcastable"(%arg8, %arg9) : (tensor<?xindex>, tensor<?xindex>) -> i1
    "func.return"(%14) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.shape, !shape.shape) -> i1, sym_name = "is_broadcastable_on_shapes"}> ({
  ^bb0(%arg6: !shape.shape, %arg7: !shape.shape):
    %13 = "shape.is_broadcastable"(%arg6, %arg7) : (!shape.shape, !shape.shape) -> i1
    "func.return"(%13) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.shape) -> !shape.shape, sym_name = "shape_upper_bounded_by_constant"}> ({
  ^bb0(%arg5: !shape.shape):
    %10 = "shape.const_shape"() <{shape = dense<[4, 57, 92]> : tensor<3xindex>}> : () -> !shape.shape
    %11 = "shape.max"(%arg5, %10) : (!shape.shape, !shape.shape) -> !shape.shape
    %12 = "shape.meet"(%10, %11) <{error = "exceeded element-wise upper bound"}> : (!shape.shape, !shape.shape) -> !shape.shape
    "func.return"(%12) : (!shape.shape) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.shape) -> !shape.shape, sym_name = "shape_lower_bounded_by_constant"}> ({
  ^bb0(%arg4: !shape.shape):
    %7 = "shape.const_shape"() <{shape = dense<[4, 57, 92]> : tensor<3xindex>}> : () -> !shape.shape
    %8 = "shape.min"(%arg4, %7) : (!shape.shape, !shape.shape) -> !shape.shape
    %9 = "shape.meet"(%7, %8) <{error = "lower bound element-wise exceeded"}> : (!shape.shape, !shape.shape) -> !shape.shape
    "func.return"(%9) : (!shape.shape) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.size) -> !shape.size, sym_name = "size_upper_bounded_by_constant"}> ({
  ^bb0(%arg3: !shape.size):
    %4 = "shape.const_size"() <{value = 5 : index}> : () -> !shape.size
    %5 = "shape.max"(%arg3, %4) : (!shape.size, !shape.size) -> !shape.size
    %6 = "shape.meet"(%4, %5) <{error = "exceeded element-wise upper bound"}> : (!shape.size, !shape.size) -> !shape.size
    "func.return"(%6) : (!shape.size) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.size) -> !shape.size, sym_name = "size_lower_bounded_by_constant"}> ({
  ^bb0(%arg2: !shape.size):
    %1 = "shape.const_size"() <{value = 9 : index}> : () -> !shape.size
    %2 = "shape.min"(%arg2, %1) : (!shape.size, !shape.size) -> !shape.size
    %3 = "shape.meet"(%1, %2) <{error = "lower bound element-wise exceeded"}> : (!shape.size, !shape.size) -> !shape.size
    "func.return"(%3) : (!shape.size) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "meet_index"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "shape.meet"(%arg0, %arg1) : (index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

