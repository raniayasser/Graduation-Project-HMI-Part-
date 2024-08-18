
#include "TcpServer.h"
#include "Monitor.h" // Include the Monitor class header
#include <QDebug>

TcpServer::TcpServer(QObject *parent) : QTcpServer(parent), monitor(new Monitor(this)) // Initialize monitor
{
    // Connect signals and slots for handling incoming connections
    connect(this, &TcpServer::newDataReceived, this, &TcpServer::processJsonData);

    // Monitoring: Initialize timer for periodic status update
    statusUpdateTimer = new QTimer(this);
    connect(statusUpdateTimer, &QTimer::timeout, this, &TcpServer::updateStatus);
    statusUpdateTimer->start(5000); // Update status every 5 seconds
}

TcpServer::~TcpServer()
{
    // Clean up any resources if needed
    if (statusUpdateTimer) {
        statusUpdateTimer->stop();
        delete statusUpdateTimer;
    }
}

void TcpServer::incomingConnection(qintptr socketDescriptor)
{
    // Create a new socket for the incoming connection
    QTcpSocket *clientSocket = new QTcpSocket(this);

    // Set the socket descriptor
    if (!clientSocket->setSocketDescriptor(socketDescriptor)) {
        qDebug() << "Error setting socket descriptor:" << clientSocket->errorString();
        return;
    }

    // Add client socket to map for tracking
    clients.insert(clientSocket, socketDescriptor);

    // Connect readyRead and disconnected signals
    connect(clientSocket, &QTcpSocket::readyRead, this, &TcpServer::socketReadyRead);
    connect(clientSocket, &QTcpSocket::disconnected, this, &TcpServer::socketDisconnected);

    qDebug() << "New connection from:" << clientSocket->peerAddress().toString();
}

void TcpServer::socketReadyRead()
{
    QTcpSocket *clientSocket = qobject_cast<QTcpSocket*>(sender());
    if (!clientSocket)
        return;

    // Read all data from the socket
    QByteArray data = clientSocket->readAll();

    // Process received data
    processReceivedData(data);

    // Emit signal with received JSON data
    emit newDataReceived(QJsonDocument::fromJson(data).object());

    // Monitoring: Log received data size
    qDebug() << "Received data size:" << data.size();
}

void TcpServer::socketDisconnected()
{
    QTcpSocket *clientSocket = qobject_cast<QTcpSocket*>(sender());
    if (!clientSocket)
        return;

    qDebug() << "Client disconnected:" << clientSocket->peerAddress().toString();

    // Remove client socket from map and clean up
    clients.remove(clientSocket);
    clientSocket->deleteLater();
}

void TcpServer::processJsonData(const QJsonObject &jsonData)
{
    // Process the received JSON data
    qDebug() << "Received JSON data:" << QJsonDocument(jsonData).toJson(QJsonDocument::Indented);

    // Implement your logic to handle the received JSON data here
}

void TcpServer::processReceivedData(const QByteArray &data)
{
    QJsonDocument doc = QJsonDocument::fromJson(data);
    if (doc.isObject()) {
        QJsonObject obj = doc.object();
        int leftEyePrediction = obj["left_eye_prediction"].toInt();
        int rightEyePrediction = obj["right_eye_prediction"].toInt();
         int mouthDetection = obj["mouth_detection"].toInt();
        int score = obj["score"].toInt();

        monitor->setLeftEye(leftEyePrediction == 0 ? "open" : "closed");
        monitor->setRightEye(rightEyePrediction == 0 ? "open" : "closed");
        monitor->setMouthState(mouthDetection == 1 ? "open" : "closed");
        monitor->setDrowsyLevel(score);

    } else {
        qDebug() << "Invalid JSON received";
    }
}

void TcpServer::updateStatus()
{
    // Monitoring: Log the current status of the server
    qDebug() << "Current number of connected clients:" << clients.size();

    // Additional status updates can be added here
}






