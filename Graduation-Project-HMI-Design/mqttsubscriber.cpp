#include "MqttSubscriber.h"
#include <QDebug>

MqttSubscriber::MqttSubscriber(QObject *parent) : QObject(parent), m_client(new QMqttClient(this))
{
    connect(m_client, &QMqttClient::messageReceived, this, &MqttSubscriber::onMessageReceived);
}

void MqttSubscriber::connectToBroker(const QString &host, int port, const QString &topic)
{
    m_client->setHostname(host);
    m_client->setPort(port);
    m_client->connectToHost();

    connect(m_client, &QMqttClient::connected, this, [this, topic]() {
        m_subscription = m_client->subscribe(topic, 0);
        if (!m_subscription)
            qWarning() << "Could not subscribe. Is there a valid connection?";
    });
}

void MqttSubscriber::onMessageReceived(const QByteArray &message, const QMqttTopicName &topic)
{
    Q_UNUSED(topic)

    QJsonDocument jsonDoc = QJsonDocument::fromJson(message);
    if (!jsonDoc.isNull() && jsonDoc.isObject()) {
        QJsonObject jsonData = jsonDoc.object();
        emit dataReceived(jsonData);

        // Emit specific signals for each data point
        QString leftEyeState = jsonData["left_eye_prediction"].toInt() == 0 ? "open" : "closed";
        QString rightEyeState = jsonData["right_eye_prediction"].toInt() == 0 ? "open" : "closed";
        int score = jsonData["score"].toInt();

        emit leftEyeStateChanged(leftEyeState);
        emit rightEyeStateChanged(rightEyeState);
        emit scoreChanged(score);
    } else {
        qWarning() << "Invalid JSON message received";
    }
}
