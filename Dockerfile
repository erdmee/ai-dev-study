Base image: NVIDIA CUDA with PyTorch
FROM pytorch/pytorch:2.4.0-cuda12.1-cudnn9-runtime
FROM python:3.10-slim

Set working directory
WORKDIR /app

Copy project files
COPY . .

Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

Expose port for FastAPI
EXPOSE 8000

Command to run FastAPI server
CMD ["uvicorn", "app:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]