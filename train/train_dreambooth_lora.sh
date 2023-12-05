export MODEL_NAME="stabilityai/stable-diffusion-2-1"
#export MODEL_NAME="CompVis/stable-diffusion-v1-4"
export INSTANCE_DIR="/home/jrajan/dreambooth/dataset/pointling"
export OUTPUT_DIR="/home/jrajan/dreambooth/models/pointling_lora"
export CLASS_DIR="/home/jrajan/dreambooth/class_dataset/pointling_lora"

accelerate launch train_dreambooth_lora.py \
  --pretrained_model_name_or_path=$MODEL_NAME  \
  --instance_data_dir=$INSTANCE_DIR \
  --output_dir=$OUTPUT_DIR \
  --instance_prompt="A photo of a pntlng animation" \
  --resolution=768 \
  --train_batch_size=1 \
  --gradient_accumulation_steps=1 \
  --checkpointing_steps=500 \
  --learning_rate=1e-4 \
  --report_to="wandb" \
  --lr_scheduler="constant" \
  --lr_warmup_steps=0 \
  --max_train_steps=1200 \
  --validation_prompt="A photo of a pntlng animation freezing in winter" \
  --validation_epochs=50 \
  --seed="0"
