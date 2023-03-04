# cuda-trainer
It's a generic CUDA trainer machine which compatible with
    - python3
    - pip
    - miniconda3
    - pyenv
    - torch
    - scikit-learn
    - etc.

See also: https://github.com/fethigurcan/mlflow-trainer

To build
```bash
docker build . -t cuda-trainer:latest
```

To run
```bash
docker run -it cuda-trainer:latest
```

To test in container (without any GPU)
```bash
mlflow run https://github.com/mlflow/mlflow-example.git -P alpha=5.0
```

To test in container (with GPU)
```bash
mlflow run https://github.com/fethigurcan/yargitay-gputest.git
```

