import torch
from torchvision import models, transforms
from PIL import Image
import argparse

LABELS_URL = "https://raw.githubusercontent.com/pytorch/hub/master/imagenet_classes.txt"

def load_labels():
    import requests
    labels = requests.get(LABELS_URL).text.strip().split("\n")
    return labels

def classify_image(image_path):
    model = models.resnet18(weights=models.ResNet18_Weights.IMAGENET1K_V1)
    model.eval()
    preprocess = transforms.Compose([
        transforms.Resize(256),
        transforms.CenterCrop(224),
        transforms.ToTensor(),
        transforms.Normalize(
            mean=[0.485, 0.456, 0.406],
            std=[0.229, 0.224, 0.225])
    ])

    img = Image.open(image_path).convert("RGB")
    img_tensor = preprocess(img).unsqueeze(0)

    with torch.no_grad():
        outputs = model(img_tensor)
        _, predicted = outputs.max(1)

    labels = load_labels()
    return labels[predicted.item()]

def main():
    parser = argparse.ArgumentParser(description="Image classifier tool")
    parser.add_argument("image", help="Path to the image")
    args = parser.parse_args()

    label = classify_image(args.image)
    print(f"This looks like: {label}")

if __name__ == "__main__":
    main()

