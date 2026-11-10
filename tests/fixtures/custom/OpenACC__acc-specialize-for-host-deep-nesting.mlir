module {
  acc.routine @acc_routine_deep func(@deeply_nested_orphan_loops) seq 
  func.func @deeply_nested_orphan_loops(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_deep]>} {
    %c0_i32 = arith.constant 0 : i32
    %c10_i32 = arith.constant 10 : i32
    %c1_i32 = arith.constant 1 : i32
    acc.loop control(%arg1 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
      acc.loop control(%arg2 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
        acc.loop control(%arg3 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
          acc.loop control(%arg4 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
            acc.loop control(%arg5 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
              acc.loop control(%arg6 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                acc.loop control(%arg7 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                  acc.loop control(%arg8 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                    acc.loop control(%arg9 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                      acc.loop control(%arg10 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                        acc.loop control(%arg11 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                          acc.loop control(%arg12 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                            acc.loop control(%arg13 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                              acc.loop control(%arg14 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                                acc.loop control(%arg15 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                                  acc.loop control(%arg16 : i32) = (%c0_i32 : i32) to (%c10_i32 : i32)  step (%c1_i32 : i32) {
                                    memref.store %arg16, %arg0[] : memref<i32>
                                    acc.yield
                                  } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
                                  acc.yield
                                } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
                                acc.yield
                              } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
                              acc.yield
                            } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
                            acc.yield
                          } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
                          acc.yield
                        } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
                        acc.yield
                      } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
                      acc.yield
                    } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
                    acc.yield
                  } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
                  acc.yield
                } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
                acc.yield
              } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
              acc.yield
            } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
            acc.yield
          } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
          acc.yield
        } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
    return
  }
}

