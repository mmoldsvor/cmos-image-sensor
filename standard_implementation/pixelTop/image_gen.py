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

    output_image = 255 - np.reshape(pixels, (-1, width))
    output_image -= 1
    print(np.min(output_image))

    cv2.imwrite('output_image.png', output_image)

    resized = cv2.resize(output_image, (512, 512), 0, 0, interpolation = cv2.INTER_NEAREST)

    cv2.imshow('image', resized)
    cv2.waitKey(0)

def generate_file(input_path, output_path):
    input_image = cv2.imread(str(input_path), cv2.IMREAD_GRAYSCALE)
    resized = cv2.resize(input_image, (512, 512), 0, 0, interpolation = cv2.INTER_NEAREST)
    cv2.imshow('image window', resized)
    cv2.waitKey(0)

    pixels = input_image.flatten()
    print(pixels)
    write_bytes(output_path, pixels)

def subtract(input_path1, input_path2):
    input_image1 = cv2.imread(str(input_path1), cv2.IMREAD_GRAYSCALE)
    input_image2 = cv2.imread(str(input_path2), cv2.IMREAD_GRAYSCALE)

    test = (input_image1 - input_image2)
    print(test)
    resized = cv2.resize(test, (512, 512), 0, 0, interpolation = cv2.INTER_NEAREST)

    cv2.imshow('image window', resized)
    cv2.waitKey(0)


if __name__ == '__main__':
    output_file_path = Path('pixel_x10_output.txt')
    input_file_path = Path('wulffern_x10_image.png')
    generated_file_path = Path('pixel_x10_values.txt')
    generate_file(input_file_path, generated_file_path)
    generate_image(output_file_path, 10, 10)
    #subtract('images/cds/cds_enabled.png', input_file_path)
