module {
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    sequence %arg0 : !transform.any_op failures(propagate) {
    ^bb0(%arg1: !transform.any_op):
    }
  }
  transform.with_pdl_patterns {
  ^bb0(%arg0: !transform.any_op):
    sequence %arg0 : !transform.any_op failures(propagate) {
    ^bb0(%arg1: !transform.any_op):
    }
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %0 = sequence %arg0 : !transform.any_op -> !transform.any_op failures(propagate) {
    ^bb0(%arg1: !transform.any_op):
      yield %arg1 : !transform.any_op
    }
    sequence %0 : !transform.any_op failures(propagate) {
    ^bb0(%arg1: !transform.any_op):
    }
    sequence %0 : !transform.any_op failures(propagate) {
    ^bb0(%arg1: !transform.any_op):
    }
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op, %arg1: !transform.any_op, %arg2: !transform.any_op):
    sequence %arg0, %arg1, %arg2 : (!transform.any_op, !transform.any_op, !transform.any_op) failures(propagate) {
    ^bb0(%arg3: !transform.any_op, %arg4: !transform.any_op, %arg5: !transform.any_op):
    }
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op, %arg1: !transform.any_op, %arg2: !transform.any_op):
    sequence %arg0, %arg1, %arg2 : (!transform.any_op, !transform.any_op, !transform.any_op) failures(propagate) {
    ^bb0(%arg3: !transform.any_op, %arg4: !transform.any_op, %arg5: !transform.any_op):
    }
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op, %arg1: !transform.any_op, %arg2: !transform.any_op):
    sequence %arg0, %arg1, %arg2 : (!transform.any_op, !transform.any_op, !transform.any_op) failures(propagate) {
    ^bb0(%arg3: !transform.any_op, %arg4: !transform.any_op, %arg5: !transform.any_op):
    }
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op, %arg1: !transform.any_value, %arg2: !transform.any_param):
    foreach %arg0 : !transform.any_op {
    ^bb0(%arg3: !transform.any_op):
    }
    foreach %arg0, %arg1, %arg2 : !transform.any_op, !transform.any_value, !transform.any_param {
    ^bb0(%arg3: !transform.any_op, %arg4: !transform.any_value, %arg5: !transform.any_param):
    }
    %0 = foreach %arg0, %arg1, %arg2 : !transform.any_op, !transform.any_value, !transform.any_param -> !transform.any_op {
    ^bb0(%arg3: !transform.any_op, %arg4: !transform.any_value, %arg5: !transform.any_param):
      transform.yield %arg3 : !transform.any_op
    }
    %1:2 = foreach %arg0, %arg1, %arg2 : !transform.any_op, !transform.any_value, !transform.any_param -> !transform.any_param, !transform.any_value {
    ^bb0(%arg3: !transform.any_op, %arg4: !transform.any_value, %arg5: !transform.any_param):
      transform.yield %arg5, %arg4 : !transform.any_param, !transform.any_value
    }
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %0 = cast %arg0 : !transform.any_op to !transform.any_op
    %1 = cast %0 : !transform.any_op to !transform.op<"builtin.module">
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    print %arg0 : !transform.any_op
    print 
    print %arg0 {name = "test"} : !transform.any_op
    print  {name = "test"}
    print  {assume_verified, name = "test"}
    print %arg0 {assume_verified} : !transform.any_op
    print %arg0 {use_local_scope} : !transform.any_op
    print %arg0 {skip_regions} : !transform.any_op
    print %arg0 {assume_verified, skip_regions, use_local_scope} : !transform.any_op
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [4, 4, [4]] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [[2], 4, 8] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %0 = transform.param.constant "example_string" -> !transform.any_param
  }
}

