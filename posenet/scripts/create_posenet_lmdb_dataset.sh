#!/bin/bash

#$1 full path to the dataset (e.g.: /media/avelino/logs/posenet/KingsCollege/)

python scripts/create_posenet_lmdb_dataset.py -p "$1" -f dataset_train.txt
mv posenet_dataset_lmdb "$1"dataset_train_lmdb

python scripts/create_posenet_lmdb_dataset.py -p "$1" -f dataset_test.txt
mv posenet_dataset_lmdb "$1"dataset_test_lmdb

../build/tools/compute_image_mean "$1"dataset_train_lmdb "$1"imagemean.binaryproto
