import imageio
from datetime import timedelta
import cv2
import numpy as np
import os

def extract_frames(video_path, frames_path, num_frames=4):
    """
    Extract frames from a video at a given FPS
    :param video_path: path to the video
    :param frames_path: path to the directory to save the frames
    :param fps: frames per second
    :return: None
    """

    vidcap = cv2.VideoCapture(video_path)
    frame_rate = int(vidcap.get(cv2.CAP_PROP_FPS))
    total_frames = int(vidcap.get(cv2.CAP_PROP_FRAME_COUNT))
    frame_capture_rate = total_frames // num_frames

    success, image = vidcap.read()
    count = 0

    current_image = image
    while success:
        if count % frame_capture_rate == 0:
            while image[0][0].tolist() == [0, 0, 0] and success:
                success, image = vidcap.read()
                count += 1
            current_image = np.concatenate((current_image, image), axis=1)
        success, image = vidcap.read()

        count += 1
    cv2.imwrite(f"{frames_path}.jpg", current_image)




if __name__ == "__main__":
    videos_dir = "./generated_videos"
    frames_dir = "./generated_video_frames"
    # current working directory
    directory = os.path.dirname(os.path.realpath(__file__))
    for video in os.listdir(videos_dir):
        video_path = os.path.join(videos_dir, video)
        video_name = video.split(".")[0]
        frames_path = os.path.join("generated_video_frames", video_name)
        extract_frames(video_path, frames_path)
