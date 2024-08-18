#ifndef UDP_RECEIVER_H
#define UDP_RECEIVER_H

#include <QObject>
#include <QUdpSocket>
#include <QImage>
#include <QBuffer>
#include <QMap>

class UdpReceiver : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imageSource READ imageSource NOTIFY imageSourceChanged)

public:
    explicit UdpReceiver(QObject *parent = nullptr);
    ~UdpReceiver();

    QString imageSource() const;

signals:
    void imageSourceChanged();

private slots:
    void processPendingDatagrams();

private:
    QUdpSocket *udpSocket;
    QString m_imageSource;
    QByteArray buffer;
    QMap<int, QByteArray> fragmentBuffer;
    int expectedFrameSize;
    int numFragmentsReceived;
};

#endif // UDP_RECEIVER_H
