"builtin.module"() ({
^bb0:
}) {dlti.map = #dlti.map<"magic_num" = 42 : i32, "magic_num_float" = 4.242000e+01 : f32, "magic_type" = i32, i32 = #dlti.map<"bitwidth" = 32 : i32>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.map = #dlti.map<"magic_num" = 42 : i32, "magic_num_float" = 4.242000e+01 : f32, "magic_type" = i32, i32 = #dlti.map<"bitwidth" = 32 : i32>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.map = #dlti.map<"CPU" = #dlti.map<"L1_cache_size_in_bytes" = 4096 : i32>, "GPU" = #dlti.map<"max_vector_op_width" = 128 : i32>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"L1_cache_size_in_bytes" = 4096 : i32>, "GPU" = #dlti.target_device_spec<"max_vector_op_width" = 128 : i32>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"L1_cache_size_in_bytes" = 4096 : i32>, "GPU" = #dlti.target_device_spec<"L1_cache_size_in_bytes" = 8192 : i32>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"L1_cache_size_in_bytes" = 4096 : i64>, "GPU" = #dlti.target_device_spec<"L1_cache_size_in_bytes" = 8192 : i64>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"max_vector_op_width" = 64 : i32>, "GPU" = #dlti.target_device_spec<"max_vector_op_width" = 128 : i32>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"max_vector_op_width" = 64 : i64>, "GPU" = #dlti.target_device_spec<"max_vector_op_width" = 128 : i64>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"max_vector_op_width" = 64 : i64>, "GPU" = #dlti.target_device_spec<"max_vector_op_width" = 128 : i64>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"L1_cache_size_in_bytes" = 4096 : ui32>, "GPU" = #dlti.target_device_spec<"max_vector_op_width" = "128">>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"max_vector_op_width" = 4.096000e+03 : f32>, "GPU" = #dlti.target_device_spec<"L1_cache_size_in_bytes" = "128">>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"vector_unit" = #dlti.map<"max_op_width" = 4.096000e+03 : f32>>, "GPU" = #dlti.target_device_spec<"L1_cache_size_in_bytes" = "128">>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"L1_cache_size_in_bytes" = 4096 : ui32>, "GPU" = #dlti.target_device_spec<"max_vector_op_width" = 128 : i64>>} : () -> ()

// -----
"builtin.module"() ({
  "test.op_with_dlti_map"() ({
  }) {dlti.map = #dlti.map<"dlti.unknown_id" = 42 : i64>} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "test.op_with_dlti_map"() ({
  }) {dlti.map = #dlti.map<i32 = 42 : i64>} : () -> ()
}) : () -> ()

