#!/bin/bash

python scripts/test_posenet.py --model /dados/posenet/PoseNet/train_kingscollege.prototxt --weights /dados/posenet/PoseNet/weights_kingscollege.caffemodel --iter 343
python scripts/test_posenet.py --model /dados/posenet/PoseNet/train_oldhospital.prototxt --weights /dados/posenet/PoseNet/weights_oldhospital.caffemodel --iter 182
python scripts/test_posenet.py --model /dados/posenet/PoseNet/train_shopfacade.prototxt --weights /dados/posenet/PoseNet/weights_shopfacade.caffemodel --iter 103
python scripts/test_posenet.py --model /dados/posenet/PoseNet/train_stmaryschurch.prototxt --weights /dados/posenet/PoseNet/weights_stmaryschurch.caffemodel --iter 530
python scripts/test_posenet.py --model /dados/posenet/PoseNet/train_street.prototxt --weights /dados/posenet/PoseNet/weights_street.caffemodel --iter 2923

