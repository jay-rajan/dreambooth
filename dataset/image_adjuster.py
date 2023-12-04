import os

from PIL import Image

def image_resize(in_image, out_image, width, height):
    img = Image.open(in_image)
    upper = 600
    img = img.crop((0,upper,width, upper+height))
    img.save(out_image)


if __name__ == '__main__':
    dir_list = os.listdir('pointling')
    for f in dir_list:
        file_name = f.split('.')[0]
        if f.split('.')[1] != "jpg":
            continue
        print("Processing:" + file_name)
        image_resize(f"pointling/{file_name}.jpg", f"pointling/resized_{file_name}.jpg", 512, 512)
    #image_resize('pointling/pntlng51.jpg', 'pointling/pntlng51_resized.jpg', 512, 512)
