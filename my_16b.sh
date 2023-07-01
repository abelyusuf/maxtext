export TPU_LIBRARY_PATH=/home/rwitten/2023-07-01-20:35:06-libtpu.so
export LIBTPU_INIT_ARGS="--xla_tpu_enable_data_parallel_all_reduce_opt=true --xla_tpu_data_parallel_opt_different_sized_ops=true --xla_tpu_enable_async_collective_fusion=true --xla_tpu_enable_async_collective_fusion_fuse_all_gather=true --xla_tpu_enable_async_collective_fusion_multiple_steps=true --xla_tpu_overlap_compute_collective_tc=true --xla_enable_async_all_gather=true"
python3 MaxText/train.py MaxText/configs/base.yml run_name=my_run_path_0001 \
    steps=10 per_device_batch_size=2 enable_checkpointing=false\
    enable_profiler=false remat_policy=proj base_emb_dim=6144 base_mlp_dim=24576\
    base_num_heads=24 base_num_decoder_layers=36 head_dim=256\
    max_target_length=2048 metrics_file='metrics.txt' base_output_directory="gs://maxtext-experiments-multipod/"\
    dataset_path="gs://maxtext-dataset/" log_period=150