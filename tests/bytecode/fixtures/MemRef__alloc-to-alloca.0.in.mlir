"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "large_alloc"}> ({
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32> loc("<stdin>":5:10)
    %9 = "memref.cast"(%8) : (memref<100x100xf32>) -> memref<*xf32> loc("<stdin>":6:10)
    "func.call"(%9) <{callee = @callee}> : (memref<*xf32>) -> () loc("<stdin>":7:5)
    "memref.dealloc"(%8) : (memref<100x100xf32>) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "small_alloc"}> ({
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32> loc("<stdin>":12:10)
    %7 = "memref.cast"(%6) : (memref<2x2xf32>) -> memref<*xf32> loc("<stdin>":13:10)
    "func.call"(%7) <{callee = @callee}> : (memref<*xf32>) -> () loc("<stdin>":14:5)
    "memref.dealloc"(%6) : (memref<2x2xf32>) -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = () -> (), sym_name = "no_dealloc"}> ({
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32> loc("<stdin>":19:10)
    %5 = "memref.cast"(%4) : (memref<2x2xf32>) -> memref<*xf32> loc("<stdin>":20:10)
    "func.call"(%5) <{callee = @callee}> : (memref<*xf32>) -> () loc("<stdin>":21:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = () -> (), sym_name = "mismatching_scope"}> ({
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32> loc("<stdin>":25:10)
    %3 = "memref.cast"(%2) : (memref<2x2xf32>) -> memref<*xf32> loc("<stdin>":26:10)
    "func.call"(%3) <{callee = @callee}> : (memref<*xf32>) -> () loc("<stdin>":27:5)
    "scf.execute_region"() ({
      "memref.dealloc"(%2) : (memref<2x2xf32>) -> () loc("<stdin>":29:7)
      "scf.yield"() : () -> () loc("<stdin>":30:7)
    }) : () -> () loc("<stdin>":28:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":24:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "all"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":36:10)):
      %1 = "transform.structured.match"(%arg1) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":37:12)
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.alloc_to_alloca"() : () -> () loc("<stdin>":39:9)
      }) : (!transform.any_op) -> () loc("<stdin>":38:7)
      "transform.yield"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":35:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":34:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "small"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":46:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":47:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.alloc_to_alloca"() <{size_limit = 32 : i64}> : () -> () loc("<stdin>":49:9)
      }) : (!transform.any_op) -> () loc("<stdin>":48:7)
      "transform.yield"() : () -> () loc("<stdin>":51:7)
    }) : () -> () loc("<stdin>":45:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":44:3)
}) : () -> () loc("<stdin>":1:1)
