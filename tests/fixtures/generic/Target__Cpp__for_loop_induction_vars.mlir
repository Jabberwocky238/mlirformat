"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_for_siblings"}> ({
    %4 = "emitc.literal"() <{value = "0"}> : () -> index
    %5 = "emitc.literal"() <{value = "10"}> : () -> index
    %6 = "emitc.literal"() <{value = "1"}> : () -> index
    %7 = "emitc.variable"() <{value = 0 : index}> : () -> !emitc.lvalue<index>
    %8 = "emitc.variable"() <{value = 0 : index}> : () -> !emitc.lvalue<index>
    "emitc.for"(%4, %5, %6) ({
    ^bb0(%arg16: index):
      "emitc.for"(%4, %5, %6) ({
      ^bb0(%arg17: index):
        "emitc.assign"(%7, %arg16) : (!emitc.lvalue<index>, index) -> ()
        "emitc.assign"(%8, %arg17) : (!emitc.lvalue<index>, index) -> ()
        "emitc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "emitc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "emitc.for"(%4, %5, %6) ({
    ^bb0(%arg14: index):
      "emitc.for"(%4, %5, %6) ({
      ^bb0(%arg15: index):
        %9 = "emitc.call_opaque"() <{callee = "f"}> : () -> i32
        "emitc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "emitc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_for_nesting"}> ({
    %0 = "emitc.literal"() <{value = "0"}> : () -> index
    %1 = "emitc.literal"() <{value = "10"}> : () -> index
    %2 = "emitc.literal"() <{value = "1"}> : () -> index
    "emitc.for"(%0, %1, %2) ({
    ^bb0(%arg0: index):
      "emitc.for"(%0, %1, %2) ({
      ^bb0(%arg1: index):
        "emitc.for"(%0, %1, %2) ({
        ^bb0(%arg2: index):
          "emitc.for"(%0, %1, %2) ({
          ^bb0(%arg3: index):
            "emitc.for"(%0, %1, %2) ({
            ^bb0(%arg4: index):
              "emitc.for"(%0, %1, %2) ({
              ^bb0(%arg5: index):
                "emitc.for"(%0, %1, %2) ({
                ^bb0(%arg6: index):
                  "emitc.for"(%0, %1, %2) ({
                  ^bb0(%arg7: index):
                    "emitc.for"(%0, %1, %2) ({
                    ^bb0(%arg8: index):
                      "emitc.for"(%0, %1, %2) ({
                      ^bb0(%arg9: index):
                        "emitc.for"(%0, %1, %2) ({
                        ^bb0(%arg10: index):
                          "emitc.for"(%0, %1, %2) ({
                          ^bb0(%arg11: index):
                            "emitc.for"(%0, %1, %2) ({
                            ^bb0(%arg12: index):
                              "emitc.for"(%0, %1, %2) ({
                              ^bb0(%arg13: index):
                                %3 = "emitc.call_opaque"() <{callee = "f"}> : () -> i32
                                "emitc.yield"() : () -> ()
                              }) : (index, index, index) -> ()
                              "emitc.yield"() : () -> ()
                            }) : (index, index, index) -> ()
                            "emitc.yield"() : () -> ()
                          }) : (index, index, index) -> ()
                          "emitc.yield"() : () -> ()
                        }) : (index, index, index) -> ()
                        "emitc.yield"() : () -> ()
                      }) : (index, index, index) -> ()
                      "emitc.yield"() : () -> ()
                    }) : (index, index, index) -> ()
                    "emitc.yield"() : () -> ()
                  }) : (index, index, index) -> ()
                  "emitc.yield"() : () -> ()
                }) : (index, index, index) -> ()
                "emitc.yield"() : () -> ()
              }) : (index, index, index) -> ()
              "emitc.yield"() : () -> ()
            }) : (index, index, index) -> ()
            "emitc.yield"() : () -> ()
          }) : (index, index, index) -> ()
          "emitc.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "emitc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "emitc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

