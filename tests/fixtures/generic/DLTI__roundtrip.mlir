#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "test.unknown_op"() {test.unknown_attr_1 = #dlti.dl_entry<"test.identifier", 42 : i64>, test.unknown_attr_2 = #dlti.dl_entry<"test.identifier", #map>, test.unknown_attr_3 = #dlti.dl_entry<i32, 32 : index>, test.unknown_attr_4 = #dlti.dl_entry<memref<?x?xf32>, ["string", 10]>, test.unknown_attr_5 = #dlti.dl_spec<>, test.unknown_attr_6 = #dlti.dl_spec<"test.id" = 42 : i32>, test.unknown_attr_7 = #dlti.dl_spec<"test.id1" = 43 : index, "test.id2" = 44 : index, "test.id3" = 45 : index>, test.unknown_attr_7_unsugared = #dlti.dl_spec<"test.id1" = 43 : index, "test.id2" = 44 : index, "test.id3" = 45 : index>} : () -> ()
  "test.op_with_data_layout"() : () -> ()
  "test.op_with_data_layout"() {dlti.dl_spec = #dlti.dl_spec<>} : () -> ()
  "test.op_with_data_layout"() ({
    "test.op_with_data_layout"() {dlti.dl_spec = #dlti.dl_spec<"unknown.unknown" = 32 : i64>} : () -> ()
    "test.maybe_terminator_op"() : () -> ()
  }) {dlti.dl_spec = #dlti.dl_spec<"unknown.unknown" = 32 : i64>} : () -> ()
  "test.op_with_data_layout"() ({
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() {dlti.dl_spec = #dlti.dl_spec<"unknown.unknown" = 32 : i64>} : () -> ()
      "test.maybe_terminator_op"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<"unknown.unknown" = 32 : i64>} : () -> ()
    "test.maybe_terminator_op"() : () -> ()
  }) {dlti.dl_spec = #dlti.dl_spec<"unknown.unknown" = 32 : i64>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {dlti.target_system_spec = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"dlti.L1_cache_size_in_bytes" = 4096 : ui32>, "GPU" = #dlti.target_device_spec<"dlti.max_vector_op_width" = 128 : ui32>>} : () -> ()
}) : () -> ()

