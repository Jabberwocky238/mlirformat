"builtin.module"() ({
  "func.func"() <{function_type = (memref<10x10xf32>, memref<10x10xf32>, memref<10x10xf32>) -> memref<10x10xf32>, sym_name = "compute1"}> ({
  ^bb0(%arg0: memref<10x10xf32>, %arg1: memref<10x10xf32>, %arg2: memref<10x10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    "acc.parallel"(%3) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%0, %0, %0, %1, %1, %1, %2, %2, %2) <{collapse = [3], collapseDeviceType = [#acc.device_type<none>], gang = [#acc.device_type<none>], inclusiveUpperbound = array<i1: true, true, true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0>, vector = [#acc.device_type<none>]}> ({
      ^bb0(%arg3: index, %arg4: index, %arg5: index):
        %4 = "memref.load"(%arg0, %arg3, %arg5) : (memref<10x10xf32>, index, index) -> f32
        %5 = "memref.load"(%arg1, %arg5, %arg4) : (memref<10x10xf32>, index, index) -> f32
        %6 = "memref.load"(%arg2, %arg3, %arg4) : (memref<10x10xf32>, index, index) -> f32
        %7 = "arith.mulf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %8 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "memref.store"(%8, %arg2, %arg3, %arg4) : (f32, memref<10x10xf32>, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index, index, index, index, index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i64) -> ()
    "func.return"(%arg2) : (memref<10x10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10x10xf32>, memref<10x10xf32>, memref<10x10xf32>) -> memref<10x10xf32>, sym_name = "compute2"}> ({
  ^bb0(%arg0: memref<10x10xf32>, %arg1: memref<10x10xf32>, %arg2: memref<10x10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
      ^bb0(%arg3: index):
        "scf.for"(%0, %1, %2) ({
        ^bb0(%arg4: index):
          "scf.for"(%0, %1, %2) ({
          ^bb0(%arg5: index):
            %3 = "memref.load"(%arg0, %arg3, %arg5) : (memref<10x10xf32>, index, index) -> f32
            %4 = "memref.load"(%arg1, %arg5, %arg4) : (memref<10x10xf32>, index, index) -> f32
            %5 = "memref.load"(%arg2, %arg3, %arg4) : (memref<10x10xf32>, index, index) -> f32
            %6 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            %7 = "arith.addf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "memref.store"(%7, %arg2, %arg3, %arg4) : (f32, memref<10x10xf32>, index, index) -> ()
            "scf.yield"() : () -> ()
          }) : (index, index, index) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%arg2) : (memref<10x10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_f32", type = memref<10xf32>}> ({
  ^bb0(%arg8: memref<10xf32>):
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%16) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg7: memref<10xf32>):
    "memref.dealloc"(%arg7) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10x10xf32>, memref<10x10xf32>, memref<10xf32>, memref<10xf32>) -> memref<10xf32>, sym_name = "compute3"}> ({
  ^bb0(%arg0: memref<10x10xf32>, %arg1: memref<10x10xf32>, %arg2: memref<10xf32>, %arg3: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "arith.constant"() <{value = 10 : i64}> : () -> i64
    %4 = "arith.constant"() <{value = 10 : i64}> : () -> i64
    %5 = "acc.present"(%arg0) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10x10xf32>}> : (memref<10x10xf32>) -> memref<10x10xf32>
    %6 = "acc.present"(%arg1) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10x10xf32>}> : (memref<10x10xf32>) -> memref<10x10xf32>
    %7 = "acc.present"(%arg2) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    %8 = "acc.present"(%arg3) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.data"(%5, %6, %7, %8) <{operandSegmentSizes = array<i32: 0, 0, 0, 4>}> ({
      %9 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_f32, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
      "acc.parallel"(%3, %4, %9) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, numWorkersDeviceType = [#acc.device_type<nvidia>], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0>}> ({
        "acc.loop"(%0, %2, %1) <{gang = [#acc.device_type<none>], inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        ^bb0(%arg4: index):
          "acc.loop"(%0, %2, %1) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, worker = [#acc.device_type<none>]}> ({
          ^bb0(%arg6: index):
            %13 = "memref.load"(%arg0, %arg4, %arg6) : (memref<10x10xf32>, index, index) -> f32
            %14 = "memref.load"(%arg1, %arg4, %arg6) : (memref<10x10xf32>, index, index) -> f32
            %15 = "arith.addf"(%13, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "memref.store"(%15, %arg2, %arg6) : (f32, memref<10xf32>, index) -> ()
            "acc.yield"() : () -> ()
          }) : (index, index, index) -> ()
          "acc.loop"(%0, %2, %1) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<nvidia>]}> ({
          ^bb0(%arg5: index):
            %10 = "memref.load"(%arg2, %arg5) : (memref<10xf32>, index) -> f32
            %11 = "memref.load"(%arg3, %arg4) : (memref<10xf32>, index) -> f32
            %12 = "arith.addf"(%10, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "memref.store"(%12, %arg3, %arg4) : (f32, memref<10xf32>, index) -> ()
            "acc.yield"() : () -> ()
          }) : (index, index, index) -> ()
          "acc.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (i64, i64, memref<10xf32>) -> ()
      "acc.terminator"() : () -> ()
    }) : (memref<10x10xf32>, memref<10x10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "func.return"(%arg3) : (memref<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "testloopop"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 10 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.loop"(%3, %4, %5) <{gang = [#acc.device_type<none>], inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, vector = [#acc.device_type<none>], worker = [#acc.device_type<none>]}> ({
    ^bb0(%arg17: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "acc.loop"(%3, %4, %5, %0) <{gang = [], gangOperandsArgType = [#acc.gang_arg_type<Num>], gangOperandsDeviceType = [#acc.device_type<none>], gangOperandsSegments = array<i32: 1>, inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg16: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i64) -> ()
    "acc.loop"(%3, %4, %5, %0) <{gang = [], gangOperandsArgType = [#acc.gang_arg_type<Static>], gangOperandsDeviceType = [#acc.device_type<none>], gangOperandsSegments = array<i32: 1>, inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg15: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i64) -> ()
    "acc.loop"(%3, %4, %5, %0) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0>, workerNumOperandsDeviceType = [#acc.device_type<none>]}> ({
    ^bb0(%arg14: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i64) -> ()
    "acc.loop"(%3, %4, %5, %1) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0>, workerNumOperandsDeviceType = [#acc.device_type<none>]}> ({
    ^bb0(%arg13: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i32) -> ()
    "acc.loop"(%3, %4, %5, %2) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0>, workerNumOperandsDeviceType = [#acc.device_type<none>]}> ({
    ^bb0(%arg12: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index) -> ()
    "acc.loop"(%3, %4, %5, %0) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0>, vectorOperandsDeviceType = [#acc.device_type<none>]}> ({
    ^bb0(%arg11: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i64) -> ()
    "acc.loop"(%3, %4, %5, %1) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0>, vectorOperandsDeviceType = [#acc.device_type<none>]}> ({
    ^bb0(%arg10: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i32) -> ()
    "acc.loop"(%3, %4, %5, %2) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0>, vectorOperandsDeviceType = [#acc.device_type<none>]}> ({
    ^bb0(%arg9: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index) -> ()
    "acc.loop"(%3, %4, %5, %0) <{gang = [], gangOperandsArgType = [#acc.gang_arg_type<Num>], gangOperandsDeviceType = [#acc.device_type<none>], gangOperandsSegments = array<i32: 1>, inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0>, vector = [#acc.device_type<none>], worker = [#acc.device_type<none>]}> ({
    ^bb0(%arg8: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i64) -> ()
    "acc.loop"(%3, %4, %5, %0, %0, %0, %0) <{gang = [], gangOperandsArgType = [#acc.gang_arg_type<Num>, #acc.gang_arg_type<Static>], gangOperandsDeviceType = [#acc.device_type<none>], gangOperandsSegments = array<i32: 2>, inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 1, 0, 0, 0, 0, 0>, vectorOperandsDeviceType = [#acc.device_type<none>], workerNumOperandsDeviceType = [#acc.device_type<none>]}> ({
    ^bb0(%arg7: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i64, i64, i64, i64) -> ()
    "acc.loop"(%3, %4, %5, %1, %2) <{gang = [], gangOperandsArgType = [#acc.gang_arg_type<Num>, #acc.gang_arg_type<Static>], gangOperandsDeviceType = [#acc.device_type<none>], gangOperandsSegments = array<i32: 2>, inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg6: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i32, index) -> ()
    "acc.loop"(%3, %4, %5, %0, %0) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>}> ({
    ^bb0(%arg5: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i64, i64) -> ()
    "acc.loop"(%3, %4, %5, %1, %1) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>}> ({
    ^bb0(%arg4: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i32, i32) -> ()
    "acc.loop"(%3, %4, %5, %0, %0) <{gang = [], gangOperandsArgType = [#acc.gang_arg_type<Static>, #acc.gang_arg_type<Num>], gangOperandsDeviceType = [#acc.device_type<none>], gangOperandsSegments = array<i32: 2>, inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg3: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i64, i64) -> ()
    "acc.loop"(%3, %4, %5, %0, %0) <{gang = [], gangOperandsArgType = [#acc.gang_arg_type<Dim>, #acc.gang_arg_type<Static>], gangOperandsDeviceType = [#acc.device_type<none>], gangOperandsSegments = array<i32: 2>, inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i64, i64) -> ()
    %6 = "acc.cache"(%arg0) <{dataClause = #acc<data_clause acc_cache>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.loop"(%3, %4, %5, %6) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg1: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "acc_loop_multiple_block"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg0: index):
        %3 = "arith.constant"() <{value = 1 : index}> : () -> index
        "cf.br"(%3)[^bb1] : (index) -> ()
      ^bb1(%4: index):  // 2 preds: ^bb0, ^bb2
        %5 = "arith.constant"() <{value = 0 : index}> : () -> index
        %6 = "arith.cmpi"(%4, %5) <{predicate = 4 : i64}> : (index, index) -> i1
        "cf.cond_br"(%6)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb2:  // pred: ^bb1
        %7 = "arith.constant"() <{value = 1 : index}> : () -> index
        %8 = "arith.constant"() <{value = 10 : index}> : () -> index
        %9 = "arith.subi"(%8, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "cf.br"(%9)[^bb1] : (index) -> ()
      ^bb3:  // pred: ^bb1
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_10xf32", type = memref<10xf32>}> ({
  ^bb0(%arg6: memref<10xf32>):
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%4) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg4: memref<10xf32>, %arg5: memref<10xf32>):
    "memref.copy"(%arg4, %arg5) : (memref<10xf32>, memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  ^bb0(%arg3: memref<10xf32>):
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>) -> (), sym_name = "testloopfirstprivate"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "acc.firstprivate"(%arg0) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_10xf32, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.loop"(%0, %1, %2, %3) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0>}> ({
    ^bb0(%arg2: index):
      "test.openacc_dummy_op"() : () -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_f32", type = memref<10xf32>}> ({
  ^bb0(%arg10: memref<10xf32>):
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%8) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg9: memref<10xf32>):
    "memref.dealloc"(%arg9) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_10_f32", type = memref<10x10xf32>}> ({
  ^bb0(%arg8: memref<10x10xf32>):
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    "acc.yield"(%7) : (memref<10x10xf32>) -> ()
  }, {
  ^bb0(%arg7: memref<10x10xf32>):
    "memref.dealloc"(%arg7) : (memref<10x10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.firstprivate.recipe"() <{sym_name = "privatization_memref_10xf32", type = memref<10xf32>}> ({
  ^bb0(%arg6: memref<10xf32>):
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%6) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg4: memref<10xf32>, %arg5: memref<10xf32>):
    "acc.terminator"() : () -> ()
  }, {
  ^bb0(%arg3: memref<10xf32>):
    "memref.dealloc"(%arg3) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<10x10xf32>) -> (), sym_name = "testparallelop"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10x10xf32>):
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.parallel"(%0) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i64) -> ()
    "acc.parallel"(%1) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i32) -> ()
    "acc.parallel"(%2) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (index) -> ()
    "acc.parallel"(%0) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i64) -> ()
    "acc.parallel"(%1) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i32) -> ()
    "acc.parallel"(%2) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (index) -> ()
    "acc.parallel"(%0, %1, %2) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 3>}> ({
    }) : (i64, i32, index) -> ()
    "acc.parallel"(%0) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i64) -> ()
    "acc.parallel"(%1) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i32) -> ()
    "acc.parallel"(%2) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 1>, operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (index) -> ()
    "acc.parallel"(%0, %0, %2) <{numGangsDeviceType = [#acc.device_type<none>], numGangsSegments = array<i32: 3>, operandSegmentSizes = array<i32: 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i64, i64, index) -> ()
    "acc.parallel"(%0) <{numWorkersDeviceType = [#acc.device_type<nvidia>], operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i64) -> ()
    "acc.parallel"(%1) <{numWorkersDeviceType = [#acc.device_type<default>], operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i32) -> ()
    "acc.parallel"(%2) <{numWorkersDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (index) -> ()
    "acc.parallel"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0>, vectorLengthDeviceType = [#acc.device_type<none>]}> ({
    }) : (i64) -> ()
    "acc.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0>, vectorLengthDeviceType = [#acc.device_type<none>]}> ({
    }) : (i32) -> ()
    "acc.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0>, vectorLengthDeviceType = [#acc.device_type<none>]}> ({
    }) : (index) -> ()
    %3 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_f32, structured = true, varType = f32}> : (memref<10xf32>) -> memref<10xf32>
    %4 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_10_f32, structured = true, varType = f32}> : (memref<10x10xf32>) -> memref<10x10xf32>
    %5 = "acc.firstprivate"(%arg1) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10xf32, structured = true, varType = f32}> : (memref<10xf32>) -> memref<10xf32>
    "acc.parallel"(%3, %4, %5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0>}> ({
    }) : (memref<10xf32>, memref<10x10xf32>, memref<10xf32>) -> ()
    "acc.parallel"() <{defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.parallel"() <{defaultAttr = #acc<defaultvalue present>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.parallel"() <{asyncOnly = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [#acc.device_type<none>]}> ({
    }) : () -> ()
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, selfAttr}> ({
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_f32", type = memref<10xf32>}> ({
  ^bb0(%arg13: memref<10xf32>):
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%9) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg12: memref<10xf32>):
    "memref.dealloc"(%arg12) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_10_f32", type = memref<10x10xf32>}> ({
  ^bb0(%arg11: memref<10x10xf32>):
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    "acc.yield"(%8) : (memref<10x10xf32>) -> ()
  }, {
  ^bb0(%arg10: memref<10x10xf32>):
    "memref.dealloc"(%arg10) : (memref<10x10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_20xf32", type = memref<20xf32>}> ({
  ^bb0(%arg9: memref<20xf32>):
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20xf32>
    "acc.yield"(%7) : (memref<20xf32>) -> ()
  }, {
  ^bb0(%arg7: memref<20xf32>, %arg8: memref<20xf32>):
    "acc.terminator"() : () -> ()
  }, {
  }) : () -> ()
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_10xf32", type = memref<10xf32>}> ({
  ^bb0(%arg6: memref<10xf32>):
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%6) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg4: memref<10xf32>, %arg5: memref<10xf32>):
    "memref.copy"(%arg4, %arg5) : (memref<10xf32>, memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  ^bb0(%arg3: memref<10xf32>):
    "memref.dealloc"(%arg3) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<10x10xf32>) -> (), sym_name = "testserialop"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10x10xf32>):
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.serial"(%0) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i64) -> ()
    "acc.serial"(%1) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i32) -> ()
    "acc.serial"(%2) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (index) -> ()
    "acc.serial"(%0) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i64) -> ()
    "acc.serial"(%1) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i32) -> ()
    "acc.serial"(%2) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (index) -> ()
    "acc.serial"(%0, %1, %2) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 3, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 3>}> ({
    }) : (i64, i32, index) -> ()
    %3 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_f32, structured = true, varType = f32}> : (memref<10xf32>) -> memref<10xf32>
    %4 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_10_f32, structured = true, varType = f32}> : (memref<10x10xf32>) -> memref<10x10xf32>
    %5 = "acc.firstprivate"(%arg1) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_10xf32, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.serial"(%3, %4, %5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2, 1, 0>}> ({
    }) : (memref<10xf32>, memref<10x10xf32>, memref<10xf32>) -> ()
    "acc.serial"() <{defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.serial"() <{defaultAttr = #acc<defaultvalue present>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.serial"() <{asyncOnly = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [#acc.device_type<none>]}> ({
    }) : () -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>, selfAttr}> ({
    }) : () -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>, selfAttr}> ({
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<10x10xf32>) -> (), sym_name = "testserialop"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10x10xf32>):
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.kernels"(%0) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i64) -> ()
    "acc.kernels"(%1) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i32) -> ()
    "acc.kernels"(%2) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (index) -> ()
    "acc.kernels"(%0) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i64) -> ()
    "acc.kernels"(%1) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i32) -> ()
    "acc.kernels"(%2) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (index) -> ()
    "acc.kernels"(%0, %1, %2) <{hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 3>}> ({
    }) : (i64, i32, index) -> ()
    "acc.kernels"() <{defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.kernels"() <{defaultAttr = #acc<defaultvalue present>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.kernels"() <{asyncOnly = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, waitOnly = [#acc.device_type<none>]}> ({
    }) : () -> ()
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, selfAttr}> ({
    }) : () -> ()
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, selfAttr}> ({
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_f32", type = memref<10xf32>}> ({
  ^bb0(%arg10: memref<10xf32>):
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%5) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg9: memref<10xf32>):
    "memref.dealloc"(%arg9) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_10_f32", type = memref<10x10xf32>}> ({
  ^bb0(%arg8: memref<10x10xf32>):
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    "acc.yield"(%4) : (memref<10x10xf32>) -> ()
  }, {
  ^bb0(%arg7: memref<10x10xf32>):
    "memref.dealloc"(%arg7) : (memref<10x10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_10xf32", type = memref<10xf32>}> ({
  ^bb0(%arg6: memref<10xf32>):
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%3) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg4: memref<10xf32>, %arg5: memref<10xf32>):
    "memref.copy"(%arg4, %arg5) : (memref<10xf32>, memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  ^bb0(%arg3: memref<10xf32>):
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<10x10xf32>) -> (), sym_name = "testkernelspriv"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10x10xf32>):
    %0 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_f32, structured = true, varType = f32}> : (memref<10xf32>) -> memref<10xf32>
    %1 = "acc.private"(%arg2) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_10_f32, structured = true, varType = f32}> : (memref<10x10xf32>) -> memref<10x10xf32>
    %2 = "acc.firstprivate"(%arg1) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @firstprivatization_memref_10xf32, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.kernels"(%0, %1, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0>}> ({
    }) : (memref<10xf32>, memref<10x10xf32>, memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<f32>, memref<f32>) -> (), sym_name = "testdataop"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>, %arg2: memref<f32>):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "acc.present"(%arg0) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%0, %1) <{operandSegmentSizes = array<i32: 1, 0, 0, 1>}> ({
    }) : (i1, memref<f32>) -> ()
    %2 = "acc.present"(%arg0) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%0, %2) <{operandSegmentSizes = array<i32: 1, 0, 0, 1>}> ({
    }) : (i1, memref<f32>) -> ()
    %3 = "acc.present"(%arg0) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %4 = "acc.present"(%arg1) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %5 = "acc.present"(%arg2) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%3, %4, %5) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    %6 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %7 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %8 = "acc.copyin"(%arg2) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%6, %7, %8) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    %9 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin_readonly>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %10 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copyin_readonly>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %11 = "acc.copyin"(%arg2) <{dataClause = #acc<data_clause acc_copyin_readonly>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%9, %10, %11) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    %12 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %13 = "acc.create"(%arg1) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %14 = "acc.create"(%arg2) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%12, %13, %14) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.copyout"(%12, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "acc.copyout"(%13, %arg1) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "acc.copyout"(%14, %arg2) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    %15 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_copyout_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %16 = "acc.create"(%arg1) <{dataClause = #acc<data_clause acc_copyout_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %17 = "acc.create"(%arg2) <{dataClause = #acc<data_clause acc_copyout_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%15, %16, %17) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.copyout"(%15, %arg0) <{dataClause = #acc<data_clause acc_copyout_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "acc.copyout"(%16, %arg1) <{dataClause = #acc<data_clause acc_copyout_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "acc.copyout"(%17, %arg2) <{dataClause = #acc<data_clause acc_copyout_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    %18 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %19 = "acc.create"(%arg1) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %20 = "acc.create"(%arg2) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%18, %19, %20) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.delete"(%18) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.delete"(%19) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.delete"(%20) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    %21 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %22 = "acc.create"(%arg1) <{dataClause = #acc<data_clause acc_create_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %23 = "acc.create"(%arg2) <{dataClause = #acc<data_clause acc_create_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%21, %22, %23) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.delete"(%21) <{dataClause = #acc<data_clause acc_create_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.delete"(%22) <{dataClause = #acc<data_clause acc_create_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.delete"(%23) <{dataClause = #acc<data_clause acc_create_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    %24 = "acc.nocreate"(%arg0) <{dataClause = #acc<data_clause acc_no_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %25 = "acc.nocreate"(%arg1) <{dataClause = #acc<data_clause acc_no_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %26 = "acc.nocreate"(%arg2) <{dataClause = #acc<data_clause acc_no_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%24, %25, %26) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    %27 = "acc.deviceptr"(%arg0) <{dataClause = #acc<data_clause acc_deviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %28 = "acc.deviceptr"(%arg1) <{dataClause = #acc<data_clause acc_deviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %29 = "acc.deviceptr"(%arg2) <{dataClause = #acc<data_clause acc_deviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%27, %28, %29) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    %30 = "acc.attach"(%arg0) <{dataClause = #acc<data_clause acc_attach>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %31 = "acc.attach"(%arg1) <{dataClause = #acc<data_clause acc_attach>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %32 = "acc.attach"(%arg2) <{dataClause = #acc<data_clause acc_attach>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%30, %31, %32) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    %33 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %34 = "acc.create"(%arg1) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %35 = "acc.present"(%arg2) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%33, %34, %35) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.copyout"(%34, %arg1) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    %36 = "acc.present"(%arg0) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%36) <{defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 1>}> ({
    }) : (memref<f32>) -> ()
    %37 = "acc.present"(%arg0) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%37) <{defaultAttr = #acc<defaultvalue present>, operandSegmentSizes = array<i32: 0, 0, 0, 1>}> ({
    }) : (memref<f32>) -> ()
    "acc.data"() <{defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
    }) : () -> ()
    "acc.data"() <{asyncOnly = [#acc.device_type<none>], defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
    }) : () -> ()
    %38 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    "acc.data"(%38) <{asyncOperandsDeviceType = [#acc.device_type<none>], defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 1, 0, 0>}> ({
    }) : (i64) -> ()
    "acc.data"() <{defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 0>, waitOnly = [#acc.device_type<none>]}> ({
    }) : () -> ()
    %39 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    "acc.data"(%39) <{defaultAttr = #acc<defaultvalue none>, hasWaitDevnum = [false], operandSegmentSizes = array<i32: 0, 0, 1, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 1>}> ({
    }) : (i64) -> ()
    %40 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    "acc.data"(%40, %39) <{defaultAttr = #acc<defaultvalue none>, hasWaitDevnum = [true], operandSegmentSizes = array<i32: 0, 0, 2, 0>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 2>}> ({
    }) : (i64, i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<f32>, memref<f32>) -> (), sym_name = "testdataopmodifiers"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>, %arg2: memref<f32>):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier zero,capture>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %1 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier always,readonly,capture>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %2 = "acc.copyin"(%arg2) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier always>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %3 = "acc.create"(%arg2) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier always>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.data"(%0, %1, %2, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 4>}> ({
    }) : (memref<f32>, memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.copyout"(%0, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier always,zero,capture>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "acc.delete"(%2) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier always>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.copyout"(%3, %arg2) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier always>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<f32>, memref<f32>) -> (), sym_name = "testupdateop"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>, %arg2: memref<f32>):
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = true}> : () -> i1
    %4 = "acc.update_device"(%arg0) <{dataClause = #acc<data_clause acc_update_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %5 = "acc.update_device"(%arg1) <{dataClause = #acc<data_clause acc_update_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %6 = "acc.update_device"(%arg2) <{dataClause = #acc<data_clause acc_update_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.update"(%0, %4) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i64, memref<f32>) -> ()
    "acc.update"(%1, %4) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i32, memref<f32>) -> ()
    "acc.update"(%1, %4) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (i32, memref<f32>) -> ()
    "acc.update"(%2, %4) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 1, 0, 1>}> : (index, memref<f32>) -> ()
    "acc.update"(%0, %1, %2, %4) <{hasWaitDevnum = [true], operandSegmentSizes = array<i32: 0, 0, 3, 1>, waitOnly = [], waitOperandsDeviceType = [#acc.device_type<none>], waitOperandsSegments = array<i32: 3>}> : (i64, i32, index, memref<f32>) -> ()
    "acc.update"(%3, %4) <{operandSegmentSizes = array<i32: 1, 0, 0, 1>}> : (i1, memref<f32>) -> ()
    "acc.update"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> : (memref<f32>) -> ()
    "acc.update"(%4, %5, %6) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>}> : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.update"(%4, %5, %6) <{asyncOnly = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 3>}> : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.update"(%4, %5, %6) <{operandSegmentSizes = array<i32: 0, 0, 0, 3>, waitOnly = [#acc.device_type<none>]}> : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.update"(%4, %5, %6) <{ifPresent, operandSegmentSizes = array<i32: 0, 0, 0, 3>}> : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
  %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
  %2 = "arith.constant"() <{value = 1 : index}> : () -> index
  %3 = "arith.constant"() <{value = true}> : () -> i1
  "acc.wait"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
  "acc.wait"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (i64) -> ()
  "acc.wait"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (i32) -> ()
  "acc.wait"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (index) -> ()
  "acc.wait"(%1, %2) <{operandSegmentSizes = array<i32: 2, 0, 0, 0>}> : (i32, index) -> ()
  "acc.wait"(%0) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>}> : (i64) -> ()
  "acc.wait"(%1) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>}> : (i32) -> ()
  "acc.wait"(%2) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>}> : (index) -> ()
  "acc.wait"(%1, %2) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (i32, index) -> ()
  "acc.wait"(%0, %1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>}> : (i64, i32) -> ()
  "acc.wait"() <{async, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
  "acc.wait"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> : (i64, index, i32) -> ()
  "acc.wait"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> : (i64, index, i32) -> ()
  "acc.wait"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> : (i1) -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
  %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
  %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
  %3 = "arith.constant"() <{value = 1 : index}> : () -> index
  %4 = "arith.constant"() <{value = true}> : () -> i1
  "acc.init"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
  "acc.init"() <{operandSegmentSizes = array<i32: 0, 0>}> {acc.device_types = [#acc.device_type<nvidia>]} : () -> ()
  "acc.init"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
  "acc.init"(%1) <{operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
  "acc.init"(%3) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> ()
  "acc.init"(%4) <{operandSegmentSizes = array<i32: 0, 1>}> : (i1) -> ()
  "acc.init"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> : (index, i1) -> ()
  "acc.init"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> : (index, i1) -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
  %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
  %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
  %3 = "arith.constant"() <{value = 1 : index}> : () -> index
  %4 = "arith.constant"() <{value = true}> : () -> i1
  "acc.shutdown"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
  "acc.shutdown"() <{operandSegmentSizes = array<i32: 0, 0>}> {acc.device_types = [#acc.device_type<default>]} : () -> ()
  "acc.shutdown"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
  "acc.shutdown"(%1) <{operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
  "acc.shutdown"(%3) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> ()
  "acc.shutdown"(%4) <{operandSegmentSizes = array<i32: 0, 1>}> : (i1) -> ()
  "acc.shutdown"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> : (index, i1) -> ()
  "acc.shutdown"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> : (index, i1) -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "arith.constant"() <{value = 2 : i32}> : () -> i32
  %1 = "acc.on_device"(%0) : (i32) -> i1
  %2 = "arith.constant"() <{value = 2 : index}> : () -> index
  %3 = "acc.on_device"(%2) : (index) -> i1
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "testexitdataop"}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (!llvm.ptr) -> ()
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr, !llvm.ptr) -> ()
    %5 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (!llvm.ptr) -> ()
    "acc.delete"(%5) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (!llvm.ptr) -> ()
    %6 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%6) <{async, finalize, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (!llvm.ptr) -> ()
    "acc.delete"(%6) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (!llvm.ptr) -> ()
    %7 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (!llvm.ptr) -> ()
    "acc.detach"(%7) <{dataClause = #acc<data_clause acc_detach>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (!llvm.ptr) -> ()
    %8 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%8) <{async, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (!llvm.ptr) -> ()
    "acc.copyout"(%8, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr, !llvm.ptr) -> ()
    %9 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%9) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>, wait}> : (!llvm.ptr) -> ()
    "acc.delete"(%9) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (!llvm.ptr) -> ()
    %10 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%1, %10) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 1>}> : (i64, !llvm.ptr) -> ()
    "acc.copyout"(%10, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr, !llvm.ptr) -> ()
    %11 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%1, %11) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 1>}> : (i64, !llvm.ptr) -> ()
    "acc.copyout"(%11, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr, !llvm.ptr) -> ()
    %12 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%0, %12) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 1>}> : (i1, !llvm.ptr) -> ()
    "acc.copyout"(%12, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr, !llvm.ptr) -> ()
    %13 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.exit_data"(%1, %2, %3, %13) <{operandSegmentSizes = array<i32: 0, 0, 1, 2, 1>}> : (i64, i32, index, !llvm.ptr) -> ()
    "acc.copyout"(%13, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> (), sym_name = "testenterdataop"}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.enter_data"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (!llvm.ptr) -> ()
    %5 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    %6 = "acc.create"(%arg1) <{dataClause = #acc<data_clause acc_create_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    %7 = "acc.create"(%arg2) <{dataClause = #acc<data_clause acc_create_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.enter_data"(%5, %6, %7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 3>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %8 = "acc.attach"(%arg0) <{dataClause = #acc<data_clause acc_attach>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.enter_data"(%8) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (!llvm.ptr) -> ()
    %9 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.enter_data"(%9) <{async, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (!llvm.ptr) -> ()
    %10 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.enter_data"(%10) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>, wait}> : (!llvm.ptr) -> ()
    %11 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.enter_data"(%1, %11) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 1>}> : (i64, !llvm.ptr) -> ()
    %12 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.enter_data"(%1, %12) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 1>}> : (i64, !llvm.ptr) -> ()
    %13 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.enter_data"(%0, %13) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 1>}> : (i1, !llvm.ptr) -> ()
    %14 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.enter_data"(%1, %2, %3, %14) <{operandSegmentSizes = array<i32: 0, 0, 1, 2, 1>}> : (i64, i32, index, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, memref<memref<10xf32>>, memref<10x20xf32>) -> (), sym_name = "teststructureddataclauseops"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<memref<10xf32>>, %arg2: memref<10x20xf32>):
    %0 = "acc.deviceptr"(%arg0) <{dataClause = #acc<data_clause acc_deviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "arrayA", operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.parallel"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
    }) : (memref<10xf32>) -> ()
    %1 = "acc.present"(%arg0) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.data"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> ({
    }) : (memref<10xf32>) -> ()
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
    }) : (memref<10xf32>) -> ()
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin_readonly>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.kernels"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
    }) : (memref<10xf32>) -> ()
    %4 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.serial"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1>}> ({
    }) : (memref<10xf32>) -> ()
    "acc.copyout"(%4, %arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>, memref<10xf32>) -> ()
    %5 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    %6 = "acc.create"(%arg2) <{dataClause = #acc<data_clause acc_create>, implicit = true, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10x20xf32>}> : (memref<10x20xf32>) -> memref<10x20xf32>
    "acc.parallel"(%5, %6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2>}> ({
    }) : (memref<10xf32>, memref<10x20xf32>) -> ()
    "acc.delete"(%5) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<10xf32>) -> ()
    "acc.delete"(%6) <{dataClause = #acc<data_clause acc_create>, implicit = true, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<10x20xf32>) -> ()
    %7 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_copyout_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.parallel"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
    }) : (memref<10xf32>) -> ()
    "acc.copyout"(%7, %arg0) <{dataClause = #acc<data_clause acc_copyout_zero>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>, memref<10xf32>) -> ()
    %8 = "acc.attach"(%arg1) <{dataClause = #acc<data_clause acc_attach>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = memref<10xf32>}> : (memref<memref<10xf32>>) -> memref<memref<10xf32>>
    "acc.parallel"(%8) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
    }) : (memref<memref<10xf32>>) -> ()
    "acc.detach"(%8) <{dataClause = #acc<data_clause acc_attach>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<memref<10xf32>>) -> ()
    %9 = "acc.copyin"(%arg0, %arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>, memref<memref<10xf32>>) -> memref<10xf32>
    "acc.parallel"(%9) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
    }) : (memref<10xf32>) -> ()
    "acc.copyout"(%9, %arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>, memref<10xf32>) -> ()
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    %12 = "arith.constant"() <{value = 4 : index}> : () -> index
    %13 = "arith.constant"() <{value = 9 : index}> : () -> index
    %14 = "arith.constant"() <{value = 10 : index}> : () -> index
    %15 = "arith.constant"() <{value = 20 : index}> : () -> index
    %16 = "acc.bounds"(%10, %13, %11) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, strideInBytes = false}> : (index, index, index) -> !acc.data_bounds_ty
    %17 = "acc.copyin"(%arg0, %16) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "arrayA[0:9]", operandSegmentSizes = array<i32: 1, 0, 1, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>, !acc.data_bounds_ty) -> memref<10xf32>
    %18 = "acc.bounds"(%11, %15, %15, %12, %11) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, strideInBytes = true}> : (index, index, index, index, index) -> !acc.data_bounds_ty
    %19 = "acc.copyin"(%arg2, %16, %18) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 2, 0>, structured = true, varType = tensor<10x20xf32>}> : (memref<10x20xf32>, !acc.data_bounds_ty, !acc.data_bounds_ty) -> memref<10x20xf32>
    "acc.parallel"(%17, %19) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2>}> ({
    }) : (memref<10xf32>, memref<10x20xf32>) -> ()
    %20 = "acc.bounds"(%12, %13, %11) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, strideInBytes = false}> : (index, index, index) -> !acc.data_bounds_ty
    %21 = "acc.copyin"(%arg0, %20) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 1, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>, !acc.data_bounds_ty) -> memref<10xf32>
    "acc.parallel"(%21) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
    }) : (memref<10xf32>) -> ()
    "acc.copyout"(%21, %arg0, %20) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>, memref<10xf32>, !acc.data_bounds_ty) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "testunstructuredclauseops"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = false, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.enter_data"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (memref<10xf32>) -> ()
    %1 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.exit_data"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> : (memref<10xf32>) -> ()
    "acc.copyout"(%1, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = false, varType = tensor<10xf32>}> : (memref<10xf32>, memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "host_device_ops"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.update_host"(%0, %arg0) <{dataClause = #acc<data_clause acc_update_host>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = false, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "acc.update"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> : (memref<f32>) -> ()
    %1 = "acc.update_device"(%arg0) <{dataClause = #acc<data_clause acc_update_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.update"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> : (memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr, i1) -> (), sym_name = "host_data_ops"}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i1):
    %0 = "acc.use_device"(%arg0) <{dataClause = #acc<data_clause acc_use_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f64}> : (!llvm.ptr) -> !llvm.ptr
    "acc.host_data"(%0) <{operandSegmentSizes = array<i32: 0, 1>}> ({
    }) : (!llvm.ptr) -> ()
    "acc.host_data"(%0) <{operandSegmentSizes = array<i32: 0, 1>}> ({
    }) {if_present} : (!llvm.ptr) -> ()
    "acc.host_data"(%arg1, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    }) : (i1, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_i32", type = !llvm.ptr}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "llvm.store"(%1, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "acc.yield"(%2) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.struct<(i32, i32)>) -> (), sym_name = "destroy_struct", sym_visibility = "private"}> ({
  }) : () -> ()
  "acc.private.recipe"() <{sym_name = "privatization_struct_i32_i64", type = !llvm.struct<(i32, i32)>}> ({
  ^bb0(%arg1: !llvm.struct<(i32, i32)>):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.undef"() : () -> !llvm.struct<(i32, i32)>
    %2 = "llvm.insertvalue"(%1, %0) <{position = array<i64: 0>}> : (!llvm.struct<(i32, i32)>, i32) -> !llvm.struct<(i32, i32)>
    %3 = "llvm.insertvalue"(%2, %0) <{position = array<i64: 1>}> : (!llvm.struct<(i32, i32)>, i32) -> !llvm.struct<(i32, i32)>
    "acc.yield"(%3) : (!llvm.struct<(i32, i32)>) -> ()
  }, {
  ^bb0(%arg0: !llvm.struct<(i32, i32)>):
    "func.call"(%arg0) <{callee = @destroy_struct}> : (!llvm.struct<(i32, i32)>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i64", type = memref<i64>}> ({
  ^bb0(%arg4: memref<i64>):
    %7 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64>
    "memref.store"(%7, %8) : (i64, memref<i64>) -> ()
    "acc.yield"(%8) : (memref<i64>) -> ()
  }, {
  ^bb0(%arg2: memref<i64>, %arg3: memref<i64>):
    %4 = "memref.load"(%arg2) : (memref<i64>) -> i64
    %5 = "memref.load"(%arg3) : (memref<i64>) -> i64
    %6 = "arith.addi"(%4, %5) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "memref.store"(%6, %arg2) : (i64, memref<i64>) -> ()
    "acc.yield"(%arg2) : (memref<i64>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "acc_reduc_test"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    "acc.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      "acc.loop"(%0, %1, %2, %3) <{inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      ^bb0(%arg1: index):
        "acc.yield"() : () -> ()
      }) : (index, index, index, memref<i64>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i64", type = memref<i64>}> ({
  ^bb0(%arg3: memref<i64>):
    %4 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %5 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64>
    "memref.store"(%4, %5) : (i64, memref<i64>) -> ()
    "acc.yield"(%5) : (memref<i64>) -> ()
  }, {
  ^bb0(%arg1: memref<i64>, %arg2: memref<i64>):
    %1 = "memref.load"(%arg1) : (memref<i64>) -> i64
    %2 = "memref.load"(%arg2) : (memref<i64>) -> i64
    %3 = "arith.addi"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "memref.store"(%3, %arg1) : (i64, memref<i64>) -> ()
    "acc.yield"(%arg1) : (memref<i64>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "acc_reduc_test"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    "acc.serial"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    }) : (memref<i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i64", type = memref<i64>}> ({
  ^bb0(%arg3: memref<i64>):
    %4 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %5 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64>
    "memref.store"(%4, %5) : (i64, memref<i64>) -> ()
    "acc.yield"(%5) : (memref<i64>) -> ()
  }, {
  ^bb0(%arg1: memref<i64>, %arg2: memref<i64>):
    %1 = "memref.load"(%arg1) : (memref<i64>) -> i64
    %2 = "memref.load"(%arg2) : (memref<i64>) -> i64
    %3 = "arith.addi"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "memref.store"(%3, %arg1) : (i64, memref<i64>) -> ()
    "acc.yield"(%arg1) : (memref<i64>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "acc_kernels_reduc_test"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_i64, structured = true, varType = i64}> : (memref<i64>) -> memref<i64>
    "acc.kernels"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    }) : (memref<i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<f32>, memref<f32>) -> (), sym_name = "testdeclareop"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>, %arg2: memref<f32>):
    %0 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %1 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copyin_readonly>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %2 = "acc.copyin"(%arg2) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %3 = "acc.declare_enter"(%0, %1, %2) : (memref<f32>, memref<f32>, memref<f32>) -> !acc.declare_token
    %4 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %5 = "acc.create"(%arg1) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %6 = "acc.present"(%arg2) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %7 = "acc.declare_enter"(%4, %5, %6) : (memref<f32>, memref<f32>, memref<f32>) -> !acc.declare_token
    %8 = "acc.deviceptr"(%arg0) <{dataClause = #acc<data_clause acc_deviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %9 = "acc.declare_device_resident"(%arg1) <{dataClause = #acc<data_clause acc_declare_device_resident>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %10 = "acc.declare_link"(%arg2) <{dataClause = #acc<data_clause acc_declare_link>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    %11 = "acc.declare_enter"(%8, %9, %10) : (memref<f32>, memref<f32>, memref<f32>) -> !acc.declare_token
    "acc.declare_exit"(%9, %10) <{operandSegmentSizes = array<i32: 0, 2>}> : (memref<f32>, memref<f32>) -> ()
    "acc.delete"(%9) <{dataClause = #acc<data_clause acc_declare_device_resident>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.delete"(%10) <{dataClause = #acc<data_clause acc_declare_link>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.declare_exit"(%4, %5, %6) <{operandSegmentSizes = array<i32: 0, 3>}> : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.delete"(%4) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.copyout"(%5, %arg1) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "acc.delete"(%6) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.declare_exit"(%0, %1, %2) <{operandSegmentSizes = array<i32: 0, 3>}> : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "acc.delete"(%0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.delete"(%1) <{dataClause = #acc<data_clause acc_copyin_readonly>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<f32>) -> ()
    "acc.copyout"(%2, %arg2) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "globalvar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %5 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.return"(%5) : (i32) -> ()
  }) {acc.declare = #acc.declare<dataClause = acc_create>} : () -> ()
  "acc.global_ctor"() <{sym_name = "acc_constructor"}> ({
    %2 = "llvm.mlir.addressof"() <{global_name = @globalvar}> {acc.declare = #acc.declare<dataClause = acc_create>} : () -> !llvm.ptr
    %3 = "acc.create"(%2) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (!llvm.ptr) -> !llvm.ptr
    %4 = "acc.declare_enter"(%3) : (!llvm.ptr) -> !acc.declare_token
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "acc.global_dtor"() <{sym_name = "acc_destructor"}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @globalvar}> {acc.declare = #acc.declare<dataClause = acc_create>} : () -> !llvm.ptr
    %1 = "acc.getdeviceptr"(%0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (!llvm.ptr) -> !llvm.ptr
    "acc.declare_exit"(%1) <{operandSegmentSizes = array<i32: 0, 1>}> : (!llvm.ptr) -> ()
    "acc.delete"(%1) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (!llvm.ptr) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> (), sym_name = "acc_func"}> ({
  ^bb0(%arg0: i64):
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_func_rout1, @acc_func_rout2, @acc_func_rout3, @acc_func_rout4, @acc_func_rout5, @acc_func_rout6, @acc_func_rout7, @acc_func_rout8, @acc_func_rout9]>} : () -> ()
  "acc.routine"() <{func_name = @acc_func, sym_name = "acc_func_rout1"}> : () -> ()
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["acc_func_gpu"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @acc_func, sym_name = "acc_func_rout2"}> : () -> ()
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["acc_func_gpu_gang"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @acc_func, gang = [#acc.device_type<none>], sym_name = "acc_func_rout3"}> : () -> ()
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["acc_func_gpu_vector"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @acc_func, sym_name = "acc_func_rout4", vector = [#acc.device_type<none>]}> : () -> ()
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["acc_func_gpu_worker"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @acc_func, sym_name = "acc_func_rout5", worker = [#acc.device_type<none>]}> : () -> ()
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["acc_func_gpu_seq"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @acc_func, seq = [#acc.device_type<none>], sym_name = "acc_func_rout6"}> : () -> ()
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["acc_func_gpu_imp_gang"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @acc_func, gang = [#acc.device_type<none>], implicit, sym_name = "acc_func_rout7"}> : () -> ()
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["acc_func_gpu_vector_nohost"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @acc_func, nohost, sym_name = "acc_func_rout8", vector = [#acc.device_type<none>]}> : () -> ()
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["acc_func_gpu_gang_dim1"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @acc_func, gang = [], gangDim = [1], gangDimDeviceType = [#acc.device_type<none>], sym_name = "acc_func_rout9"}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @device_func_seq, seq = [#acc.device_type<none>], sym_name = "routine_seq"}> : () -> ()
  "acc.routine"() <{func_name = @device_func_gang, gang = [#acc.device_type<none>], sym_name = "routine_gang"}> : () -> ()
  "acc.routine"() <{func_name = @device_func_gang_dim2, gang = [], gangDim = [2], gangDimDeviceType = [#acc.device_type<none>], sym_name = "routine_gang_dim2"}> : () -> ()
  "acc.routine"() <{func_name = @device_func_gang_dim3, gang = [], gangDim = [3], gangDimDeviceType = [#acc.device_type<none>], sym_name = "routine_gang_dim3"}> : () -> ()
  "acc.routine"() <{func_name = @device_func_worker, sym_name = "routine_worker", worker = [#acc.device_type<none>]}> : () -> ()
  "acc.routine"() <{func_name = @device_func_vector, sym_name = "routine_vector", vector = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "device_func_seq"}> ({
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_seq, <seq>, "host_func_seq">} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "device_func_gang"}> ({
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_gang, <gang_dim1>, "host_func_gang">} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "device_func_gang_dim2"}> ({
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_gang_dim2, <gang_dim2>, "host_func_gang_dim2">} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "device_func_gang_dim3"}> ({
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_gang_dim3, <gang_dim3>, "host_func_gang_dim3">} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "device_func_worker"}> ({
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_worker, <worker>, "host_func_worker">} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "device_func_vector"}> ({
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_vector, <vector>, "host_func_vector">} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "acc_func"}> ({
    "test.openacc_dummy_op"() {acc.declare_action = #acc.declare_action<postAlloc = @_QMacc_declareFacc_declare_allocateEa_acc_declare_update_desc_post_alloc>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10x10xf32>, memref<10x10xf32>, memref<10xf32>, memref<10xf32>) -> (), sym_name = "compute3"}> ({
  ^bb0(%arg0: memref<10x10xf32>, %arg1: memref<10x10xf32>, %arg2: memref<10xf32>, %arg3: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "arith.constant"() <{value = 10 : i64}> : () -> i64
    %4 = "arith.constant"() <{value = 10 : i64}> : () -> i64
    %5 = "arith.constant"() <{value = 20 : i32}> : () -> i32
    %6 = "llvm.alloca"(%5) <{elem_type = i32}> {acc.declare = #acc.declare<dataClause = acc_create, implicit = true>} : (i32) -> !llvm.ptr
    %7 = "acc.create"(%6) <{dataClause = #acc<data_clause acc_create>, implicit = true, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = !llvm.array<20 x i32>}> : (!llvm.ptr) -> !llvm.ptr
    %8 = "acc.present"(%arg0) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10x10xf32>}> : (memref<10x10xf32>) -> memref<10x10xf32>
    %9 = "acc.present"(%arg1) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10x10xf32>}> : (memref<10x10xf32>) -> memref<10x10xf32>
    %10 = "acc.present"(%arg2) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    %11 = "acc.present"(%arg3) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.declare"(%8, %9, %10, %11, %7) ({
    }) : (memref<10x10xf32>, memref<10x10xf32>, memref<10xf32>, memref<10xf32>, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
  %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
  %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
  %3 = "arith.constant"() <{value = 1 : index}> : () -> index
  %4 = "arith.constant"() <{value = true}> : () -> i1
  "acc.set"() <{device_type = #acc.device_type<nvidia>, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> ()
  "acc.set"(%0) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (i64) -> ()
  "acc.set"(%1) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (i32) -> ()
  "acc.set"(%3) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (index) -> ()
  "acc.set"(%3, %4) <{operandSegmentSizes = array<i32: 0, 1, 1>}> : (index, i1) -> ()
  "acc.set"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "acc_atomic_read"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    "acc.atomic.read"(%arg1, %arg0) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
    %0 = "arith.constant"() <{value = true}> : () -> i1
    "acc.atomic.read"(%arg1, %arg0, %0) <{element_type = i32}> : (memref<i32>, memref<i32>, i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, i32) -> (), sym_name = "acc_atomic_write"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: i32):
    "acc.atomic.write"(%arg0, %arg1) : (memref<i32>, i32) -> ()
    %0 = "arith.constant"() <{value = true}> : () -> i1
    "acc.atomic.write"(%arg0, %arg1, %0) : (memref<i32>, i32, i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, i32, memref<i1>, i1) -> (), sym_name = "acc_atomic_update"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: i32, %arg2: memref<i1>, %arg3: i1):
    "acc.atomic.update"(%arg0) ({
    ^bb0(%arg11: i32):
      %7 = "llvm.add"(%arg11, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "acc.yield"(%7) : (i32) -> ()
    }) : (memref<i32>) -> ()
    %0 = "arith.constant"() <{value = true}> : () -> i1
    "acc.atomic.update"(%arg0, %0) ({
    ^bb0(%arg10: i32):
      %6 = "llvm.add"(%arg10, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "acc.yield"(%6) : (i32) -> ()
    }) : (memref<i32>, i1) -> ()
    "acc.atomic.update"(%arg2) ({
    ^bb0(%arg9: i1):
      %5 = "llvm.and"(%arg9, %arg3) : (i1, i1) -> i1
      "acc.yield"(%5) : (i1) -> ()
    }) : (memref<i1>) -> ()
    "acc.atomic.update"(%arg0) ({
    ^bb0(%arg8: i32):
      %4 = "llvm.shl"(%arg8, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "acc.yield"(%4) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "acc.atomic.update"(%arg0) ({
    ^bb0(%arg7: i32):
      %3 = "llvm.intr.smax"(%arg7, %arg1) : (i32, i32) -> i32
      "acc.yield"(%3) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "acc.atomic.update"(%arg2) ({
    ^bb0(%arg6: i1):
      %2 = "llvm.icmp"(%arg6, %arg3) <{predicate = 0 : i64}> : (i1, i1) -> i1
      "acc.yield"(%2) : (i1) -> ()
    }) : (memref<i1>) -> ()
    "acc.atomic.update"(%arg0) ({
    ^bb0(%arg5: i32):
      "acc.yield"(%arg5) : (i32) -> ()
    }) : (memref<i32>) -> ()
    %1 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    "acc.atomic.update"(%arg0) ({
    ^bb0(%arg4: i32):
      "acc.yield"(%1) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>, i32) -> (), sym_name = "acc_atomic_capture"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i32):
    "acc.atomic.capture"() ({
      "acc.atomic.update"(%arg1) ({
      ^bb0(%arg4: i32):
        %2 = "llvm.add"(%arg4, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "acc.yield"(%2) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "acc.atomic.read"(%arg1, %arg0) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "acc.atomic.capture"() ({
      "acc.atomic.read"(%arg1, %arg0) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "acc.atomic.update"(%arg1) ({
      ^bb0(%arg3: i32):
        %1 = "llvm.add"(%arg3, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "acc.yield"(%1) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "acc.atomic.capture"() ({
      "acc.atomic.read"(%arg1, %arg0) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "acc.atomic.write"(%arg1, %arg2) : (memref<i32>, i32) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    %0 = "arith.constant"() <{value = true}> : () -> i1
    "acc.atomic.capture"(%0) ({
      "acc.atomic.read"(%arg1, %arg0) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "acc.atomic.write"(%arg1, %arg2) : (memref<i32>, i32) -> ()
      "acc.terminator"() : () -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "acc_num_gangs"}> ({
    %0 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "acc.parallel"(%0, %1, %1, %1) <{numGangsDeviceType = [#acc.device_type<default>, #acc.device_type<nvidia>], numGangsSegments = array<i32: 1, 3>, operandSegmentSizes = array<i32: 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    }) : (i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "acc_combined"}> ({
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 10 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.parallel"() <{combined, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%7, %8, %9) <{combined = #acc.combined_constructs<parallel_loop>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg8: index):
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "acc.kernels"() <{combined, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%7, %8, %9) <{auto_ = [#acc.device_type<none>], combined = #acc.combined_constructs<kernels_loop>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg7: index):
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "acc.serial"() <{combined, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%7, %8, %9) <{combined = #acc.combined_constructs<serial_loop>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
      ^bb0(%arg6: index):
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "acc.firstprivate.recipe"() <{sym_name = "firstprivatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg5: memref<i32>):
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%6) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg3: memref<i32>, %arg4: memref<i32>):
    %5 = "memref.load"(%arg4) : (memref<i32>) -> i32
    "memref.store"(%5, %arg3) : (i32, memref<i32>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  }) : () -> ()
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg2: memref<i32>):
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%3, %4) : (i32, memref<i32>) -> ()
    "acc.yield"(%4) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = "memref.load"(%arg0) : (memref<i32>) -> i32
    %1 = "memref.load"(%arg1) : (memref<i32>) -> i32
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "memref.store"(%2, %arg0) : (i32, memref<i32>) -> ()
    "acc.yield"(%arg0) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_with_destroy", type = memref<?xf32>}> ({
  ^bb0(%arg4: memref<?xf32>):
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "memref.dim"(%arg4, %7) : (memref<?xf32>, index) -> index
    %9 = "memref.alloc"(%8) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%7, %8, %10) ({
    ^bb0(%arg5: index):
      "memref.store"(%6, %9, %arg5) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "acc.yield"(%9) : (memref<?xf32>) -> ()
  }, {
  ^bb0(%arg1: memref<?xf32>, %arg2: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "memref.dim"(%arg1, %0) : (memref<?xf32>, index) -> index
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg3: index):
      %3 = "memref.load"(%arg1, %arg3) : (memref<?xf32>, index) -> f32
      %4 = "memref.load"(%arg2, %arg3) : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%5, %arg1, %arg3) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "acc.yield"(%arg1) : (memref<?xf32>) -> ()
  }, {
  ^bb0(%arg0: memref<?xf32>):
    "memref.dealloc"(%arg0) : (memref<?xf32>) -> ()
    "acc.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg0: memref<i32>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%0) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "acc_loop_container"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.loop"() <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "scf.for"(%0, %1, %2) ({
      ^bb0(%arg0: index):
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "acc_loop_container"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.loop"() <{collapse = [2], collapseDeviceType = [#acc.device_type<none>], independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "scf.for"(%0, %1, %2) ({
      ^bb0(%arg0: index):
        "scf.for"(%0, %1, %2) ({
        ^bb0(%arg1: index):
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "acc_unstructured_loop"}> ({
    "acc.loop"() <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, unstructured}> ({
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_slice", type = memref<10x10xf32>}> ({
  ^bb0(%arg0: memref<10x10xf32>, %arg1: !acc.data_bounds_ty, %arg2: !acc.data_bounds_ty):
    %0 = "acc.get_lowerbound"(%arg1) : (!acc.data_bounds_ty) -> index
    %1 = "acc.get_extent"(%arg1) : (!acc.data_bounds_ty) -> index
    %2 = "acc.get_stride"(%arg1) : (!acc.data_bounds_ty) -> index
    %3 = "acc.get_lowerbound"(%arg2) : (!acc.data_bounds_ty) -> index
    %4 = "acc.get_extent"(%arg2) : (!acc.data_bounds_ty) -> index
    %5 = "acc.get_stride"(%arg2) : (!acc.data_bounds_ty) -> index
    %6 = "memref.alloca"(%4, %1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 10 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.muli"(%3, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %11 = "arith.muli"(%0, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %12 = "arith.addi"(%10, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %13 = "arith.subi"(%7, %12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %14 = "memref.reinterpret_cast"(%6, %13, %8, %9) <{operandSegmentSizes = array<i32: 1, 1, 0, 2>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 10, 10>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32>, index, index, index) -> memref<10x10xf32, strided<[?, ?], offset: ?>>
    %15 = "memref.cast"(%14) : (memref<10x10xf32, strided<[?, ?], offset: ?>>) -> memref<10x10xf32>
    "acc.yield"(%15) : (memref<10x10xf32>) -> ()
  }, {
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "test_firstprivate_map"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "acc.firstprivate_map"(%arg0) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index
      %3 = "arith.constant"() <{value = 10 : index}> : () -> index
      %4 = "arith.constant"() <{value = 1 : index}> : () -> index
      "scf.for"(%2, %3, %4) ({
      ^bb0(%arg1: index):
        %5 = "memref.load"(%0, %arg1) : (memref<10xf32>, index) -> f32
        "memref.store"(%5, %1, %arg1) : (f32, memref<10xf32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> (), sym_name = "test_kernel_environment"}> ({
  ^bb0(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<1024xf32>) -> memref<1024xf32>
    %3 = "acc.create"(%arg1) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<1024xf32>) -> memref<1024xf32>
    "acc.kernel_environment"(%2, %3) <{operandSegmentSizes = array<i32: 2, 0, 0, 0>}> ({
      "gpu.launch"(%0, %0, %0, %1, %0, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
      ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
        %4 = "memref.load"(%2, %arg5) : (memref<1024xf32>, index) -> f32
        %5 = "arith.mulf"(%4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "memref.store"(%5, %3, %arg5) : (f32, memref<1024xf32>, index) -> ()
        "gpu.terminator"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
    }) : (memref<1024xf32>, memref<1024xf32>) -> ()
    "acc.copyout"(%3, %arg1) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<1024xf32>, memref<1024xf32>) -> ()
    "acc.delete"(%2) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<1024xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024xf32>) -> (), sym_name = "test_kernel_environment_with_async"}> ({
  ^bb0(%arg0: memref<1024xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "acc.create"(%arg0, %2) <{asyncOperandsDeviceType = [#acc.device_type<none>], dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 1>, structured = true, varType = f32}> : (memref<1024xf32>, i32) -> memref<1024xf32>
    "acc.kernel_environment"(%3, %2) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>}> ({
      "gpu.launch"(%0, %0, %0, %1, %0, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index):
        %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
        "memref.store"(%4, %3, %arg4) : (f32, memref<1024xf32>, index) -> ()
        "gpu.terminator"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
    }) : (memref<1024xf32>, i32) -> ()
    "acc.copyout"(%3, %arg0, %2) <{asyncOperandsDeviceType = [#acc.device_type<none>], dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 1>, structured = true, varType = f32}> : (memref<1024xf32>, memref<1024xf32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "test_acc_reduction_combine"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    "acc.reduction_combine"(%arg1, %arg0) <{reductionOperator = #acc.reduction_operator<add>}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "test_getdeviceptr_opaque_ptr"}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "acc.getdeviceptr"(%arg0) <{dataClause = #acc<data_clause acc_getdeviceptr>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    %1 = "acc.declare_enter"(%0) : (!llvm.ptr) -> !acc.declare_token
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<maximumf>, sym_name = "reduction_maximum_memref_f32", type = memref<f32>}> ({
  ^bb0(%arg11: memref<f32>):
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "acc.yield"(%3) : (memref<f32>) -> ()
  }, {
  ^bb0(%arg9: memref<f32>, %arg10: memref<f32>):
    "acc.yield"(%arg9) : (memref<f32>) -> ()
  }, {
  }) : () -> ()
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<maxnumf>, sym_name = "reduction_maxnum_memref_f32", type = memref<f32>}> ({
  ^bb0(%arg8: memref<f32>):
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "acc.yield"(%2) : (memref<f32>) -> ()
  }, {
  ^bb0(%arg6: memref<f32>, %arg7: memref<f32>):
    "acc.yield"(%arg6) : (memref<f32>) -> ()
  }, {
  }) : () -> ()
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<minimumf>, sym_name = "reduction_minimum_memref_f32", type = memref<f32>}> ({
  ^bb0(%arg5: memref<f32>):
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "acc.yield"(%1) : (memref<f32>) -> ()
  }, {
  ^bb0(%arg3: memref<f32>, %arg4: memref<f32>):
    "acc.yield"(%arg3) : (memref<f32>) -> ()
  }, {
  }) : () -> ()
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<minnumf>, sym_name = "reduction_minnum_memref_f32", type = memref<f32>}> ({
  ^bb0(%arg2: memref<f32>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "acc.yield"(%0) : (memref<f32>) -> ()
  }, {
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>):
    "acc.yield"(%arg0) : (memref<f32>) -> ()
  }, {
  }) : () -> ()
}) : () -> ()

