import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import os

os.environ["PATH"] += ';C:/Program Files/MiKTeX/miktex/bin/x64/'

matplotlib.use("pgf")
matplotlib.rcParams.update({
    'font.family': 'serif',
    'text.usetex': True,
    'pgf.rcfonts': False,
    'axes.unicode_minus': False
})

from pathlib import Path

SHOW = False

def read_file(path: Path):
    values = []
    with path.open('r') as file:
        for line in file.readlines():
            values.append(line.split())

    array = np.array(values, dtype=np.float)
    return tuple(column.flatten() for index, column in enumerate(np.hsplit(array, array.shape[1])) if index % 2 != 0 or index == 0)

def plot_comparator_standard(name):
    time, store, ramp, comp = read_file(Path(f'{name}.txt'))
    
    plt.plot(time, ramp, time, store, time, comp)
    plt.legend(['ramp', 'store', 'comp'])

    #plt.show()
    plt.savefig(f'plots/{name}.pgf')
    plt.clf()

    plt.plot(time, ramp, time, store, time, comp)
    plt.legend(['ramp', 'store', 'comp'])

    plt.annotate(s='', xy=(2.815e-5, 0.70345), xytext=(2.815e-5, 0.7), arrowprops=dict(arrowstyle='<->'))
    plt.text(2.815e-5, 0.7025, '$3.4$ mV')


    plt.xlim(2.798e-5, 2.817e-5)
    plt.ylim(0.699, 0.704)
    #plt.show()
    plt.savefig(f'plots/{name}_zoom.pgf')
    plt.clf()

    plt.plot(time, ramp, time, store, time, comp)

    plt.annotate(s='', xy=(2.81e-5, 0.8), xytext=(2.817e-5, 0.8), arrowprops=dict(arrowstyle='<->'))
    plt.text(2.813e-5, 0.85, '$70$ ns')
    plt.vlines(2.81e-5, 0, 1.5, linestyles='dashed', color='black')
    plt.vlines(2.817e-5, 0, 1.5, linestyles='dashed', color='black')
    plt.legend(['ramp', 'store', 'comp'])
    plt.xlim(2.805e-5, 2.82e-5)
    #plt.show()
    plt.savefig(f'plots/{name}_speed.pgf')
    plt.clf()

def plot_comparator_dynamic(name):
    time, store, ramp, outp, outn, clk, reset, q, qn = read_file(Path(f'{name}.txt'))
    
    fig, ax = plt.subplots(nrows=2, figsize=(8.0, 6.0))

    ax[0].plot(time, ramp, time, store, time, qn)
    ax[0].legend(['ramp', 'store', 'comp'])
    ax[1].plot(time, outp, time, outn)
    ax[1].legend(['outp', 'outn'])

    #plt.show()
    plt.savefig(f'plots/{name}.pgf')
    plt.clf()

    plt.plot(time, ramp, time, store, time, qn)
    plt.legend(['ramp', 'store', 'comp'])
    
    plt.annotate(s='', xy=(2.850097e-5, 0.8), xytext=(2.850256e-5, 0.8), arrowprops=dict(arrowstyle='<->'))
    plt.text(2.8501e-5, 0.85, '$1.59$ ns')
    plt.vlines(2.850097e-5, 0, 1.5, linestyles='dashed', color='black')
    plt.vlines(2.850256e-5, 0, 1.5, linestyles='dashed', color='black')


    plt.xlim(2.85e-5, 2.8505e-5)
    # plt.ylim(0.699, 0.704)
    #plt.show()
    plt.savefig(f'plots/{name}_zoom.pgf')
    plt.clf()

    # plt.plot(time, ramp, time, store, time, comp)

    # plt.annotate(s='', xy=(2.81e-5, 0.8), xytext=(2.817e-5, 0.8), arrowprops=dict(arrowstyle='<->'))
    # plt.text(2.813e-5, 0.85, '$70$ ns')
    # plt.vlines(2.81e-5, 0, 1.5, linestyles='dashed', color='black')
    # plt.vlines(2.817e-5, 0, 1.5, linestyles='dashed', color='black')
    # plt.legend(['ramp', 'store', 'comp'])
    # plt.xlim(2.805e-5, 2.82e-5)
    # plt.show()
    # #plt.savefig(f'plots/{name}_speed.pgf')
    # #plt.clf()

def plot_comparator():
    #plot_comparator_standard('tb_comp')
    #plot_comparator_improved('tb_comp_improved')
    plot_comparator_dynamic('tb_comp_dynamic')

def plot_comparator_improved(name):
    time, store, ramp, comp = read_file(Path(f'{name}.txt'))
    
    plt.plot(time, ramp, time, store, time, comp)
    plt.legend(['ramp', 'store', 'comp'])

    #plt.show()
    plt.savefig(f'plots/{name}.pgf')
    plt.clf()

    plt.plot(time, ramp, time, store, time, comp)
    plt.annotate(s='', xy=(2.872e-5, 0.7), xytext=(2.872e-5, 0.7175), arrowprops=dict(arrowstyle='<->'))
    plt.text(2.8725e-5, 0.707, '$17$ mV')
    plt.legend(['ramp', 'store', 'comp'])
    plt.xlim(2.78e-5, 2.89e-5)
    plt.ylim(0.695, 0.73)
    #plt.show()
    plt.savefig(f'plots/{name}_zoom.pgf')
    plt.clf()

    plt.plot(time, ramp, time, store, time, comp)
    plt.annotate(s='', xy=(2.8686e-5, 0.8), xytext=(2.8691e-5, 0.8), arrowprops=dict(arrowstyle='<->'))
    plt.text(2.86886e-5, 0.85, '$5$ ns')
    plt.vlines(2.8686e-5, 0, 1.5, linestyles='dashed', color='black')
    plt.vlines(2.8691e-5, 0, 1.5, linestyles='dashed', color='black')
    plt.legend(['ramp', 'store', 'comp'])
    plt.xlim(2.868e-5, 2.8695e-5)
    #plt.show()
    plt.savefig(f'plots/{name}_speed.pgf')
    plt.clf()

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

    fig, ax = plt.subplots(nrows=8, figsize=(18, 5))

    ax[0].plot(time_out, out0)
    ax[1].plot(time_out, out1)
    ax[2].plot(time_out, out2)
    ax[3].plot(time_out, out3)
    ax[4].plot(time_out, out4)
    ax[5].plot(time_out, out5)
    ax[6].plot(time_out, out6)
    ax[7].plot(time_out, out7)
    
    plt.savefig('counter.pgf')

def plot_sensor_multi(name):
    time, test1, test2, test3, test4, test5, test6 = read_file(Path(f'{name}.txt'))

    plt.plot(time, test1, time, test2, time, test3)
    plt.legend(['vstore', 'erase', 'expose'])

    plt.savefig(f'plots/{name}.pgf')
    plt.clf()
    #plt.show()

def plot_sensor():
    plot_sensor_multi('tb_sensor')
    plot_sensor_multi('tb_sensor_long')
    plot_sensor_multi('tb_sensor_fast')
    plot_sensor_multi('tb_sensor_high')
    plot_sensor_multi('tb_sensor_settle')


def plot_comparator_dyn():
    path = Path('tb_comp.txt')

    time, ramp, store, outp, outn, clk, reset, q, qn = read_file(path)
    
    fig, ax = plt.subplots(nrows=5, figsize=(18, 5))
    ax[0].plot(time, ramp, time, store)
    ax[1].plot(time, outp)
    ax[2].plot(time, outn)
    ax[3].plot(time, clk)
    ax[4].plot(time, reset, time, qn)

    plt.savefig('comparator_dyn.pgf')

def plot_memcell_multi(name):
    time, comp, io, data, read, vg, dmem, ids = read_file(Path(f'{name}.txt'))
    plt.plot(time, ids)
    plt.legend(['M3.ids'])
    #plt.show()
    plt.savefig(f'plots/{name}_ids.pgf')
    plt.clf()

    fig, ax = plt.subplots(nrows=4, figsize=(8.0, 6.0))

    ax[0].plot(time, data)
    ax[0].legend(['data'])
    ax[1].plot(time, comp, time, read)
    ax[1].legend(['comp', 'read'])
    ax[2].plot(time, vg, time, dmem)
    ax[2].legend(['vg', 'dmem'])
    ax[3].plot(time, io)
    plt.tight_layout()
    plt.show()
    #plt.savefig(f'plots/{name}.pgf')
    #plt.clf()


def plot_memcell():
    plot_memcell_multi('tb_memcell_high')
    plot_memcell_multi('tb_memcell_low')

def plot_pixelmemory():
    path = Path('tb_pixelSensor.txt')

    time, vg8, dmem8, vg7, dmem7, vg6, dmem6, vg5, dmem5, vg4, dmem4, vg3, dmem3, vg2, dmem2, vg1, dmem1, \
        store, erase, expose, convert, ramp, comp, read, do = read_file(path)
    
    fig, ax = plt.subplots(nrows=9, figsize=(8, 6))
    ax[0].plot(time, vg8, time, dmem8)
    ax[0].legend(['vg8', 'dmem8'])
    ax[1].plot(time, vg7, time, dmem7)
    ax[1].legend(['vg7', 'dmem7'])
    ax[2].plot(time, vg6, time, dmem6)
    ax[2].legend(['vg6', 'dmem6'])
    ax[3].plot(time, vg5, time, dmem5)
    ax[3].legend(['vg5', 'dmem5'])
    ax[4].plot(time, vg4, time, dmem4)
    ax[4].legend(['vg4', 'dmem4'])
    ax[5].plot(time, vg3, time, dmem3)
    ax[5].legend(['vg3', 'dmem3'])
    ax[6].plot(time, vg2, time, dmem2)
    ax[6].legend(['vg2', 'dmem2'])
    ax[7].plot(time, vg1, time, dmem1)
    ax[7].legend(['vg1', 'dmem1'])
    ax[8].plot(time, comp)
    ax[8].legend(['comp'])
    plt.show()
    #plt.savefig('plots/pixelmemory.pgf')

def plot_pixelcomp():
    path = Path('tb_pixelSensor.txt')

    time, vg8, dmem8, vg7, dmem7, vg6, dmem6, vg5, dmem5, vg4, dmem4, vg3, dmem3, vg2, dmem2, vg1, dmem1, \
        store, erase, expose, convert, ramp, comp, read, do = read_file(path)

    plt.plot(time, ramp, time, comp, time, store)
    plt.legend(['ramp', 'comp', 'store'])

    test1 = time[np.abs(comp - 1.5*0.99).argmin()]
    test2 = time[np.abs(comp + 1.5*0.01).argmin()]
    print(test2 - test1)
    plt.show()
    #plt.savefig('plots/pixelcomp.pgf')

if __name__ == '__main__':
    plot_sensor()
    
    #plot_comparator()
    #plot_comparator_dyn()

    #plot_counter()

    #plot_memcell()
    #plot_pixelmemory()
    #plot_pixelcomp()