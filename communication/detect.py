import cv2
import mediapipe as mp
import numpy as np 
import warnings
from keras.models import load_model
class MediapipeDetector():
    def __init__(self):    
        self.mp_drawing = mp.solutions.drawing_utils
        self.mp_face_mesh = mp.solutions.face_mesh
        self.face_mesh = self.mp_face_mesh.FaceMesh(static_image_mode=False,max_num_faces=1,min_detection_confidence=0.5,min_tracking_confidence=0.5 )
        
    def detect(self, img, visualise=False):
        img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        results = self.face_mesh.process(img_rgb)
        
        if results.multi_face_landmarks:
            detected_face = results.multi_face_landmarks[0]
            if visualise:
                img = self.visualise(img, detected_face)
            return img, detected_face
        else:
            warnings.warn('No face detected !!')
            return img, None, 

    def crop_mouth(self, img, landmarks, mouth_landmarks=[]):
        image_height, image_width, _ = img.shape
        mouth_points = [(int(landmarks[landmark_index].x * image_width), int(landmarks[landmark_index].y * image_height)) for landmark_index in mouth_landmarks]
        
        # Calculate bounding box around the mouth points
        x_min = min([point[0] for point in mouth_points])
        x_max = max([point[0] for point in mouth_points])
        y_min = min([point[1] for point in mouth_points])
        y_max = max([point[1] for point in mouth_points])

        # Crop the region around the mouth
        mouth_image = img[y_min:y_max, x_min:x_max]

        return mouth_image
        

    def crop_eye(self, img, landmarks, eye_landmark=[]):
        image_height, image_width, _ = img.shape
        eye_landmarks = []
    
        for landmark_index in eye_landmark:
          eye_landmarks.append(landmarks[landmark_index])
        
        eye_points = [(int(landmark.x * image_width), int(landmark.y * image_height)) for landmark in eye_landmarks] #conv landmark to pixels
         
        # bounding box 
        x_min = min([point[0] for point in eye_points])
        x_max = max([point[0] for point in eye_points])
        y_min = min([point[1] for point in eye_points])
        y_max = max([point[1] for point in eye_points])

 
        
        eye_image = img[y_min:y_max, x_min:x_max] #crop region
        return eye_image
class Model_predict:
    def __init__(self,model_path):
        self.model=load_model(model_path)
    def prdict(self,roi_eye):
        roi_eye=cv2.cvtColor(roi_eye,cv2.COLOR_BGR2RGB)
        roi_eye=cv2.resize(roi_eye,(128,128))
        roi_eye=roi_eye.reshape((-1,128,128,3))
        return np.argmax(self.model.predict(roi_eye),axis=-1)

