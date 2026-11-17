"builtin.module"() ({
  %0 = "foo.op"() : () -> memref<?xf32, affine_map<(d0) -> (d0 * 2)>> loc("<stdin>":3:8)
}) : () -> () loc("<stdin>":2:1)
