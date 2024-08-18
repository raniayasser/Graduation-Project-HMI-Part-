#ifndef MQTTSUBSCRIBER_H
#define MQTTSUBSCRIBER_H

#include <QObject>
#include <QMqttClient>
#include <QMqttSubscription>
#include <QJsonDocument>
#include <QJsonObject>

class MqttSubscriber : public QObject
{
    Q_OBJECT
public:
    explicit MqttSubscriber(QObject *parent = nullptr);
    void connectToBroker(const QString &host, int port, const QString &topic);

signals:
    void dataReceived(const QJsonObject &jsonData);
    void leftEyeStateChanged(const QString &state);
    void rightEyeStateChanged(const QString &state);
    void scoreChanged(int score);

private slots:
    void onMessageReceived(const QByteArray &message, const QMqttTopicName &topic);

private:
    QMqttClient *m_client;
    QMqttSubscription *m_subscription;
};

#endif // MQTTSUBSCRIBER_H
