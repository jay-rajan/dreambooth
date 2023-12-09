# dreambooth
Finetuning Dreambooth. 

Dreambooth is an effective way to generate custom images without the need for a GAN. It is based on the DeepDream algorithm, which is a convolutional neural network that is trained to recognize objects in images. The algorithm is then run in reverse, and the image is modified to maximize the activation of the network. This results in images that are similar to the original image, but with a dreamlike quality.
https://huggingface.co/docs/diffusers/v0.11.0/en/training/dreambooth

This repo has the scripts to finetune Dreambooth on a custom dataset.

## Setup and Fine-tuning
1. Clone this repo
2. Install the requirements
```pip install -r requirements.txt```
3. Additionally install the bleeding edge diffuser library
```
pip install git+https://github.com/huggingface/diffusers
pip install bitsandbytes
```
*Note that the Text to Video Zero may not work with the latest version of diffuser. If you run into issues, install the following version*
```pip install diffusers==0.23.0```
4. Clone diffuser repo
```git repo clone huggingface/diffusers```
5. The training scripts with the hyperparameters are found at train/train_dreambooth.py and train/train_dreambooth_lora.py
6. copy the training scripts to dreambooth folder and run the training script
```
cp train/train_dreambooth.py diffusers/examples/dreambooth/
cp train/train_dreambooth_lora.py diffusers/examples/dreambooth/
cd diffusers/examples/dreambooth/
train_dreambooth.sh
train_dreambooth_lora.sh
```

## Dataset 
The dataset is checked in to the repo at dataset

