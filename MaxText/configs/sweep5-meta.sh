lr=0.001
lr_name=1

int8="True"
int8_name="T"

scale=32
num_slice=8
init_key=1
run_name=mattdavidow-sweep5-lr${lr_name}_int8${int8_name}_size${scale}_pods${num_slice}_key${key}
echo ${run_name}
                
python3 multihost_job.py --BUCKET_NAME="mattdavidow-maxtext-br" --RUN_NAME=${run_name} --TPU_TYPE=v5litepod-256 --NUM_SLICES=${num_slice} --VERSION=v2-alpha-tpuv5-lite --COMMAND="bash setup.sh && bash MaxText/configs/sweep5-individual.sh ${lr} ${int8} ${scale} ${num_slice} ${key} ${run_name}" --ZONE=us-east5-b      