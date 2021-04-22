FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel
WORKDIR /tf/

RUN apt-get update && apt-get install -y git ffmpeg libsm6 libxext6 libxrender-dev libglib2.0-0
RUN apt-get install -y libsndfile1
COPY requirements.txt requirements.txt
RUN pip install --upgrade cython
RUN pip install -r requirements.txt
RUN pip uninstall torch torchvision torchaudio
RUN pip install torch==1.8.0+cu111 torchvision==0.9.0+cu111 torchaudio==0.8.0 -f https://download.pytorch.org/whl/torch_stable.html
COPY . /tf/

RUN cd /tf/cpp_wrappers && sh compile_wrappers.sh

# run jupyter
RUN pip install jupyter
CMD ["jupyter", "notebook", "--port=8889", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
