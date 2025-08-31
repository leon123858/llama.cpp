# my dev notes for llama.cpp

## Dev With Docker (CPU only)

```bash
# build the docker image
docker build -t llama .
# run the docker image
docker run --name llama -it llama
# run the docker image and mount a model directory
docker run --name llama -v ./models:/models -it llama
```

put model `gemma-2b.gguf` in the `./models` (for example) directory

```bash
# inside the docker container run the following command to quick start
build/bin/llama-cli -m /models/gemma-2b.gguf -p "I believe the meaning of life is" -n 128 -no-cnv
# or use the model from huggingface directly, it may cache the model in local
build/bin/llama-cli --hf-repo Leths/gpt2-Q4_K_M-GGUF --hf-file gpt2-q4_k_m.gguf -p "The meaning to life and the universe is"
# start unit test
ctest --test-dir build --output-on-failure -j8
```

build your code by `cmake --build build`
