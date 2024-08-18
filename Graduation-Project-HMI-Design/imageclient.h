// #ifndef IMAGECLIENT_H
// #define IMAGECLIENT_H

// #include <QObject>
// #include <QTcpSocket>

// class ImageClient : public QObject
// {
//     Q_OBJECT
// public:
//     explicit ImageClient(QObject *parent = nullptr);
//     Q_INVOKABLE void startTcpClient();


// signals:
//     void imageReceived(const QString &imagePath);

// private slots:
//     void onReadyRead();
//     void onError(QAbstractSocket::SocketError socketError);
//     void reconnect();

// private:
//     QTcpSocket *tcpSocket;
//     QByteArray imageBuffer;
//     int imageSize;
//     bool expectingImageSize;

//     void processImageData();
// };

// #endif // IMAGECLIENT_H






// #ifndef IMAGECLIENT_H
// #define IMAGECLIENT_H

// #include <QObject>
// #include <QTcpSocket>

// class ImageClient : public QObject
// {
//     Q_OBJECT
// public:
//     explicit ImageClient(QObject *parent = nullptr);
//     Q_INVOKABLE void startTcpClient();

// signals:
//     void imageReceived(const QString &imagePath);
//     void jsonReceived(const QString &jsonString);

// private slots:
//     void onReadyRead();
//     void onError(QAbstractSocket::SocketError socketError);
//     void reconnect();

// private:
//     QTcpSocket *tcpSocket;
//     QByteArray imageBuffer;
//     QByteArray jsonBuffer;
//     int imageSize;
//     int jsonSize;
//     bool expectingImageSize;
//     bool expectingJsonSize;
//     bool receivingImage;

//     void processImageData();
//     void processJsonData();
// };

// #endif // IMAGECLIENT_H
