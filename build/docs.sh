#!/bin/bash
base=/home/vagrant/PHP/laraveldoc

# Cleanup Before
rm -rf ${base}/resources/docs

docs=${base}/resources/docs
build=${docs}/build

# Run API Docs
git clone https://github.com/LewMar/docs.git ${build}/docs

for version in 4.2 5.0 5.1 5.2 5.3 5.4 5.5 5.5-pl 5.6-pl master;
do
cp -r ${build}/docs ${docs}/${version}
cd ${docs}/${version} && git checkout $version
done

# Cleanup After
rm -rf ${docs}/build

cd $base && php artisan docs:clear-cache
