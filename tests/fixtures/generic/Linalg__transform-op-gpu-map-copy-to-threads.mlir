"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xf16>, tensor<8xf16>) -> tensor<8xf16>, sym_name = "copy_1d_8xf16"}> ({
  ^bb0(%arg1: tensor<8xf16>, %arg2: tensor<8xf16>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      "linalg.yield"(%arg3) : (f16) -> ()
    }) : (tensor<8xf16>, tensor<8xf16>) -> tensor<8xf16>
    "func.return"(%2) : (tensor<8xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf16>, index) -> tensor<8xf16>, sym_name = "pad_1d_8xf16"}> ({
  ^bb0(%arg1: tensor<?xf16>, %arg2: index):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %3 = "tensor.pad"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 1>, static_high = array<i64: -9223372036854775808>, static_low = array<i64: 0>}> ({
    ^bb0(%arg3: index):
      "tensor.yield"(%2) : (f16) -> ()
    }) : (tensor<?xf16>, index) -> tensor<8xf16>
    "func.return"(%3) : (tensor<8xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"tensor.pad">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16xf16>, tensor<16xf16>) -> tensor<16xf16>, sym_name = "copy_1d_16xf16"}> ({
  ^bb0(%arg1: tensor<16xf16>, %arg2: tensor<16xf16>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      "linalg.yield"(%arg3) : (f16) -> ()
    }) : (tensor<16xf16>, tensor<16xf16>) -> tensor<16xf16>
    "func.return"(%2) : (tensor<16xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<20xf16>, tensor<20xf16>) -> tensor<20xf16>, sym_name = "copy_1d_20xf16"}> ({
  ^bb0(%arg1: tensor<20xf16>, %arg2: tensor<20xf16>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      "linalg.yield"(%arg3) : (f16) -> ()
    }) : (tensor<20xf16>, tensor<20xf16>) -> tensor<20xf16>
    "func.return"(%2) : (tensor<20xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<20xf16>, tensor<20xf16>) -> tensor<20xf16>, sym_name = "copy_1d_20xf16"}> ({
  ^bb0(%arg1: tensor<20xf16>, %arg2: tensor<20xf16>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      "linalg.yield"(%arg3) : (f16) -> ()
    }) : (tensor<20xf16>, tensor<20xf16>) -> tensor<20xf16>
    "func.return"(%2) : (tensor<20xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf16>, tensor<128xf16>) -> tensor<128xf16>, sym_name = "copy_1d_128xf16"}> ({
  ^bb0(%arg1: tensor<128xf16>, %arg2: tensor<128xf16>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      "linalg.yield"(%arg3) : (f16) -> ()
    }) : (tensor<128xf16>, tensor<128xf16>) -> tensor<128xf16>
    "func.return"(%2) : (tensor<128xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<256xf16>, tensor<256xf16>) -> tensor<256xf16>, sym_name = "copy_1d_256xf16"}> ({
  ^bb0(%arg1: tensor<256xf16>, %arg2: tensor<256xf16>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      "linalg.yield"(%arg3) : (f16) -> ()
    }) : (tensor<256xf16>, tensor<256xf16>) -> tensor<256xf16>
    "func.return"(%2) : (tensor<256xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32x64xi8>, tensor<16x32x64xi8>) -> tensor<16x32x64xi8>, sym_name = "copy_3d_16x32x64xi8"}> ({
  ^bb0(%arg1: tensor<16x32x64xi8>, %arg2: tensor<16x32x64xi8>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8):
      "linalg.yield"(%arg3) : (i8) -> ()
    }) : (tensor<16x32x64xi8>, tensor<16x32x64xi8>) -> tensor<16x32x64xi8>
    "func.return"(%2) : (tensor<16x32x64xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32x64xi8>, tensor<16x32x64xi8>) -> tensor<16x32x64xi8>, sym_name = "copy_3d_16x32x64xi8"}> ({
  ^bb0(%arg1: tensor<16x32x64xi8>, %arg2: tensor<16x32x64xi8>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8):
      "linalg.yield"(%arg3) : (i8) -> ()
    }) : (tensor<16x32x64xi8>, tensor<16x32x64xi8>) -> tensor<16x32x64xi8>
    "func.return"(%2) : (tensor<16x32x64xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 64 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xi8>, tensor<4x8x16xi8>) -> tensor<4x8x16xi8>, sym_name = "copy_3d_4x8x16xi8"}> ({
  ^bb0(%arg1: tensor<4x8x16xi8>, %arg2: tensor<4x8x16xi8>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8):
      "linalg.yield"(%arg3) : (i8) -> ()
    }) : (tensor<4x8x16xi8>, tensor<4x8x16xi8>) -> tensor<4x8x16xi8>
    "func.return"(%2) : (tensor<4x8x16xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xi8>, tensor<4x8x16xi8>) -> tensor<4x8x16xi8>, sym_name = "copy_3d_4x8x16xi8"}> ({
  ^bb0(%arg1: tensor<4x8x16xi8>, %arg2: tensor<4x8x16xi8>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8):
      "linalg.yield"(%arg3) : (i8) -> ()
    }) : (tensor<4x8x16xi8>, tensor<4x8x16xi8>) -> tensor<4x8x16xi8>
    "func.return"(%2) : (tensor<4x8x16xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 8 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x5x7xi8>, tensor<3x5x7xi8>) -> tensor<3x5x7xi8>, sym_name = "copy_3d_3x5x7xi8"}> ({
  ^bb0(%arg1: tensor<3x5x7xi8>, %arg2: tensor<3x5x7xi8>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8):
      "linalg.yield"(%arg3) : (i8) -> ()
    }) : (tensor<3x5x7xi8>, tensor<3x5x7xi8>) -> tensor<3x5x7xi8>
    "func.return"(%2) : (tensor<3x5x7xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 8 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x15x5xi8>, tensor<16x15x5xi8>) -> tensor<16x15x5xi8>, sym_name = "copy_3d_16x15x5xi8"}> ({
  ^bb0(%arg1: tensor<16x15x5xi8>, %arg2: tensor<16x15x5xi8>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8):
      "linalg.yield"(%arg3) : (i8) -> ()
    }) : (tensor<16x15x5xi8>, tensor<16x15x5xi8>) -> tensor<16x15x5xi8>
    "func.return"(%2) : (tensor<16x15x5xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 8 : i64, total_num_threads = 128 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x15x40xi8>, tensor<16x15x40xi8>) -> tensor<16x15x40xi8>, sym_name = "copy_3d_16x15x40xi8"}> ({
  ^bb0(%arg1: tensor<16x15x40xi8>, %arg2: tensor<16x15x40xi8>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8):
      "linalg.yield"(%arg3) : (i8) -> ()
    }) : (tensor<16x15x40xi8>, tensor<16x15x40xi8>) -> tensor<16x15x40xi8>
    "func.return"(%2) : (tensor<16x15x40xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 64 : i64, total_num_threads = 128 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024xf16>, tensor<1024xf16>) -> tensor<1024xf16>, sym_name = "copy_1d_1024xf16"}> ({
  ^bb0(%arg1: tensor<1024xf16>, %arg2: tensor<1024xf16>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      "linalg.yield"(%arg3) : (f16) -> ()
    }) : (tensor<1024xf16>, tensor<1024xf16>) -> tensor<1024xf16>
    "func.return"(%2) : (tensor<1024xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<257xf16>, tensor<257xf16>) -> tensor<257xf16>, sym_name = "copy_1d_257xf16"}> ({
  ^bb0(%arg1: tensor<257xf16>, %arg2: tensor<257xf16>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      "linalg.yield"(%arg3) : (f16) -> ()
    }) : (tensor<257xf16>, tensor<257xf16>) -> tensor<257xf16>
    "func.return"(%2) : (tensor<257xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<512xi8>, tensor<512xi8>) -> tensor<512xi8>, sym_name = "copy_1d_512xi8"}> ({
  ^bb0(%arg1: tensor<512xi8>, %arg2: tensor<512xi8>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8):
      "linalg.yield"(%arg3) : (i8) -> ()
    }) : (tensor<512xi8>, tensor<512xi8>) -> tensor<512xi8>
    "func.return"(%2) : (tensor<512xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 8 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32x64xi8>, tensor<16x32x64xi8>) -> tensor<16x32x64xi8>, sym_name = "copy_3d_16x32x64xi8"}> ({
  ^bb0(%arg1: tensor<16x32x64xi8>, %arg2: tensor<16x32x64xi8>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8):
      "linalg.yield"(%arg3) : (i8) -> ()
    }) : (tensor<16x32x64xi8>, tensor<16x32x64xi8>) -> tensor<16x32x64xi8>
    "func.return"(%2) : (tensor<16x32x64xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 8 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

