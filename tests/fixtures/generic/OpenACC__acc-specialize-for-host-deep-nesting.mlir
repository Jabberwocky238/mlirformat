"builtin.module"() ({
  "acc.routine"() <{func_name = @deeply_nested_orphan_loops, seq = [#acc.device_type<none>], sym_name = "acc_routine_deep"}> : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "deeply_nested_orphan_loops"}> ({
  ^bb0(%arg0: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
    ^bb0(%arg1: i32):
      "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
      ^bb0(%arg2: i32):
        "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
        ^bb0(%arg3: i32):
          "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
          ^bb0(%arg4: i32):
            "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
            ^bb0(%arg5: i32):
              "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
              ^bb0(%arg6: i32):
                "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                ^bb0(%arg7: i32):
                  "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                  ^bb0(%arg8: i32):
                    "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                    ^bb0(%arg9: i32):
                      "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                      ^bb0(%arg10: i32):
                        "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                        ^bb0(%arg11: i32):
                          "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                          ^bb0(%arg12: i32):
                            "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                            ^bb0(%arg13: i32):
                              "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                              ^bb0(%arg14: i32):
                                "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                                ^bb0(%arg15: i32):
                                  "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                                  ^bb0(%arg16: i32):
                                    "memref.store"(%arg16, %arg0) : (i32, memref<i32>) -> ()
                                    "acc.yield"() : () -> ()
                                  }) : (i32, i32, i32) -> ()
                                  "acc.yield"() : () -> ()
                                }) : (i32, i32, i32) -> ()
                                "acc.yield"() : () -> ()
                              }) : (i32, i32, i32) -> ()
                              "acc.yield"() : () -> ()
                            }) : (i32, i32, i32) -> ()
                            "acc.yield"() : () -> ()
                          }) : (i32, i32, i32) -> ()
                          "acc.yield"() : () -> ()
                        }) : (i32, i32, i32) -> ()
                        "acc.yield"() : () -> ()
                      }) : (i32, i32, i32) -> ()
                      "acc.yield"() : () -> ()
                    }) : (i32, i32, i32) -> ()
                    "acc.yield"() : () -> ()
                  }) : (i32, i32, i32) -> ()
                  "acc.yield"() : () -> ()
                }) : (i32, i32, i32) -> ()
                "acc.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
              "acc.yield"() : () -> ()
            }) : (i32, i32, i32) -> ()
            "acc.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
          "acc.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
        "acc.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_deep]>} : () -> ()
}) : () -> ()

