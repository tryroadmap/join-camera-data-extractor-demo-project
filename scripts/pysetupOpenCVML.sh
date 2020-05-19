#Ec2 Ubuntu Instance OpenCV and Keras Lab:
#In an env setup Keras, TensorFlow, and OpenCV will be running.
virtualevn lotusx-cv-ml -p python3
source lotusx-cv-ml/bin/activate



pip install numpy
pip install --upgrade imutils
pip install --upgrade scikit-learn
pip install --upgrade matplotlib
pip install opencv-contrib-python #cv2 from pip


#CV manual compile
brew install cmake pkg-config
brew install jpeg libpng libtiff openexr
brew install eigen tbb


cd /opt/Opencv
git clone https://github.com/opencv/opencv
git clone https://github.com/opencv/opencv_contrib



cd ~/opencv
mkdir build
cd build


ls /usr/local/Cellar/python3/3.*/Frameworks/Python.framework/Versions/3.5/lib/python3.5/config-3.5m/libpython3.5.dylib
ls -d /usr/local/Cellar/python3/3.*/Frameworks/Python.framework/Versions/3.5/include/python3.5m/

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D PYTHON3_LIBRARY=YYY \
    -D PYTHON3_INCLUDE_DIR=ZZZ \
    -D PYTHON3_EXECUTABLE=$VIRTUAL_ENV/bin/python \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python3=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D BUILD_EXAMPLES=ON ..


make -j4
sudo make install
#Rename and sym-link your OpenCV 3 + Python 3.5 bindings


#ref. https://www.pyimagesearch.com/2016/12/05/macos-install-opencv-3-and-python-3-5/
