#bin/sh

KEYWORD="$1"
# $pip install google_images_download
# Please execute ↑ before execute this script

googleimagesdownload -k "${KEYWORD}"
cd downloads/"${KEYWORD}"

RENAME=`echo ${KEYWORD} | sed 's/ /-/g'`

TRAIN_DIR=../../train/"${RENAME}"
TEST_DIR=../../test/"${RENAME}"
mkdir ${TRAIN_DIR}
mkdir ${TEST_DIR}

i=1
for a in * ; do
    if [ ${i} -le 80 ]; then
        mv -i "${a}" "${TRAIN_DIR}"/"${RENAME}_${i}.jpg"
    else
        mv -i "${a}" "${TEST_DIR}"/"${RENAME}_${i}.jpg"
    fi
    i=`expr $i + 1`
done
