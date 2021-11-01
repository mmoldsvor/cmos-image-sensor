import cv2
import numpy as np
from pathlib import Path

def write_bytes(path, array):
    with path.open('wb') as file:
        for value in array:
            file.write(int(value).to_bytes(1,byteorder='big'))

def read_bytes(path):
    result = []

    with path.open('rb') as file:
        byte = file.read(1)
        while byte:
            result.append(ord(byte))
            byte = file.read(1)
    
    return result

def generate_image(path, width, height):
    pixels = np.array(read_bytes(path), dtype=np.uint8)
    print(len(pixels))

    output_image = np.reshape(pixels, (-1, width))
    print(output_image)

    cv2.imwrite('output_image.png', output_image)

    cv2.imshow('image', output_image)
    cv2.waitKey(0)

def generate_file(input_path, output_path):
    input_image = cv2.imread(str(input_path), cv2.IMREAD_GRAYSCALE)
    cv2.imshow('image window', input_image)
    cv2.waitKey(0)

    pixels = input_image.flatten()
    print(pixels)
    write_bytes(output_path, pixels)

if __name__ == '__main__':
    output_file_path = Path('pixel_output.txt')
    input_file_path = Path('wulffern_image.png')
    generated_file_path = Path('pixel_values.txt')
    generate_file(input_file_path, generated_file_path)
    generate_image(output_file_path, 100, 100)
