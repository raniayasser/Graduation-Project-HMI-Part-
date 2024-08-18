

## Overview
Welcome to the repository for my graduation project, focusing on the Human-Machine Interface (HMI) and communication protocols between Python ML models and a Qt application. 
This project demonstrates my role in designing and implementing a sophisticated driver monitoring system.

## Project Components
##### HMI Application
The HMI application serves as the core user interface for monitoring drivers. It is built with QML for the frontend and C++ for the backend, integrating dynamic data with real-time feedback from machine learning models. 
The application consists of the following five pages:
Main Page: Features a sidebar with shortcuts to all pages, dynamic data, and a clock.
Debug Mode Page: Displays detailed driver monitoring data and a live camera feed, sourced from the ML models via communication servers.
GPS Page: Shows the dynamic location of the driver’s car.
Calling Page: Allows the driver to make calls to contacts.
Music Page: Provides music control features.


### Communication Protocols
TCP Server: Handles the transfer of JSON data from Python ML models to the Qt application, enabling real-time data display within the application.
UDP Server: Manages the streaming of image frames from Python ML models to the Qt app, displaying them as a live video feed.


### Alerts System
The application includes two types of alerts to ensure driver safety:
Low Alert: Activated when signs of drowsiness are detected (e.g., frequent eye-closing or yawning). This alert is visible for 5 seconds and requires no manual intervention.
High Alert: Triggered when the driver is detected as being asleep or with eyes closed for more than 10 seconds. This alert remains active until manually closed.


### Technologies Used
UI/UX Design: Created using Figma.
Frontend: Implemented with QML.
Backend: Developed with C++.
Communication: TCP and UDP servers for data and image streaming.
Machine Learning: Python models for driver monitoring and alert generation.



