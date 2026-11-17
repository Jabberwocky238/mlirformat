"builtin.module"() ({
  "func.func"() <{function_type = (memref<32x18xf32>) -> memref<32x18xf32>, sym_name = "check_static_return"}> ({
  ^bb0(%arg6: memref<32x18xf32> loc("<stdin>":3:8)):
    "func.return"(%arg6) : (memref<32x18xf32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<32x18xf32, strided<[22, 1], offset: 7>>) -> memref<32x18xf32, strided<[22, 1], offset: 7>>, sym_name = "check_static_return_with_offset"}> ({
  ^bb0(%arg5: memref<32x18xf32, strided<[22, 1], offset: 7>> loc("<stdin>":7:8)):
    "func.return"(%arg5) : (memref<32x18xf32, strided<[22, 1], offset: 7>>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (memref<10xi8>) -> memref<20xi8>, sym_name = "foo", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (memref<10xi8>) -> memref<20xi8>, sym_name = "check_memref_func_call"}> ({
  ^bb0(%arg4: memref<10xi8> loc("<stdin>":13:8)):
    %1 = "func.call"(%arg4) <{callee = @foo}> : (memref<10xi8>) -> memref<20xi8> loc("<stdin>":14:10)
    "func.return"(%1) : (memref<20xi8>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (memref<?xf32>, memref<?xf32>), sym_name = "unconvertible_multiresult"}> ({
  ^bb0(%arg2: memref<?xf32> loc("<stdin>":18:8), %arg3: memref<?xf32> loc("<stdin>":18:30)):
    "func.return"(%arg2, %arg3) : (memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "unranked_memref"}> ({
  ^bb0(%arg1: memref<*xi32> loc("<stdin>":22:8)):
    "func.call"(%arg1) <{callee = @printMemrefI32}> : (memref<*xi32>) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":26:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":30:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":31:12)
      "transform.apply_conversion_patterns"(%0) <{legal_dialects = ["llvm"], partial_conversion}> ({
        "transform.apply_conversion_patterns.func.func_to_llvm"() : () -> () loc("<stdin>":33:9)
      }, {
        "transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter"() <{use_bare_ptr_call_conv = true}> {use_opaque_pointers = true} : () -> () loc("<stdin>":35:9)
      }) : (!transform.any_op) -> () loc("<stdin>":32:7)
      "transform.yield"() : () -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":29:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":1:1)
