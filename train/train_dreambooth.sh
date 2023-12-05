export MODEL_NAME="stabilityai/stable-diffusion-2-1"
#export MODEL_NAME="CompVis/stable-diffusion-v1-4"
export INSTANCE_DIR="/home/jrajan/dreambooth/dataset/pointling"
export OUTPUT_DIR="/home/jrajan/dreambooth/models/pointling"
export CLASS_DIR="/home/jrajan/dreambooth/class_dataset/pointling"

accelerate launch train_dreambooth.py \
  --pretrained_model_name_or_path=$MODEL_NAME  \
  --instance_data_dir=$INSTANCE_DIR \
  --class_data_dir=$CLASS_DIR \
  --output_dir=$OUTPUT_DIR \
  --with_prior_preservation --prior_loss_weight=1.0 \
  --instance_prompt="A photo of a pntlng animation" \
  --class_prompt="An image of a single animation" \
  --resolution=512 \
  --train_batch_size=1 \
  --checkpointing_steps=500 \
  --gradient_accumulation_steps=2 --gradient_checkpointing \
  --use_8bit_adam \
  --learning_rate=5e-6 \
  --lr_scheduler="constant" \
  --lr_warmup_steps=0 \
  --num_class_images=200 \
  --max_train_steps=1200
