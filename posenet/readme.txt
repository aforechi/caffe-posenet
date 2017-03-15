#installation instructions
mkdir build && cmake .. && make
cd ../python/ && for req in $(cat requirements.txt); do sudo pip install $req; done

#dataset preparation
#Change line 13 to the appropriate directories in create_posenet_lmdb_dataset.py
./scripts/create_posenet_lmdb_dataset_all.sh

#run test
#Change line 13 to the appropriate directories in test_posenet.py
#Change source and mean_file parameters in train_kingscollege.prototxt
python scripts/test_posenet.py --model /dados/posenet/PoseNet/train_kingscollege.prototxt --weights /dados/posenet/PoseNet/weights_kingscollege.caffemodel --iter 343
python scripts/test_posenet.py --model /dados/posenet/PoseNet/train_oldhospital.prototxt --weights /dados/posenet/PoseNet/weights_oldhospital.caffemodel --iter 182
python scripts/test_posenet.py --model /dados/posenet/PoseNet/train_shopfacade.prototxt --weights /dados/posenet/PoseNet/weights_shopfacade.caffemodel --iter 103
python scripts/test_posenet.py --model /dados/posenet/PoseNet/train_stmaryschurch.prototxt --weights /dados/posenet/PoseNet/weights_stmaryschurch.caffemodel --iter 530
python scripts/test_posenet.py --model /dados/posenet/PoseNet/train_street.prototxt --weights /dados/posenet/PoseNet/weights_street.caffemodel --iter 2923

#run train
#Change first line to the appropriate directories in solver_posenet.prototxt
../build/tools/caffe train --solver=/dados/UFES/GPS_clean/solver_posenet.prototxt



