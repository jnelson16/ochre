#!/bin/bash
#
#SBATCH --job-name=nematus_eng-mon_context
#SBATCH --output=nematus_eng-mon_context.txt
#
#SBATCH --ntasks=1
#SBATCH -C TitanX
#SBATCH --time=00:00:00
#SBATCH --begin=20:00
#SBATCH --gres=gpu:1

srun mkdir -p /var/scratch/jvdzwaan/nematus/model/
srun python ~/code/nematus/nematus/train.py --source_dataset ~/data/nematus/train-eng_mon-context.ocr --target_dataset ~/data/nematus/train-eng_mon-context.gs --embedding_size 256 --tie_encoder_decoder_embeddings --rnn_use_dropout --batch_size 100 --valid_source_dataset ~/data/nematus/train-eng_mon-context.gs --valid_target_dataset ~/data/nematus/val-eng_mon-context.gs --dictionaries ~/data/nematus/train.gs.json ~/data/nematus/train.gs.json --valid_batch_size 100 --model /var/scratch/jvdzwaan/nematus/model/model
