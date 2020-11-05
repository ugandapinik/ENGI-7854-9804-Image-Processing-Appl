import os
import glob
import cv2
import matplotlib.pyplot as plt


# import imutils
# import numpy as np
# from imutils.object_detection import non_max_suppression


# ======================================================================================================================
# Get all images


def getImages(hastag):  # hashtag - parameter (folder name)
    image_dir = hastag
    data_path = os.path.join(image_dir, '*')  # concatenate path components from directory
    files = glob.glob(data_path)  # retrieve files with their path
    images = []

    for file in files:  # Find/check each item from file list
        images.append(file)  # add each item to images

    return images


# ======================================================================================================================
# SMILE DETECTS
def smile_detection(grayscale, original_image, x, y, w, h):
    smile_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_smile.xml')

    roi_gray = grayscale[y: y + h, x:x + w]
    roi_color = original_image[y: y + h, x:x + w]

    smiles = smile_cascade.detectMultiScale(roi_gray, scaleFactor=1.8, minNeighbors=20)

    for (sx, sy, sw, sh) in smiles:
        cv2.rectangle(roi_color, (sx, sy), ((sx + sw), (sy + sh)), (0, 255, 0), 5)


# ======================================================================================================================
# NOSE DETECTS
def nose_detection(grayscale, original_image, x, y, w, h):
    nose_cascade = cv2.CascadeClassifier('classifier/Nose.xml')

    roi_gray = grayscale[y: y + h, x:x + w]
    roi_color = original_image[y: y + h, x:x + w]

    nose = nose_cascade.detectMultiScale(roi_gray, 1.3, 5)
    if nose:
        return True
    return False

    # for (x, y, w, h) in nose:
    #     cv2.rectangle(roi_color, (x, y), (x + w, y + h), (0, 255, 0), 3)


# ======================================================================================================================
# LEFT EYE DETECTS
def left_eye_detection(grayscale, original_image, x, y, w, h):
    # eye_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_eye.xml')
    # right_eye_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_righteye_2splits.xml')
    left_eye_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_lefteye_2splits.xml')
    # eye_glass_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_eye_tree_eyeglasses.xml')

    roi_gray = grayscale[y: y + h, x:x + w]
    roi_color = original_image[y: y + h, x:x + w]

    # eyes = eye_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.3)
    # right_eyes = right_eye_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.1)
    left_eyes = left_eye_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.1)
    # eye_glass = eye_glass_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.3)

    if len(left_eyes) != 0:
        # Draw Left Eye
        for (lex, ley, lew, leh) in left_eyes:
            cv2.rectangle(original_image, (lex, ley), (lex + lew, ley + leh), (255, 0, 0), 1)

        return True
    return False


# ======================================================================================================================
# RIGHT EYE DETECTS
def right_eye_detection(grayscale, original_image, x, y, w, h):
    # eye_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_eye.xml')
    right_eye_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_righteye_2splits.xml')
    # left_eye_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_lefteye_2splits.xml')
    # eye_glass_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_eye_tree_eyeglasses.xml')

    roi_gray = grayscale[y: y + h, x:x + w]
    roi_color = original_image[y: y + h, x:x + w]

    # eyes = eye_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.3)
    right_eyes = right_eye_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.1)
    # left_eyes = left_eye_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.1)
    # eye_glass = eye_glass_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.3)

    if len(right_eyes) != 0:
        # Draw Right Eye
        for (rex, rey, rew, reh) in right_eyes:
            cv2.rectangle(original_image, (rex, rey), (rex + rew, rey + reh), (255, 0, 0), 1)
        return True
    return False


def face_feature(face_cascade, grayscale, original_image):
    for (x, y, w, h) in face_cascade:
        print(face_cascade)
        if len(face_cascade) != 0:
            # Todo check if left or right eye exists
            if left_eye_detection(grayscale, original_image, x, y, w, h) or right_eye_detection(grayscale,
                                                                                                original_image, x, y, w,
                                                                                                h):
                face_feature_exists = True

            # Todo check if nose exists

            # Todo check if smile exists
            # smile_detection(grayscale, original_image, x, y, w, h)

            # Todo draw the rectangle
            if face_feature_exists:
                cv2.rectangle(original_image, (x, y), (x + w, y + h), (0, 255, 0), 2)

                # Todo Save the file


def face_detection(grayscale, original_image, counter):
    # front face detection

    face_cascade_default = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_frontalface_default.xml')
    face_cascade_alt = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_frontalface_alt.xml')
    face_cascade_alt2 = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_frontalface_alt2.xml')
    face_cascade_alt_tree = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_frontalface_alt_tree.xml')

    faces_default = face_cascade_default.detectMultiScale(grayscale, minNeighbors=6, scaleFactor=1.1)
    faces_alt = face_cascade_alt.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.1)
    faces_alt2 = face_cascade_alt2.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.03)
    faces_alt_tree = face_cascade_alt_tree.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.1)

    if len(faces_default) != 0:
        face_feature(faces_default, grayscale, original_image)
    elif len(faces_alt) != 0:
        face_feature(faces_alt, grayscale, original_image)
    elif len(faces_alt2) != 0:
        face_feature(faces_alt2, grayscale, original_image)
    elif len(faces_alt_tree) != 0:
        face_feature(faces_alt_tree, grayscale, original_image)

    # for x, y, w, h in faces_alt:
    #     cv2.rectangle(original_image, (x, y), (x + w, y + h), (0, 255, 0), 2)
    #
    # for x, y, w, h in faces_alt2:
    #     cv2.rectangle(original_image, (x, y), (x + w, y + h), (0, 255, 0), 2)
    #
    # for x, y, w, h in faces_alt_tree:
    #     cv2.rectangle(original_image, (x, y), (x + w, y + h), (0, 255, 0), 2)

    # ------------------------------------------------------------------------------------------------------------------

    # Side face detection

    # side_face_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_profileface.xml')
    # # gray = cv2.flip(grayscale, 1)
    # side_face = side_face_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.1)

    # for (x, y, w, h) in side_face:
    #     cv2.rectangle(original_image, (x, y), (x + w, y + h), (0, 255, 0), 4)

    # ------------------------------------------------------------------------------------------------------------------
    # Smile detection

    # smile_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_smile.xml')
    #
    # roi_gray = grayscale[y: y + h, x:x + w]
    # roi_color = original_image[y: y + h, x:x + w]
    #
    # smiles = smile_cascade.detectMultiScale(roi_gray, scaleFactor=1.8, minNeighbors=20)
    #
    # for (sx, sy, sw, sh) in smiles:
    #     cv2.rectangle(roi_color, (sx, sy), ((sx + sw), (sy + sh)), (0, 255, 0), 5)

    # ------------------------------------------------------------------------------------------------------------------

    # Nose detection

    # nose_cascade = cv2.CascadeClassifier('classifier/Nose.xml')

    # # roi_gray = grayscale[y: y + h, x:x + w]
    # # roi_color = original_image[y: y + h, x:x + w]

    # nose = nose_cascade.detectMultiScale(roi_gray, 1.3, 5)

    # for (x, y, w, h) in nose:
    #     cv2.rectangle(roi_color, (x, y), (x + w, y + h), (0, 255, 0), 3)

    # ------------------------------------------------------------------------------------------------------------------

    # eye detection

    # eye_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_eye.xml')
    # right_eye_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_righteye_2splits.xml')
    # left_eye_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_lefteye_2splits.xml')
    # eye_glass_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_eye_tree_eyeglasses.xml')

    # # roi_gray = grayscale[y: y + h, x:x + w]
    # # roi_color = original_image[y: y + h, x:x + w]

    # eyes = eye_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.3)
    # right_eyes = right_eye_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.1)
    # left_eyes = left_eye_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.1)
    # eye_glass = eye_glass_cascade.detectMultiScale(grayscale, minNeighbors=5, scaleFactor=1.3)

    # for (ex, ey, ew, eh) in eyes:
    #     cv2.rectangle(original_image, (ex, ey), (ex + ew, ey + eh), (255, 0, 0), 1)

    # for (rex, rey, rew, reh) in right_eyes:
    #     cv2.rectangle(original_image, (rex, rey), (rex + rew, rey + reh), (255, 0, 0), 1)

    # for (lex, ley, lew, leh) in left_eyes:
    #     cv2.rectangle(original_image, (lex, ley), (lex + lew, ley + leh), (255, 0, 0), 1)

    # for egx, egy, egw, egh in eye_glass:
    #     cv2.rectangle(original_image, (egx, egy), (egx + egw, egy + egh), (255, 0, 0), 1)

    # ------------------------------------------------------------------------------------------------------------------

    # ear detection

    # left_ear_cascade = cv2.CascadeClassifier('classifier/haarcascades/leftear.xml')
    # right_ear_cascade = cv2.CascadeClassifier('classifier/haarcascades/rightear.xml')

    # # roi_gray = grayscale[y: y + h, x:x + w]
    # # roi_color = original_image[y: y + h, x:x + w]

    # left_ear = left_ear_cascade.detectMultiScale(grayscale, 1.8, 20)
    # right_ear = right_ear_cascade.detectMultiScale(grayscale, 1.8, 20)

    # for (x, y, w, h) in left_ear:
    #     cv2.rectangle(original_image, (x, y), (x + w, y + h), (0, 0, 255), 4)

    # for (x, y, w, h) in right_ear:
    #     cv2.rectangle(original_image, (x, y), (x + w, y + h), (0, 0, 255), 4)

    # ------------------------------------------------------------------------------------------------------------------

    # full body detection (using HOG Descriptor)

    # hog = cv2.HOGDescriptor()
    # hog.setSVMDetector(cv2.HOGDescriptor_getDefaultPeopleDetector())
    #
    # full_body = imutils.resize(grayscale, width=min(600, grayscale.shape[1]))
    #
    # (body, weights) = hog.detectMultiScale(full_body, winStride=(8, 8), padding=(32, 32), scale=1.05)
    #
    # for (x, y, w, h) in body:
    #     cv2.rectangle(original_image, (x, y), (x + w, y + h), (0, 0, 255), 2)

    # body = np.array([[x, y, x + w, y + h] for (x, y, w, h) in body])
    # pick = non_max_suppression(body, probs=None, overlapThresh=0.65)

    # for (xA, yA, xB, yB) in pick:
    #     cv2.rectangle(original_image, (xA, yA), (xB, yB), (0, 255, 0), 2)

    # full body detection (using Haar Cascade)

    #     body_cascade = cv2.CascadeClassifier('classifier/haarcascades/haarcascade_fullbody.xml')
    #     body = body_cascade.detectMultiScale(grayscale, 1.1, 3)
    #     for (x, y, w, h) in body:
    #      cv2.rectangle(original_image, (x, y), (x + w, y + h), (0, 255, 0), 2)

    # ======================================================================================================================
    # saving detected face image with unique name

    if len(faces_default) >= 1:
        pass
        cv2.imwrite("C:/Users/Tanjim/PycharmProjects/Data_Colletion/face/photo_" + str(counter) + ".jpg", image)

    # else:
    #     pass

    return original_image


# ======================================================================================================================
# Main function starts here


if __name__ == '__main__':

    # Fetching photos with Hashtag
    hashtag = "sample"  # Name of the hashtag
    imageList = getImages(hashtag)  # get all the hashtag images into array/list
    counter = 0

    # Read each image from image list
    for image in imageList:
        image = cv2.imread(image)

        # Check if Gray or RGB image
        if len(image.shape) < 3:

            gray_image = image
            # gray_image = cv2.bilateralFilter(image, 5, 1, 1)  # Applying filter to remove noise

        else:
            gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)  # Converting to gray scale
            # gray_image = cv2.bilateralFilter(gray_image, 5, 1, 1)  # Applying filter to remove noise

        # saving detected face image with unique name
        detected_face = face_detection(gray_image, image, counter)
        counter = counter + 1

        # Convert and display the detected grayscale image to RGB
        plt.imshow(cv2.cvtColor(detected_face, cv2.COLOR_BGR2RGB))
        plt.title("Face Detector")
        plt.show()
