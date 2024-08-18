import socket
import cv2
import mediapipe as mp
from detect import MediapipeDetector, Model_predict
import warnings
import time
import json

count = 0
score = 0
thicc = 2
lpred = [99]
rpred = [99]
detect = MediapipeDetector()
cap = cv2.VideoCapture(0)
model = Model_predict(r"C:\Users\lap shop\Desktop\model22.h5")
model2 =Model_predict(r"C:\Users\lap shop\Desktop\model(11).h5")


# TCP server address and port
tcp_server_address = ('localhost', 12345)  # Change port as necessary

# Initialize socket
tcp_client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
    # Connect to the TCP server
    tcp_client.connect(tcp_server_address)
    print(f"Connected to TCP server at {tcp_server_address}")
except Exception as e:
    print(f"Error connecting to TCP server: {e}")
    exit(1)

# Initialize variables for FPS calculation
fps = 0
start_time = time.time()
last_time = start_time

while True:
    ret, frame = cap.read()
    if not ret:
        print("Error: Could not read frame. Exiting.")
        break

    height, width = frame.shape[:2]
    frame, landmarks = detect.detect(frame)

    if landmarks is not None:
        # Crop left eye
        Left_landmark = [193, 221, 222, 223, 224, 225, 124, 35, 31, 228, 229, 230, 231, 121, 114, 188, 122]
        eye_image = detect.crop_eye(frame, landmarks.landmark, Left_landmark)
        lpred = model.prdict(eye_image)
        #cv2.putText(frame, f"Left Eye Prediction: {int(lpred[0])}", (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2, cv2.LINE_AA)

        # Crop right eye
        Right_landmark = [285, 295, 282, 283, 276, 353, 265, 261, 448, 449, 450, 451, 452, 412, 351, 417]
        eye_image_right = detect.crop_eye(frame, landmarks.landmark, Right_landmark)
        rpred = model.prdict(eye_image_right)
        # cv2.putText(frame, f"Right Eye Prediction: {int(rpred[0])}", (10, 70), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2, cv2.LINE_AA)

        
        #crop mouth
        mouth_landmark = [61, 146, 91, 181, 84, 17, 314, 405, 321, 375, 270, 269, 267, 0, 37, 39, 40]
        mouth_image = detect.crop_mouth(frame, landmarks.landmark, mouth_landmark)
        yawn = model.prdict(mouth_image)
        # cv2.imshow('mouth',mouth_image)
        # cv2.putText(frame, f"Mouth Prediction: {yawn}", (10, 90), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2, cv2.LINE_AA)

        # Display eye states in the frame
        if lpred == 0:
            cv2.putText(frame, "Left eye :Open", (10, height - 80), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 1, cv2.LINE_AA)
        if rpred == 0:
            cv2.putText(frame, "Right eye :Open", (10, height - 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 1, cv2.LINE_AA)
        if lpred == 1:
            cv2.putText(frame, "Left eye :Closed", (10, height - 80), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 1, cv2.LINE_AA)
        if rpred == 1:
            cv2.putText(frame, "Right eye :Closed", (10, height - 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 1, cv2.LINE_AA)
        if lpred == 0 and rpred == 0:
            score -= 1
            cv2.putText(frame, "Open", (10, height - 20), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 1, cv2.LINE_AA)
        if lpred == 1 and rpred == 1:
            score += 1
            cv2.putText(frame, "Closed", (10, height - 20), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 1, cv2.LINE_AA)
        # if yawn == 1:
        #     cv2.putText(frame, "mouth:open", (10, height - 120), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 1, cv2.LINE_AA)
        # if yawn == 0:
        #     cv2.putText(frame, "mouth:close", (10, height - 120), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 1, cv2.LINE_AA)

    
        if score < 0:
            score = 0
        cv2.putText(frame, 'Score:' + str(score), (120, height - 20), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 1, cv2.LINE_AA)

        if score > 50:
            try:
                warnings.warn("Closed eye!")
            except:
                pass

        # Adjust the thickness of the rectangle based on the score
        if thicc < 25:
            thicc += 2
        else:
            thicc -= 2
        if thicc < 2:
            thicc = 2

        # Draw a rectangle around the frame to indicate drowsiness
        cv2.rectangle(frame, (0, 0), (width, height), (0, 145, 255), thicc)

        # Create JSON data
        json_data = {
            "left_eye_prediction": int(lpred[0]),
            "right_eye_prediction": int(rpred[0]),
            "mouth_detection":int(yawn[0]),
            "score": score,
            "fps": fps
        }

        # Convert JSON to string
        json_str = json.dumps(json_data)

        try:
            # Send JSON data over TCP
            tcp_client.sendall(json_str.encode())
            print("Data sent:", json_data)
        except Exception as e:
            print(f"Error sending data over TCP: {e}")
            break

    # Calculate FPS every second
    current_time = time.time()
    elapsed_time = current_time - last_time
    if elapsed_time >= 1:
        fps = count / elapsed_time
        last_time = current_time
        count = 0
    else:
        count += 1

    # Display FPS on the frame
    #cv2.putText(frame, f'FPS: {fps:.2f}', (540, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 100, 15), 2, cv2.LINE_AA)

    cv2.imshow("image", frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()

# Close TCP connection
tcp_client.close()











