#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid_1d"}> : () -> ()
  "shard.grid"() <{shape = array<i64: 4>, sym_name = "grid_1d_4"}> : () -> ()
  "shard.grid"() <{shape = array<i64: 4, 4>, sym_name = "grid_2d_16"}> : () -> ()
  "shard.grid"() <{shape = array<i64: 2, 3, 4, 5>, sym_name = "grid_4d"}> : () -> ()
  "func.func"() <{function_type = (tensor<2xf32>) -> (tensor<2xf32>, !shard.sharding), sym_name = "return_sharding"}> ({
  ^bb0(%arg42: tensor<2xf32>):
    %187 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %188 = "shard.shard"(%arg42, %187) : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    %189 = "shard.get_sharding"(%188) : (tensor<2xf32>) -> !shard.sharding
    %190 = "shard.shard"(%188, %187) <{annotate_for_users}> : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    "func.return"(%190, %189) : (tensor<2xf32>, !shard.sharding) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "full_replication"}> ({
  ^bb0(%arg41: tensor<2xi8>):
    %183 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %184 = "shard.shard"(%arg41, %183) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %185 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %186 = "shard.shard"(%184, %185) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%186) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xf32>) -> tensor<2xf32>, sym_name = "sharding_triplet"}> ({
  ^bb0(%arg40: tensor<2xf32>):
    %177 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %178 = "shard.shard"(%arg40, %177) : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    %179 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %180 = "shard.shard"(%178, %179) <{annotate_for_users}> : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    %181 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %182 = "shard.shard"(%180, %181) <{annotate_for_users}> : (tensor<2xf32>, !shard.sharding) -> tensor<2xf32>
    "func.return"(%182) : (tensor<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x48xi8>) -> tensor<6x48xi8>, sym_name = "unsplit_last_axes_some"}> ({
  ^bb0(%arg39: tensor<6x48xi8>):
    %173 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0, 1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %174 = "shard.shard"(%arg39, %173) : (tensor<6x48xi8>, !shard.sharding) -> tensor<6x48xi8>
    %175 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %176 = "shard.shard"(%174, %175) <{annotate_for_users}> : (tensor<6x48xi8>, !shard.sharding) -> tensor<6x48xi8>
    "func.return"(%176) : (tensor<6x48xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<48x48xi8>) -> tensor<48x48xi8>, sym_name = "unsplit_last_axes_all"}> ({
  ^bb0(%arg38: tensor<48x48xi8>):
    %169 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0, 1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %170 = "shard.shard"(%arg38, %169) : (tensor<48x48xi8>, !shard.sharding) -> tensor<48x48xi8>
    %171 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %172 = "shard.shard"(%170, %171) <{annotate_for_users}> : (tensor<48x48xi8>, !shard.sharding) -> tensor<48x48xi8>
    "func.return"(%172) : (tensor<48x48xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x10x16x15xi8>) -> tensor<6x10x16x15xi8>, sym_name = "unsplit_all_dims"}> ({
  ^bb0(%arg37: tensor<6x10x16x15xi8>):
    %165 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [3], [2], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %166 = "shard.shard"(%arg37, %165) : (tensor<6x10x16x15xi8>, !shard.sharding) -> tensor<6x10x16x15xi8>
    %167 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], []]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %168 = "shard.shard"(%166, %167) <{annotate_for_users}> : (tensor<6x10x16x15xi8>, !shard.sharding) -> tensor<6x10x16x15xi8>
    "func.return"(%168) : (tensor<6x10x16x15xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x10x16x15xi8>) -> tensor<6x10x16x15xi8>, sym_name = "unsplit_some_dims"}> ({
  ^bb0(%arg36: tensor<6x10x16x15xi8>):
    %161 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [3], [2], []]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %162 = "shard.shard"(%arg36, %161) : (tensor<6x10x16x15xi8>, !shard.sharding) -> tensor<6x10x16x15xi8>
    %163 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %164 = "shard.shard"(%162, %163) <{annotate_for_users}> : (tensor<6x10x16x15xi8>, !shard.sharding) -> tensor<6x10x16x15xi8>
    "func.return"(%164) : (tensor<6x10x16x15xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x2xi8>) -> tensor<2x2xi8>, sym_name = "move_split_axis"}> ({
  ^bb0(%arg35: tensor<2x2xi8>):
    %157 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %158 = "shard.shard"(%arg35, %157) : (tensor<2x2xi8>, !shard.sharding) -> tensor<2x2xi8>
    %159 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %160 = "shard.shard"(%158, %159) <{annotate_for_users}> : (tensor<2x2xi8>, !shard.sharding) -> tensor<2x2xi8>
    "func.return"(%160) : (tensor<2x2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x10x120x15xi8>) -> tensor<6x10x120x15xi8>, sym_name = "unsplit_and_split"}> ({
  ^bb0(%arg34: tensor<6x10x120x15xi8>):
    %153 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [], [1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %154 = "shard.shard"(%arg34, %153) : (tensor<6x10x120x15xi8>, !shard.sharding) -> tensor<6x10x120x15xi8>
    %155 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [], [1, 2, 3]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %156 = "shard.shard"(%154, %155) <{annotate_for_users}> : (tensor<6x10x120x15xi8>, !shard.sharding) -> tensor<6x10x120x15xi8>
    "func.return"(%156) : (tensor<6x10x120x15xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x10x120x15xi8>) -> tensor<6x10x120x15xi8>, sym_name = "move_and_split"}> ({
  ^bb0(%arg33: tensor<6x10x120x15xi8>):
    %149 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [], [1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %150 = "shard.shard"(%arg33, %149) : (tensor<6x10x120x15xi8>, !shard.sharding) -> tensor<6x10x120x15xi8>
    %151 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0], [1, 2, 3]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %152 = "shard.shard"(%150, %151) <{annotate_for_users}> : (tensor<6x10x120x15xi8>, !shard.sharding) -> tensor<6x10x120x15xi8>
    "func.return"(%152) : (tensor<6x10x120x15xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x10x120x15xi8>) -> tensor<6x10x120x15xi8>, sym_name = "move_and_unsplit"}> ({
  ^bb0(%arg32: tensor<6x10x120x15xi8>):
    %145 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [], [1, 2]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %146 = "shard.shard"(%arg32, %145) : (tensor<6x10x120x15xi8>, !shard.sharding) -> tensor<6x10x120x15xi8>
    %147 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %148 = "shard.shard"(%146, %147) <{annotate_for_users}> : (tensor<6x10x120x15xi8>, !shard.sharding) -> tensor<6x10x120x15xi8>
    "func.return"(%148) : (tensor<6x10x120x15xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x20x120x15xi8>) -> tensor<6x20x120x15xi8>, sym_name = "unsplit_move_split"}> ({
  ^bb0(%arg31: tensor<6x20x120x15xi8>):
    %141 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [2], [], [3]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %142 = "shard.shard"(%arg31, %141) : (tensor<6x20x120x15xi8>, !shard.sharding) -> tensor<6x20x120x15xi8>
    %143 = "shard.sharding"() <{grid = @grid_4d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [], [2], [3, 1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %144 = "shard.shard"(%142, %143) <{annotate_for_users}> : (tensor<6x20x120x15xi8>, !shard.sharding) -> tensor<6x20x120x15xi8>
    "func.return"(%144) : (tensor<6x20x120x15xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> i8, sym_name = "non_tensor_value"}> ({
  ^bb0(%arg30: i8):
    %140 = "arith.addi"(%arg30, %arg30) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    "func.return"(%140) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "unary_elementwise"}> ({
  ^bb0(%arg29: tensor<2xi8>):
    %131 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %132 = "shard.shard"(%arg29, %131) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %133 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %134 = "shard.shard"(%132, %133) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %135 = "tosa.abs"(%134) : (tensor<2xi8>) -> tensor<2xi8>
    %136 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %137 = "shard.shard"(%135, %136) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %138 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %139 = "shard.shard"(%137, %138) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%139) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "unary_elementwise_with_resharding"}> ({
  ^bb0(%arg28: tensor<2xi8>):
    %122 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %123 = "shard.shard"(%arg28, %122) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %124 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %125 = "shard.shard"(%123, %124) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %126 = "tosa.abs"(%125) : (tensor<2xi8>) -> tensor<2xi8>
    %127 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %128 = "shard.shard"(%126, %127) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %129 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %130 = "shard.shard"(%128, %129) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%130) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>, tensor<2xi8>) -> tensor<2xi8>, sym_name = "binary_elementwise"}> ({
  ^bb0(%arg26: tensor<2xi8>, %arg27: tensor<2xi8>):
    %109 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %110 = "shard.shard"(%arg26, %109) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %111 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %112 = "shard.shard"(%110, %111) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %113 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %114 = "shard.shard"(%arg27, %113) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %115 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %116 = "shard.shard"(%114, %115) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %117 = "tosa.add"(%112, %116) : (tensor<2xi8>, tensor<2xi8>) -> tensor<2xi8>
    %118 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %119 = "shard.shard"(%117, %118) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %120 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %121 = "shard.shard"(%119, %120) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%121) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi8>) -> tensor<2xi8>, sym_name = "multiple_chained_ops"}> ({
  ^bb0(%arg25: tensor<2xi8>):
    %95 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %96 = "shard.shard"(%arg25, %95) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %97 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %98 = "shard.shard"(%96, %97) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %99 = "tosa.abs"(%98) : (tensor<2xi8>) -> tensor<2xi8>
    %100 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %101 = "shard.shard"(%99, %100) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %102 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %103 = "shard.shard"(%101, %102) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %104 = "tosa.abs"(%103) : (tensor<2xi8>) -> tensor<2xi8>
    %105 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %106 = "shard.shard"(%104, %105) : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    %107 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %108 = "shard.shard"(%106, %107) <{annotate_for_users}> : (tensor<2xi8>, !shard.sharding) -> tensor<2xi8>
    "func.return"(%108) : (tensor<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>) -> tensor<8x16xf32>, sym_name = "incomplete_sharding"}> ({
  ^bb0(%arg24: tensor<8x16xf32>):
    %89 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %90 = "shard.shard"(%arg24, %89) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %91 = "tosa.sigmoid"(%90) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %92 = "shard.sharding"() <{grid = @grid_1d, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %93 = "shard.shard"(%91, %92) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %94 = "shard.shard"(%93, %92) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%94) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<8x16xf32>, sym_name = "ew_chain_with_halo"}> ({
  ^bb0(%arg21: tensor<8x16xf32>, %arg22: tensor<1xf32>, %arg23: tensor<1xf32>):
    %69 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %70 = "shard.shard"(%arg21, %69) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %71 = "tosa.tanh"(%70) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %72 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %73 = "shard.shard"(%71, %72) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %74 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %75 = "shard.shard"(%73, %74) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %76 = "tosa.abs"(%75) : (tensor<8x16xf32>) -> tensor<8x16xf32>
    %77 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %78 = "shard.shard"(%76, %77) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %79 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %80 = "shard.shard"(%78, %79) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %81 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %82 = "shard.shard"(%arg22, %81) <{annotate_for_users}> : (tensor<1xf32>, !shard.sharding) -> tensor<1xf32>
    %83 = "shard.shard"(%arg23, %81) <{annotate_for_users}> : (tensor<1xf32>, !shard.sharding) -> tensor<1xf32>
    %84 = "tosa.negate"(%80, %82, %83) : (tensor<8x16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<8x16xf32>
    %85 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %86 = "shard.shard"(%84, %85) : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    %87 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 1>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %88 = "shard.shard"(%86, %87) <{annotate_for_users}> : (tensor<8x16xf32>, !shard.sharding) -> tensor<8x16xf32>
    "func.return"(%88) : (tensor<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1200x1200xi64>) -> tensor<1200x1200xi64>, sym_name = "test_shard_update_halo"}> ({
  ^bb0(%arg20: tensor<1200x1200xi64>):
    %64 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %65 = "shard.shard"(%arg20, %64) : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    %66 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64: 2, 2>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %67 = "shard.shard"(%65, %66) : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    %68 = "shard.shard"(%67, %66) <{annotate_for_users}> : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    "func.return"(%68) : (tensor<1200x1200xi64>) -> ()
  }) : () -> ()
  "shard.grid"() <{shape = array<i64: 4, 4>, sym_name = "grid4x4"}> : () -> ()
  "func.func"() <{function_type = (tensor<1200x1200xi64>) -> tensor<1200x1200xi64>, sym_name = "test_shard_update_halo2d"}> ({
  ^bb0(%arg19: tensor<1200x1200xi64>):
    %59 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %60 = "shard.shard"(%arg19, %59) : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    %61 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], [1]]>, static_halo_sizes = array<i64: 1, 2, 3, 4>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %62 = "shard.shard"(%60, %61) : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    %63 = "shard.shard"(%62, %61) <{annotate_for_users}> : (tensor<1200x1200xi64>, !shard.sharding) -> tensor<1200x1200xi64>
    "func.return"(%63) : (tensor<1200x1200xi64>) -> ()
  }) : () -> ()
  "shard.grid"() <{shape = array<i64: 2>, sym_name = "grid"}> : () -> ()
  "func.func"() <{function_type = (tensor<6x6xi32>) -> tensor<i32>, sym_name = "test_reduce_0d"}> ({
  ^bb0(%arg16: tensor<6x6xi32>):
    %49 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %50 = "shard.shard"(%arg16, %49) <{annotate_for_users}> : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    %51 = "tensor.empty"() : () -> tensor<i32>
    %52 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %53 = "shard.shard"(%51, %52) : (tensor<i32>, !shard.sharding) -> tensor<i32>
    %54 = "shard.shard"(%50, %49) <{annotate_for_users}> : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    %55 = "linalg.reduce"(%54, %53) <{dimensions = array<i64: 0, 1>}> ({
    ^bb0(%arg17: i32, %arg18: i32):
      %58 = "arith.addi"(%arg17, %arg18) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%58) : (i32) -> ()
    }) : (tensor<6x6xi32>, tensor<i32>) -> tensor<i32>
    %56 = "shard.shard"(%55, %52) : (tensor<i32>, !shard.sharding) -> tensor<i32>
    %57 = "shard.shard"(%56, %52) <{annotate_for_users}> : (tensor<i32>, !shard.sharding) -> tensor<i32>
    "func.return"(%57) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x6xi32>) -> tensor<6xi32>, sym_name = "test_reduce_1d"}> ({
  ^bb0(%arg13: tensor<6x6xi32>):
    %39 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %40 = "shard.shard"(%arg13, %39) <{annotate_for_users}> : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    %41 = "tensor.empty"() : () -> tensor<6xi32>
    %42 = "shard.shard"(%41, %39) : (tensor<6xi32>, !shard.sharding) -> tensor<6xi32>
    %43 = "shard.shard"(%42, %39) <{annotate_for_users}> : (tensor<6xi32>, !shard.sharding) -> tensor<6xi32>
    %44 = "shard.shard"(%40, %39) <{annotate_for_users}> : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32>
    %45 = "linalg.reduce"(%44, %43) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg14: i32, %arg15: i32):
      %48 = "arith.addi"(%arg14, %arg15) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%48) : (i32) -> ()
    }) : (tensor<6x6xi32>, tensor<6xi32>) -> tensor<6xi32>
    %46 = "shard.shard"(%45, %39) : (tensor<6xi32>, !shard.sharding) -> tensor<6xi32>
    %47 = "shard.shard"(%46, %39) <{annotate_for_users}> : (tensor<6xi32>, !shard.sharding) -> tensor<6xi32>
    "func.return"(%47) : (tensor<6xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<512x2048xf32>, tensor<2048x1024xf32>, tensor<1024x2048xf32>) -> tensor<512x2048xf32>, sym_name = "mlp_1d_weight_stationary"}> ({
  ^bb0(%arg0: tensor<512x2048xf32>, %arg1: tensor<2048x1024xf32>, %arg2: tensor<1024x2048xf32>):
    %0 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %1 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], []]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %2 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %3 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %4 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %5 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0], []]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %6 = "shard.sharding"() <{grid = @grid_1d_4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %7 = "shard.shard"(%arg0, %3) : (tensor<512x2048xf32>, !shard.sharding) -> tensor<512x2048xf32>
    %8 = "shard.shard"(%arg1, %4) : (tensor<2048x1024xf32>, !shard.sharding) -> tensor<2048x1024xf32>
    %9 = "shard.shard"(%arg2, %5) : (tensor<1024x2048xf32>, !shard.sharding) -> tensor<1024x2048xf32>
    %10 = "tensor.empty"() : () -> tensor<512x1024xf32>
    %11 = "shard.shard"(%10, %0) : (tensor<512x1024xf32>, !shard.sharding) -> tensor<512x1024xf32>
    %12 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %13 = "shard.shard"(%11, %0) <{annotate_for_users}> : (tensor<512x1024xf32>, !shard.sharding) -> tensor<512x1024xf32>
    %14 = "linalg.fill"(%12, %13) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32):
      "linalg.yield"(%arg11) : (f32) -> ()
    }) : (f32, tensor<512x1024xf32>) -> tensor<512x1024xf32>
    %15 = "shard.shard"(%14, %0) : (tensor<512x1024xf32>, !shard.sharding) -> tensor<512x1024xf32>
    %16 = "shard.shard"(%7, %2) <{annotate_for_users}> : (tensor<512x2048xf32>, !shard.sharding) -> tensor<512x2048xf32>
    %17 = "shard.shard"(%8, %0) <{annotate_for_users}> : (tensor<2048x1024xf32>, !shard.sharding) -> tensor<2048x1024xf32>
    %18 = "shard.shard"(%15, %0) <{annotate_for_users}> : (tensor<512x1024xf32>, !shard.sharding) -> tensor<512x1024xf32>
    %19 = "linalg.matmul"(%16, %17, %18) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
      %37 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %38 = "arith.addf"(%arg10, %37) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%38) : (f32) -> ()
    }) : (tensor<512x2048xf32>, tensor<2048x1024xf32>, tensor<512x1024xf32>) -> tensor<512x1024xf32>
    %20 = "shard.shard"(%19, %0) : (tensor<512x1024xf32>, !shard.sharding) -> tensor<512x1024xf32>
    %21 = "shard.shard"(%20, %0) <{annotate_for_users}> : (tensor<512x1024xf32>, !shard.sharding) -> tensor<512x1024xf32>
    %22 = "tosa.sigmoid"(%21) : (tensor<512x1024xf32>) -> tensor<512x1024xf32>
    %23 = "shard.shard"(%22, %0) : (tensor<512x1024xf32>, !shard.sharding) -> tensor<512x1024xf32>
    %24 = "tensor.empty"() : () -> tensor<512x2048xf32>
    %25 = "shard.shard"(%24, %2) : (tensor<512x2048xf32>, !shard.sharding) -> tensor<512x2048xf32>
    %26 = "shard.shard"(%25, %2) <{annotate_for_users}> : (tensor<512x2048xf32>, !shard.sharding) -> tensor<512x2048xf32>
    %27 = "linalg.fill"(%12, %26) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (f32, tensor<512x2048xf32>) -> tensor<512x2048xf32>
    %28 = "shard.shard"(%27, %2) : (tensor<512x2048xf32>, !shard.sharding) -> tensor<512x2048xf32>
    %29 = "shard.shard"(%23, %0) <{annotate_for_users}> : (tensor<512x1024xf32>, !shard.sharding) -> tensor<512x1024xf32>
    %30 = "shard.shard"(%9, %1) <{annotate_for_users}> : (tensor<1024x2048xf32>, !shard.sharding) -> tensor<1024x2048xf32>
    %31 = "shard.shard"(%28, %2) <{annotate_for_users}> : (tensor<512x2048xf32>, !shard.sharding) -> tensor<512x2048xf32>
    %32 = "linalg.matmul"(%29, %30, %31) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %35 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %36 = "arith.addf"(%arg5, %35) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%36) : (f32) -> ()
    }) : (tensor<512x1024xf32>, tensor<1024x2048xf32>, tensor<512x2048xf32>) -> tensor<512x2048xf32>
    %33 = "shard.shard"(%32, %2) : (tensor<512x2048xf32>, !shard.sharding) -> tensor<512x2048xf32>
    %34 = "shard.shard"(%33, %6) <{annotate_for_users}> : (tensor<512x2048xf32>, !shard.sharding) -> tensor<512x2048xf32>
    "func.return"(%34) : (tensor<512x2048xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

