#!/usr/bin/env bash
PY_DIR='build/python/lib/python3.6/site-packages'
rm -rf $PY_DIR && mkdir -p $PY_DIR
docker run --rm -v $(pwd):/foo -w /foo lambci/lambda:build-python3.6 \
    pip install -r requirements.txt --no-deps -t $PY_DIR
cd build
zip -r ../lambda_layer.zip .
cd ..
rm -r build
