import numpy as np

def datasetname(mode):
    pathname = "/dados/UFES/GPS_clean"
    return pathname + "/dataset_{0}.txt".format(mode)

def logfilename(year, offset, mode):
    pathname = "/dados/UFES/GPS_clean"
    return pathname + "/UFES-{0}-{1}-{2}.csv".format(year, offset, mode)

def savedataset(year, offset, mode):
    data = np.genfromtxt(logfilename(year, offset, mode), delimiter=',', names=True, dtype=np.dtype([('timestamp', object), ('x', float), ('y', float), ('label', int)]))

    sample_file = open(datasetname(mode), "w")
    sample_file.write("ImageFile, Camera Position [X Y Z W P Q R]\n")
    for i in range(len(data)):
        sample_file.write("{0}/{1}.bb08.l.png {2} {3} 0.0 0.0 0.0 0.0 0.0\n".format(year, data['timestamp'][i], data['x'][i], data['y'][i]))
    sample_file.close()

if __name__ == '__main__':
    savedataset(20140418, 30, "train")
    savedataset(20160906, 30, "test")

