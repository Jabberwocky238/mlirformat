"builtin.module"() ({
  "acc.routine"() <{func_name = @deeply_nested_orphan_loops, seq = [#acc.device_type<none>], sym_name = "acc_routine_deep"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "deeply_nested_orphan_loops"}> ({
  ^bb0(%arg0: memref<i32> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":6:10)
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":7:10)
    "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
    ^bb0(%arg1: i32 loc("<stdin>":9:10)):
      "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
      ^bb0(%arg2: i32 loc("<stdin>":11:12)):
        "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
        ^bb0(%arg3: i32 loc("<stdin>":13:14)):
          "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
          ^bb0(%arg4: i32 loc("<stdin>":15:16)):
            "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
            ^bb0(%arg5: i32 loc("<stdin>":17:18)):
              "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
              ^bb0(%arg6: i32 loc("<stdin>":19:20)):
                "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                ^bb0(%arg7: i32 loc("<stdin>":21:22)):
                  "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                  ^bb0(%arg8: i32 loc("<stdin>":23:24)):
                    "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                    ^bb0(%arg9: i32 loc("<stdin>":25:26)):
                      "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                      ^bb0(%arg10: i32 loc("<stdin>":27:28)):
                        "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                        ^bb0(%arg11: i32 loc("<stdin>":29:30)):
                          "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                          ^bb0(%arg12: i32 loc("<stdin>":31:32)):
                            "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                            ^bb0(%arg13: i32 loc("<stdin>":33:34)):
                              "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                              ^bb0(%arg14: i32 loc("<stdin>":35:36)):
                                "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                                ^bb0(%arg15: i32 loc("<stdin>":37:38)):
                                  "acc.loop"(%0, %1, %2) <{inclusiveUpperbound = array<i1: true>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
                                  ^bb0(%arg16: i32 loc("<stdin>":39:40)):
                                    "memref.store"(%arg16, %arg0) : (i32, memref<i32>) -> () loc("<stdin>":40:37)
                                    "acc.yield"() : () -> () loc("<stdin>":41:37)
                                  }) : (i32, i32, i32) -> () loc("<stdin>":38:35)
                                  "acc.yield"() : () -> () loc("<stdin>":43:35)
                                }) : (i32, i32, i32) -> () loc("<stdin>":36:33)
                                "acc.yield"() : () -> () loc("<stdin>":45:33)
                              }) : (i32, i32, i32) -> () loc("<stdin>":34:31)
                              "acc.yield"() : () -> () loc("<stdin>":47:31)
                            }) : (i32, i32, i32) -> () loc("<stdin>":32:29)
                            "acc.yield"() : () -> () loc("<stdin>":49:29)
                          }) : (i32, i32, i32) -> () loc("<stdin>":30:27)
                          "acc.yield"() : () -> () loc("<stdin>":51:27)
                        }) : (i32, i32, i32) -> () loc("<stdin>":28:25)
                        "acc.yield"() : () -> () loc("<stdin>":53:25)
                      }) : (i32, i32, i32) -> () loc("<stdin>":26:23)
                      "acc.yield"() : () -> () loc("<stdin>":55:23)
                    }) : (i32, i32, i32) -> () loc("<stdin>":24:21)
                    "acc.yield"() : () -> () loc("<stdin>":57:21)
                  }) : (i32, i32, i32) -> () loc("<stdin>":22:19)
                  "acc.yield"() : () -> () loc("<stdin>":59:19)
                }) : (i32, i32, i32) -> () loc("<stdin>":20:17)
                "acc.yield"() : () -> () loc("<stdin>":61:17)
              }) : (i32, i32, i32) -> () loc("<stdin>":18:15)
              "acc.yield"() : () -> () loc("<stdin>":63:15)
            }) : (i32, i32, i32) -> () loc("<stdin>":16:13)
            "acc.yield"() : () -> () loc("<stdin>":65:13)
          }) : (i32, i32, i32) -> () loc("<stdin>":14:11)
          "acc.yield"() : () -> () loc("<stdin>":67:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":12:9)
        "acc.yield"() : () -> () loc("<stdin>":69:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":10:7)
      "acc.yield"() : () -> () loc("<stdin>":71:7)
    }) : (i32, i32, i32) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":73:5)
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_deep]>} : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
