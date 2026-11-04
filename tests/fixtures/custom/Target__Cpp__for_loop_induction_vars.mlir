module {
  func.func @test_for_siblings() {
    %0 = emitc.literal "0" : index
    %1 = emitc.literal "10" : index
    %2 = emitc.literal "1" : index
    %3 = "emitc.variable"() <{value = 0 : index}> : () -> !emitc.lvalue<index>
    %4 = "emitc.variable"() <{value = 0 : index}> : () -> !emitc.lvalue<index>
    emitc.for %arg0 = %0 to %1 step %2 {
      for %arg1 = %0 to %1 step %2 {
        assign %arg0 : index to %3 : <index>
        assign %arg1 : index to %4 : <index>
      }
    }
    emitc.for %arg0 = %0 to %1 step %2 {
      for %arg1 = %0 to %1 step %2 {
        %5 = call_opaque "f"() : () -> i32
      }
    }
    return
  }
  func.func @test_for_nesting() {
    %0 = emitc.literal "0" : index
    %1 = emitc.literal "10" : index
    %2 = emitc.literal "1" : index
    emitc.for %arg0 = %0 to %1 step %2 {
      for %arg1 = %0 to %1 step %2 {
        for %arg2 = %0 to %1 step %2 {
          for %arg3 = %0 to %1 step %2 {
            for %arg4 = %0 to %1 step %2 {
              for %arg5 = %0 to %1 step %2 {
                for %arg6 = %0 to %1 step %2 {
                  for %arg7 = %0 to %1 step %2 {
                    for %arg8 = %0 to %1 step %2 {
                      for %arg9 = %0 to %1 step %2 {
                        for %arg10 = %0 to %1 step %2 {
                          for %arg11 = %0 to %1 step %2 {
                            for %arg12 = %0 to %1 step %2 {
                              for %arg13 = %0 to %1 step %2 {
                                %3 = call_opaque "f"() : () -> i32
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    return
  }
}

