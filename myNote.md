# my dev notes for llama.cpp

## Dev With Docker (CPU only)

```bash
# build the docker image
docker build -t llama .
# run the docker image
docker run --name llama -it llama
# run the docker image and mount a model directory
docker run --name llama -v C:\\Users\\a0970\\Desktop\\models:/models -it llama
```

put model `gemma-2b.gguf` in the `C:\Users\a0970\Desktop\models` (for example) directory

```bash
# inside the docker container run the following command to test
build/bin/llama-cli -m /models/gemma-2b.gguf -p "I believe the meaning of life is" -n 128 -no-cnv
```
