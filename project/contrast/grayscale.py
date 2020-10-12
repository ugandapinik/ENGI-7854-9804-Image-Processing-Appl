import numpy as np
import cv2
import matplotlib.pyplot as plt


test_image = cv2.imread("108988848_327835628376749_8576200229858299702_n.jpg", cv2.IMREAD_COLOR)
test_image_gray = cv2.cvtColor(test_image, cv2.COLOR_BGR2GRAY)

blur = cv2.blur(test_image_gray, (5, 5))  # With kernel size depending upon image size
print(cv2.mean(blur)[0])
if cv2.mean(blur)[0] > 127:
    # The range for a pixel's value in grayscale is (0-255), 127 lies midway
    print("light") # (127 - 255) denotes light image
else:
    print("dark") # (0 - 127) denotes dark image