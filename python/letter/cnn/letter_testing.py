import cv2
from cvzone.HandTrackingModule import HandDetector
import numpy as np
import math
from cvzone.ClassificationModule import Classifier
from tensorflow import keras



cap = cv2.VideoCapture(0)
detector = HandDetector(maxHands=1)


classifier = keras.models.load_model("CNN/model_255.h5")
labels = ["ain","al","aleff","bb","dal","dha","dhad","fa","gaaf","ghain","ha","haa","jeem","kaaf","khaa",
          "la","laam","meem","nun","ra","saad","seen","sheen","ta","taa","thaa","thal","toot","waw","ya","yaa","zay"]




offset = 25
imgSize = 300
   
while True:
    success, img = cap.read()
    i = img.copy()
    imgOutput = img.copy()
    hands, img = detector.findHands(img)
    
    try:
        if hands:
            hand = hands[0]
            x, y, w, h = hand['bbox']
           
 
            imgWhite = np.ones((imgSize, imgSize, 3), np.uint8) * 255
            
            imgCrop = i[y - offset:y + h + offset, x - offset:x + w + offset]

            imgCropShape = imgCrop.shape
            
            aspectRatio = h / w
            
            if aspectRatio > 1:
               k = imgSize / h
               wCal = math.ceil(k * w)
               imgResize = cv2.resize(imgCrop, (wCal, imgSize))
               imgResizeShape = imgResize.shape
               wGap = math.ceil((imgSize - wCal) / 2)
               imgWhite[:, wGap:wCal + wGap] = imgResize
               img_gray = imgWhite.copy()
               img_gray = cv2.cvtColor(img_gray, cv2.COLOR_BGR2GRAY)
               img_gray = cv2.resize(img_gray, (64,64))
               i = img_gray.reshape(1,64,64,1)
               prediction = classifier.predict(i)
               index = prediction.argmax(axis=-1)
               print("------------------------------------------------")
               print(labels[index[0]])

            
            else:
                k = imgSize / w
                hCal = math.ceil(k * h)
                imgResize = cv2.resize(imgCrop, (imgSize, hCal))
                imgResizeShape = imgResize.shape
                hGap = math.ceil((imgSize - hCal) / 2)
                imgWhite[hGap:hCal + hGap, :] = imgResize
                img_gray = imgWhite.copy()
                img_gray = cv2.cvtColor(img_gray, cv2.COLOR_BGR2GRAY)
                img_gray = cv2.resize(img_gray, (64,64))
                i = img_gray.reshape(1,64,64,1)
                prediction = classifier.predict(i)
                index = prediction.argmax(axis=-1)
                print("------------------------------------------------")
                print(labels[index[0]])


            cv2.rectangle(imgOutput, (x - offset, y - offset-50),(x - offset+90, y - offset-50+50), (255, 0, 255), cv2.FILLED)
            cv2.putText(imgOutput, labels[index[0]], (x, y -26), cv2.FONT_HERSHEY_COMPLEX, 1.7, (255, 255, 255), 2)
            cv2.rectangle(imgOutput, (x-offset, y-offset),(x + w+offset, y + h+offset), (255, 0, 255), 4)

            cv2.imshow("Cropp", imgCrop)
            cv2.imshow("imgWhite", imgWhite)
    
    except Exception as e:
        print(str(e))
        pass

    cv2.imshow("Image", imgOutput)
    key = cv2.waitKey(1)
    if key == ord("a"): 
        cap.release()
        cv2.destroyAllWindows()
        
