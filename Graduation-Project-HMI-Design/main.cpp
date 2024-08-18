#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QTimer>
#include "Monitor.h"
#include "TcpServer.h"
// #include "imageclient.h"
#include "udp_receiver.h"
int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);




    QQmlApplicationEngine engine;
    Monitor monitor;
    TcpServer tcpServer;
    UdpReceiver receiver;
    engine.rootContext()->setContextProperty("udpReceiver", &receiver);
    engine.rootContext()->setContextProperty("monitor", &monitor);

    QObject::connect(&tcpServer, &TcpServer::newDataReceived, &monitor, &Monitor::updateFromJson);
    if (!tcpServer.listen(QHostAddress::Any, 12345)) {
        qDebug() << "Failed to start server:" << tcpServer.errorString();
        return -1;
    }

    qDebug() << "Server listening on port 12345";
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;



    return app.exec();
}









