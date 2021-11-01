import numpy as np
import matplotlib.pyplot as plt

from pathlib import Path

def read_file(path: Path):
    values = []
    with path.open('r') as file:
        for line in file.readlines():
            values.append([float(value) for value in line.split()])

    array = np.array(values)
    return [column.flatten() for column in np.hsplit(array, array.shape[1])]


if __name__ == '__main__':
    path = Path('../spice_backup/tb_comp.csv')

    array = read_file(path)
    test1, test2, test3, test4, test5, test6 = array
    
    plt.plot(test1, test4)
    plt.show()

