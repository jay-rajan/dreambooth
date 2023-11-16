# dreambooth
Finetuning Dreambooth. 

Dreambooth is an effective way to generate custom images without the need for a GAN. It is based on the DeepDream algorithm, which is a convolutional neural network that is trained to recognize objects in images. The algorithm is then run in reverse, and the image is modified to maximize the activation of the network. This results in images that are similar to the original image, but with a dreamlike quality.
https://huggingface.co/docs/diffusers/v0.11.0/en/training/dreambooth

This repo has the scripts to finetune Dreambooth on a custom dataset.

