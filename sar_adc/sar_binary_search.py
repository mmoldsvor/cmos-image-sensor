import matplotlib.pyplot as plt
import numpy as np

def dac(digital_value, reference=5, resolution=8):
    return (digital_value*reference)/(2**resolution-1)

def compare(non_inverting, inverting):
    return non_inverting > inverting

def sar_binary_search(analog_value, reference=5, resolution=8):
    result = 0
    for index in range(resolution):
        compare_result = compare(analog_value, dac(result + (1 << (resolution - index - 1)), reference, resolution))
        if compare_result:
            result = result + (1 << (resolution - index - 1))
    return result


def plot_binary_search(analog_value, reference=5, resolution=8):
    previous = 0
    result = []
    for index in range(resolution):
        compare_result = compare(analog_value, dac(previous + (1 << (resolution - index - 1)), reference, resolution))
        test_value = dac(previous + (1 << (resolution - index - 1)), reference, resolution)
        result.extend([test_value, test_value])
        if compare_result:
            previous = previous + (1 << (resolution - index - 1))
        analog_result = dac(previous, reference, resolution)
    return result


if __name__ == '__main__':
    target = 0.597647
    reference = 1.2
    resolution = 8

    result = plot_binary_search(target, reference, resolution)
    x = np.arange(len(result))

    plt.axhline(target, linestyle='--', color='orange')
    plt.plot(x, result)
    plt.ylim(0, reference)
    plt.show()