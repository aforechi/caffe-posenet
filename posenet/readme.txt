#installation instructions
mkdir build && cd build
#cmake -DCUDNN_INCLUDE="/usr/local/cudnn-5.0/include" -DCUDNN_LIBRARY="/usr/local/cudnn-5.0/lib64/libcudnn.so" .. 
cmake -DUSE_CUDNN=OFF ..
make
cd ../python/ && for req in $(cat requirements.txt); do sudo pip install $req; done

#dataset preparation
#Change line 13 to the appropriate directories in create_posenet_lmdb_dataset.py
./scripts/create_posenet_lmdb_dataset_all.sh

#run test
#Change line 13 to the appropriate directories in test_posenet.py
#Change source and mean_file parameters in train_kingscollege.prototxt
./scripts/test_posenet_all.sh

#run train
#Change first line to the appropriate directories in solver_posenet.prototxt
../build/tools/caffe train --solver=/dados/UFES/GPS_clean/solver_posenet.prototxt



