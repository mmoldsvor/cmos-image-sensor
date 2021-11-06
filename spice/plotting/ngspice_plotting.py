import numpy as np
import matplotlib.pyplot as plt

from pathlib import Path

def read_file(path: Path):
    values = []
    with path.open('r') as file:
        for line in file.readlines():
            values.append(line.split())

    array = np.array(values, dtype=np.float)
    return tuple(column.flatten() for index, column in enumerate(np.hsplit(array, array.shape[1])) if index % 2 != 0 or index == 0)

def plot_comparator():
    path = Path('tb_comp.txt')

    time, ramp, store, comp = read_file(path)
    
    plt.plot(time, ramp, time, store, time, comp)
    plt.legend(['ramp', 'store', 'comp'])
    plt.show()

def plot_counter():
    path_b = Path('tb_counter_b.txt')
    path_g = Path('tb_counter_g.txt')

    time_data, data0, data1, data2, data3, data4, data5, data6, data7 = read_file(path_b)
    time_out, out0, out1, out2, out3, out4, out5, out6, out7 = read_file(path_g)
    
    time_data /= 1000
    time_out /= 1000

    fig, ax = plt.subplots(nrows=8, figsize=(18, 5))

    ax[0].plot(time_data, data0)
    ax[1].plot(time_data, data1)
    ax[2].plot(time_data, data2)
    ax[3].plot(time_data, data3)
    ax[4].plot(time_data, data4)
    ax[5].plot(time_data, data5)
    ax[6].plot(time_data, data6)
    ax[7].plot(time_data, data7)
    plt.show()

    fig, ax = plt.subplots(nrows=8, figsize=(18, 5))

    ax[0].plot(time_out, out0)
    ax[1].plot(time_out, out1)
    ax[2].plot(time_out, out2)
    ax[3].plot(time_out, out3)
    ax[4].plot(time_out, out4)
    ax[5].plot(time_out, out5)
    ax[6].plot(time_out, out6)
    ax[7].plot(time_out, out7)
    plt.show()

def plot_sensor():
    path = Path('tb_sensor.txt')
    
    time_data, test1, test2, test3, test4, test5, test6 = read_file(path)

    plt.plot(time_data, test1, time_data, test2, time_data, test3, time_data, test4)
    plt.legend(['ramp', 'store', 'comp', 'sd'])
    plt.show()

    plt.plot(time_data, test5)
    plt.show()


if __name__ == '__main__':
    #plot_sensor()
    
    plot_comparator()
    
    #plot_counter()
