"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, !llvm.ptr) -> (), sym_name = "omp_target_update_map_iterated"}> ({
  ^bb0(%arg0: index loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:22), %arg2: index loc("<stdin>":4:36), %arg3: !llvm.ptr loc("<stdin>":4:50)):
    %0 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":5:10)
    %1 = "omp.iterator"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg4: index loc("<stdin>":7:10)):
      %2 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":8:12)
      "omp.yield"(%2) : (!llvm.ptr) -> () loc("<stdin>":9:7)
    }) : (index, index, index) -> !omp.iterated<!llvm.ptr> loc("<stdin>":6:10)
    "omp.target_update"(%0, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 1>}> : (!llvm.ptr, !omp.iterated<!llvm.ptr>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
