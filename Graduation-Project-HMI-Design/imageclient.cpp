
// #include "imageclient.h"
// #include <QFile>
// #include <QDebug>
// #include <QDir>
// #include <QUrl>
// #include <QtEndian>
// #include <QHostAddress>

// ImageClient::ImageClient(QObject *parent) : QObject(parent), tcpSocket(nullptr), imageSize(0), expectingImageSize(true)
// {
// }

// void ImageClient::startTcpClient()
// {
//     if (!tcpSocket) {
//         tcpSocket = new QTcpSocket(this);

//         connect(tcpSocket, &QTcpSocket::readyRead, this, &ImageClient::onReadyRead);
//         connect(tcpSocket, static_cast<void (QTcpSocket::*)(QAbstractSocket::SocketError)>(&QTcpSocket::error),
//                 this, &ImageClient::onError);

//         tcpSocket->connectToHost(QHostAddress("localhost"), 12345);  // Replace with actual server IP and port
//     } else {
//         qDebug() << "TCP socket already connected.";
//     }
// }

// void ImageClient::onReadyRead()
// {
//     while (tcpSocket->bytesAvailable() > 0) {
//         if (expectingImageSize && tcpSocket->bytesAvailable() >= sizeof(quint32)) {
//             QByteArray sizeData = tcpSocket->read(sizeof(quint32));
//             imageSize = qFromBigEndian<quint32>(reinterpret_cast<const uchar*>(sizeData.constData()));
//             expectingImageSize = false;
//             imageBuffer.clear();  // Clear the buffer to store new image data
//         }

//         if (!expectingImageSize) {
//             int bytesToRead = imageSize - imageBuffer.size();
//             if (bytesToRead > 0) {
//                 imageBuffer.append(tcpSocket->read(bytesToRead));
//             }

//             if (imageBuffer.size() == imageSize) {
//                 processImageData();
//                 expectingImageSize = true;
//                 imageSize = 0;
//                 imageBuffer.clear();
//             }
//         }
//     }
// }

// void ImageClient::onError(QAbstractSocket::SocketError socketError)
// {
//     qDebug() << "Socket error:" << socketError;
//     if (socketError == QAbstractSocket::RemoteHostClosedError) {
//         reconnect();
//     }
// }

// void ImageClient::reconnect()
// {
//     qDebug() << "Attempting to reconnect...";
//     tcpSocket->abort();
//     tcpSocket->connectToHost(QHostAddress("localhost"), 12345); // Replace with actual server IP and port
// }

// void ImageClient::processImageData()
// {
//     static int imageCount = 0;
//     QString imagePath = QDir::temp().absoluteFilePath(QString("received_image_%1.jpg").arg(imageCount++));
//     QFile file(imagePath);
//     if (file.open(QIODevice::WriteOnly)) {
//         file.write(imageBuffer);
//         file.close();
//         emit imageReceived(QUrl::fromLocalFile(imagePath).toString());  // Emit the image path as a QML-compatible URL
//     } else {
//         qDebug() << "Failed to save image:" << file.errorString();
//     }
// }



// #include "imageclient.h"
// #include <QFile>
// #include <QDebug>
// #include <QDir>
// #include <QUrl>
// #include <QtEndian>
// #include <QHostAddress>

// ImageClient::ImageClient(QObject *parent)
//     : QObject(parent), tcpSocket(nullptr), imageSize(0), jsonSize(0),
//     expectingImageSize(true), expectingJsonSize(false), receivingImage(false)
// {
// }

// void ImageClient::startTcpClient()
// {
//     if (!tcpSocket) {
//         tcpSocket = new QTcpSocket(this);

//         connect(tcpSocket, &QTcpSocket::readyRead, this, &ImageClient::onReadyRead);
//         connect(tcpSocket, static_cast<void (QTcpSocket::*)(QAbstractSocket::SocketError)>(&QTcpSocket::error),
//                 this, &ImageClient::onError);

//         tcpSocket->connectToHost(QHostAddress("localhost"), 12345);  // Replace with actual server IP and port
//     } else {
//         qDebug() << "TCP socket already connected.";
//     }
// }

// void ImageClient::onReadyRead()
// {
//     while (tcpSocket->bytesAvailable() > 0) {
//         if (expectingImageSize && tcpSocket->bytesAvailable() >= sizeof(quint32)) {
//             QByteArray sizeData = tcpSocket->read(sizeof(quint32));
//             imageSize = qFromBigEndian<quint32>(reinterpret_cast<const uchar*>(sizeData.constData()));
//             qDebug() << "Image size received:" << imageSize;
//             expectingImageSize = false;
//             receivingImage = true;
//             imageBuffer.clear();  // Clear the buffer to store new image data
//         }

//         if (receivingImage && !expectingImageSize) {
//             int bytesToRead = imageSize - imageBuffer.size();
//             if (bytesToRead > 0) {
//                 imageBuffer.append(tcpSocket->read(bytesToRead));
//             }

//             if (imageBuffer.size() == imageSize) {
//                 qDebug() << "Full image data received.";
//                 processImageData();
//                 expectingJsonSize = true;
//                 receivingImage = false;
//             }
//         }

//         if (expectingJsonSize && tcpSocket->bytesAvailable() >= sizeof(quint32)) {
//             QByteArray sizeData = tcpSocket->read(sizeof(quint32));
//             jsonSize = qFromBigEndian<quint32>(reinterpret_cast<const uchar*>(sizeData.constData()));
//             qDebug() << "JSON size received:" << jsonSize;
//             expectingJsonSize = false;
//             jsonBuffer.clear();  // Clear the buffer to store new JSON data
//         }

//         if (!expectingJsonSize) {
//             int bytesToRead = jsonSize - jsonBuffer.size();
//             if (bytesToRead > 0) {
//                 jsonBuffer.append(tcpSocket->read(bytesToRead));
//             }

//             if (jsonBuffer.size() == jsonSize) {
//                 qDebug() << "Full JSON data received.";
//                 processJsonData();
//                 expectingImageSize = true;
//                 jsonSize = 0;
//                 jsonBuffer.clear();
//             }
//         }
//     }
// }

// void ImageClient::onError(QAbstractSocket::SocketError socketError)
// {
//     qDebug() << "Socket error:" << socketError;
//     if (socketError == QAbstractSocket::RemoteHostClosedError) {
//         reconnect();
//     }
// }

// void ImageClient::reconnect()
// {
//     qDebug() << "Attempting to reconnect...";
//     tcpSocket->abort();
//     tcpSocket->connectToHost(QHostAddress("localhost"), 12345); // Replace with actual server IP and port
// }

// void ImageClient::processImageData()
// {
//     static int imageCount = 0;
//     QString imagePath = QDir::temp().absoluteFilePath(QString("received_image_%1.jpg").arg(imageCount++));
//     QFile file(imagePath);
//     if (file.open(QIODevice::WriteOnly)) {
//         file.write(imageBuffer);
//         file.close();
//         emit imageReceived(QUrl::fromLocalFile(imagePath).toString());  // Emit the image path as a QML-compatible URL
//     } else {
//         qDebug() << "Failed to save image:" << file.errorString();
//     }
// }

// void ImageClient::processJsonData()
// {
//     QString jsonString = QString::fromUtf8(jsonBuffer);
//     emit jsonReceived(jsonString);  // Emit the JSON string
// }
