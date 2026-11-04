"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "conversion_dealloc_empty"}> ({
    "bufferization.dealloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xi32>, memref<2xi32>) -> (i1, i1), sym_name = "conversion_dealloc_empty_but_retains"}> ({
  ^bb0(%arg0: memref<2xi32>, %arg1: memref<2xi32>):
    %0:2 = "bufferization.dealloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 0, 0, 2>}> : (memref<2xi32>, memref<2xi32>) -> (i1, i1)
    "func.return"(%0#0, %0#1) : (i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, i1) -> (), sym_name = "conversion_dealloc_simple"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: i1):
    "bufferization.dealloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (memref<2xf32>, i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, memref<1xf32>, i1, memref<2xf32>) -> (i1, i1), sym_name = "conversion_dealloc_one_memref_and_multiple_retained"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: memref<1xf32>, %arg2: i1, %arg3: memref<2xf32>):
    %0:2 = "bufferization.dealloc"(%arg0, %arg2, %arg1, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (memref<2xf32>, i1, memref<1xf32>, memref<2xf32>) -> (i1, i1)
    "func.return"(%0#0, %0#1) : (i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, memref<5xf32>, memref<1xf32>, i1, i1, memref<2xf32>) -> (i1, i1), sym_name = "conversion_dealloc_multiple_memrefs_and_retained"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: memref<5xf32>, %arg2: memref<1xf32>, %arg3: i1, %arg4: i1, %arg5: memref<2xf32>):
    %0:2 = "bufferization.dealloc"(%arg0, %arg1, %arg3, %arg4, %arg2, %arg5) <{operandSegmentSizes = array<i32: 2, 2, 2>}> : (memref<2xf32>, memref<5xf32>, i1, i1, memref<1xf32>, memref<2xf32>) -> (i1, i1)
    "func.return"(%0#0, %0#1) : (i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() <{sym_name = "conversion_nest_module_dealloc_helper"}> ({
  "func.func"() <{function_type = (memref<2xf32>, memref<5xf32>, memref<1xf32>, i1, i1, memref<2xf32>) -> (i1, i1), sym_name = "top_level_func"}> ({
  ^bb0(%arg16: memref<2xf32>, %arg17: memref<5xf32>, %arg18: memref<1xf32>, %arg19: i1, %arg20: i1, %arg21: memref<2xf32>):
    %3:2 = "bufferization.dealloc"(%arg16, %arg17, %arg19, %arg20, %arg18, %arg21) <{operandSegmentSizes = array<i32: 2, 2, 2>}> : (memref<2xf32>, memref<5xf32>, i1, i1, memref<1xf32>, memref<2xf32>) -> (i1, i1)
    "func.return"(%3#0, %3#1) : (i1, i1) -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "nested_module_not_need_dealloc_helper"}> ({
    "func.func"() <{function_type = (memref<2xf32>, memref<1xf32>, i1, memref<2xf32>) -> (i1, i1), sym_name = "nested_module_not_need_dealloc_helper_func"}> ({
    ^bb0(%arg12: memref<2xf32>, %arg13: memref<1xf32>, %arg14: i1, %arg15: memref<2xf32>):
      %2:2 = "bufferization.dealloc"(%arg12, %arg14, %arg13, %arg15) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (memref<2xf32>, i1, memref<1xf32>, memref<2xf32>) -> (i1, i1)
      "func.return"(%2#0, %2#1) : (i1, i1) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "nested_module_need_dealloc_helper"}> ({
    "func.func"() <{function_type = (memref<2xf32>, memref<5xf32>, memref<1xf32>, i1, i1, memref<2xf32>) -> (i1, i1), sym_name = "nested_module_need_dealloc_helper_func0"}> ({
    ^bb0(%arg6: memref<2xf32>, %arg7: memref<5xf32>, %arg8: memref<1xf32>, %arg9: i1, %arg10: i1, %arg11: memref<2xf32>):
      %1:2 = "bufferization.dealloc"(%arg6, %arg7, %arg9, %arg10, %arg8, %arg11) <{operandSegmentSizes = array<i32: 2, 2, 2>}> : (memref<2xf32>, memref<5xf32>, i1, i1, memref<1xf32>, memref<2xf32>) -> (i1, i1)
      "func.return"(%1#0, %1#1) : (i1, i1) -> ()
    }) : () -> ()
    "func.func"() <{function_type = (memref<2xf32>, memref<5xf32>, memref<1xf32>, i1, i1, memref<2xf32>) -> (i1, i1), sym_name = "nested_module_need_dealloc_helper_func1"}> ({
    ^bb0(%arg0: memref<2xf32>, %arg1: memref<5xf32>, %arg2: memref<1xf32>, %arg3: i1, %arg4: i1, %arg5: memref<2xf32>):
      %0:2 = "bufferization.dealloc"(%arg0, %arg1, %arg3, %arg4, %arg2, %arg5) <{operandSegmentSizes = array<i32: 2, 2, 2>}> : (memref<2xf32>, memref<5xf32>, i1, i1, memref<1xf32>, memref<2xf32>) -> (i1, i1)
      "func.return"(%0#0, %0#1) : (i1, i1) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

