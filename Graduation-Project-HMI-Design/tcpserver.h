
#ifndef TCPSERVER_H
#define TCPSERVER_H
#include <QTcpServer>
#include <QTcpSocket>
#include <QJsonObject>
#include <QJsonDocument>
#include <QTimer>
#include <QMap>

class Monitor; // Forward declaration of the Monitor class

class TcpServer : public QTcpServer
{
    Q_OBJECT

public:
    explicit TcpServer(QObject *parent = nullptr);
    ~TcpServer();

protected:
    void incomingConnection(qintptr socketDescriptor) override;

signals:
    void newDataReceived(const QJsonObject &jsonData); // Declare the signal

private slots:
    void socketReadyRead();
    void socketDisconnected();
    void processJsonData(const QJsonObject &jsonData);
    void updateStatus();
    void processReceivedData(const QByteArray &data);


private:
    QMap<QTcpSocket*, qintptr> clients;
    QTimer *statusUpdateTimer;
    Monitor *monitor; // Monitor object to update with received data
};

#endif // TCPSERVER_H

