"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_for_siblings"}> ({
    %4 = "emitc.literal"() <{value = "0"}> : () -> index loc("<stdin>":3:10)
    %5 = "emitc.literal"() <{value = "10"}> : () -> index loc("<stdin>":4:10)
    %6 = "emitc.literal"() <{value = "1"}> : () -> index loc("<stdin>":5:10)
    %7 = "emitc.variable"() <{value = 0 : index}> : () -> !emitc.lvalue<index> loc("<stdin>":6:10)
    %8 = "emitc.variable"() <{value = 0 : index}> : () -> !emitc.lvalue<index> loc("<stdin>":7:10)
    "emitc.for"(%4, %5, %6) ({
    ^bb0(%arg16: index loc("<stdin>":9:10)):
      "emitc.for"(%4, %5, %6) ({
      ^bb0(%arg17: index loc("<stdin>":11:12)):
        "emitc.assign"(%7, %arg16) : (!emitc.lvalue<index>, index) -> () loc("<stdin>":12:9)
        "emitc.assign"(%8, %arg17) : (!emitc.lvalue<index>, index) -> () loc("<stdin>":13:9)
        "emitc.yield"() : () -> () loc("<stdin>":14:9)
      }) : (index, index, index) -> () loc("<stdin>":10:7)
      "emitc.yield"() : () -> () loc("<stdin>":16:7)
    }) : (index, index, index) -> () loc("<stdin>":8:5)
    "emitc.for"(%4, %5, %6) ({
    ^bb0(%arg14: index loc("<stdin>":19:10)):
      "emitc.for"(%4, %5, %6) ({
      ^bb0(%arg15: index loc("<stdin>":21:12)):
        %9 = "emitc.call_opaque"() <{callee = "f"}> : () -> i32 loc("<stdin>":22:14)
        "emitc.yield"() : () -> () loc("<stdin>":23:9)
      }) : (index, index, index) -> () loc("<stdin>":20:7)
      "emitc.yield"() : () -> () loc("<stdin>":25:7)
    }) : (index, index, index) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_for_nesting"}> ({
    %0 = "emitc.literal"() <{value = "0"}> : () -> index loc("<stdin>":30:10)
    %1 = "emitc.literal"() <{value = "10"}> : () -> index loc("<stdin>":31:10)
    %2 = "emitc.literal"() <{value = "1"}> : () -> index loc("<stdin>":32:10)
    "emitc.for"(%0, %1, %2) ({
    ^bb0(%arg0: index loc("<stdin>":34:10)):
      "emitc.for"(%0, %1, %2) ({
      ^bb0(%arg1: index loc("<stdin>":36:12)):
        "emitc.for"(%0, %1, %2) ({
        ^bb0(%arg2: index loc("<stdin>":38:14)):
          "emitc.for"(%0, %1, %2) ({
          ^bb0(%arg3: index loc("<stdin>":40:16)):
            "emitc.for"(%0, %1, %2) ({
            ^bb0(%arg4: index loc("<stdin>":42:18)):
              "emitc.for"(%0, %1, %2) ({
              ^bb0(%arg5: index loc("<stdin>":44:20)):
                "emitc.for"(%0, %1, %2) ({
                ^bb0(%arg6: index loc("<stdin>":46:22)):
                  "emitc.for"(%0, %1, %2) ({
                  ^bb0(%arg7: index loc("<stdin>":48:24)):
                    "emitc.for"(%0, %1, %2) ({
                    ^bb0(%arg8: index loc("<stdin>":50:26)):
                      "emitc.for"(%0, %1, %2) ({
                      ^bb0(%arg9: index loc("<stdin>":52:28)):
                        "emitc.for"(%0, %1, %2) ({
                        ^bb0(%arg10: index loc("<stdin>":54:30)):
                          "emitc.for"(%0, %1, %2) ({
                          ^bb0(%arg11: index loc("<stdin>":56:32)):
                            "emitc.for"(%0, %1, %2) ({
                            ^bb0(%arg12: index loc("<stdin>":58:34)):
                              "emitc.for"(%0, %1, %2) ({
                              ^bb0(%arg13: index loc("<stdin>":60:36)):
                                %3 = "emitc.call_opaque"() <{callee = "f"}> : () -> i32 loc("<stdin>":61:38)
                                "emitc.yield"() : () -> () loc("<stdin>":62:33)
                              }) : (index, index, index) -> () loc("<stdin>":59:31)
                              "emitc.yield"() : () -> () loc("<stdin>":64:31)
                            }) : (index, index, index) -> () loc("<stdin>":57:29)
                            "emitc.yield"() : () -> () loc("<stdin>":66:29)
                          }) : (index, index, index) -> () loc("<stdin>":55:27)
                          "emitc.yield"() : () -> () loc("<stdin>":68:27)
                        }) : (index, index, index) -> () loc("<stdin>":53:25)
                        "emitc.yield"() : () -> () loc("<stdin>":70:25)
                      }) : (index, index, index) -> () loc("<stdin>":51:23)
                      "emitc.yield"() : () -> () loc("<stdin>":72:23)
                    }) : (index, index, index) -> () loc("<stdin>":49:21)
                    "emitc.yield"() : () -> () loc("<stdin>":74:21)
                  }) : (index, index, index) -> () loc("<stdin>":47:19)
                  "emitc.yield"() : () -> () loc("<stdin>":76:19)
                }) : (index, index, index) -> () loc("<stdin>":45:17)
                "emitc.yield"() : () -> () loc("<stdin>":78:17)
              }) : (index, index, index) -> () loc("<stdin>":43:15)
              "emitc.yield"() : () -> () loc("<stdin>":80:15)
            }) : (index, index, index) -> () loc("<stdin>":41:13)
            "emitc.yield"() : () -> () loc("<stdin>":82:13)
          }) : (index, index, index) -> () loc("<stdin>":39:11)
          "emitc.yield"() : () -> () loc("<stdin>":84:11)
        }) : (index, index, index) -> () loc("<stdin>":37:9)
        "emitc.yield"() : () -> () loc("<stdin>":86:9)
      }) : (index, index, index) -> () loc("<stdin>":35:7)
      "emitc.yield"() : () -> () loc("<stdin>":88:7)
    }) : (index, index, index) -> () loc("<stdin>":33:5)
    "func.return"() : () -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":1:1)
