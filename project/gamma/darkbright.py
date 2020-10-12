import numpy as np
import cv2
import matplotlib.pyplot as plt

test_image = cv2.imread("testing/baby.jpg", cv2.IMREAD_COLOR)
print(test_image)
# norm_img1 = cv2.normalize(test_image, None, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_32F)
#
# norm_img1 = (255*norm_img1).astype(np.uint8)
# cv2.imwrite("zelda1_bm20_cm20_normalize1.jpg",norm_img1)
# cv2.imshow('normalized1',norm_img1)

#
# cv2.waitKey(0)
# cv2.destroyAllWindows()


# cverting to grayscale
test_image_gray = cv2.cvtColor(test_image, cv2.COLOR_BGR2GRAY)



print(test_image.shape)

def img_estim(img, threshold):
    print("Mean: ", np.mean(img))
    is_light = np.mean(img) > threshold

    # check if dark then do the contrast stetching
    if not is_light:
        pass

    return 'light' if is_light else 'dark'

print("Image Condition: ", img_estim(test_image_gray, 127))