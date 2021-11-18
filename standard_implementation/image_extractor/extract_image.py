import cv2
from pathlib import Path

def click_event(event, x, y, flags, params):
    if event == cv2.EVENT_LBUTTONDOWN:
        print(x, ' ', y)

def interactive_image(name): 
    input_image = cv2.imread(f'base_images/{name}', cv2.IMREAD_GRAYSCALE)
    cv2.imshow('image', input_image)
    cv2.setMouseCallback('image', click_event)
    cv2.waitKey(0)

def extract_image(name, x=300, y=485, w=1500, h=510):
    print(f'base_images/{name}')
    input_image = cv2.imread(f'base_images/{name}', cv2.IMREAD_GRAYSCALE)

    extract = input_image[y:y+h,x:x+w]
    extract[extract == 242]  = 255
    print(extract)
    cv2.imshow('image window', extract)
    cv2.waitKey(0)

    cv2.imwrite(f'output_images/{name}', extract)

def state_machine_std():
    extract_image('state_machine_std.png', h=360)
    extract_image('state_machine_clk_idle.png', h=100)
    extract_image('state_machine_clk_idle_to_erase.png', h=100)
    extract_image('state_machine_enable.png', h=360)
    extract_image('state_machine_cont_mode.png', h=360)
    extract_image('state_machine_cds.png', h=410)
    extract_image('state_machine_cds_cont_mode.png', h=410)

def pixel_integration():
    extract_image('pixel_integration.png', h=260)
    extract_image('pixel_integration_corr.png', h=260)

def pixel_array():
    extract_image('pixel_array_output.png', h=410)
    extract_image('pixel_array_output_std.png', h=410)

if __name__ == '__main__':
    # state_machine_std()
    # pixel_integration()
    pixel_array()