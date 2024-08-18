

#ifndef MONITOR_H
#define MONITOR_H

#include <QObject>
#include <QString>
#include <QJsonObject>
#include <QTimer>

class Monitor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int drowsyLevel READ drowsyLevel WRITE setDrowsyLevel NOTIFY drowsyLevelChanged)
    Q_PROPERTY(QString leftEye READ leftEye WRITE setLeftEye NOTIFY leftEyeChanged)
    Q_PROPERTY(QString rightEye READ rightEye WRITE setRightEye NOTIFY rightEyeChanged)
    Q_PROPERTY(QString mouthState READ mouthState WRITE setMouthState NOTIFY mouthStateChanged)
    Q_PROPERTY(bool lowAlertActive READ lowAlertActive NOTIFY lowAlertActiveChanged)
    Q_PROPERTY(bool highAlertActive READ highAlertActive NOTIFY highAlertActiveChanged)

public:
    explicit Monitor(QObject *parent = nullptr);

    int drowsyLevel() const;
    void setDrowsyLevel(int newDrowsyLevel);

    QString leftEye() const;
    void setLeftEye(const QString &newLeftEye);

    QString rightEye() const;
    void setRightEye(const QString &newRightEye);

    QString mouthState() const;
    void setMouthState(const QString &newMouthState);

    bool lowAlertActive() const;
    bool highAlertActive() const;

public slots:
    void updateFromJson(const QJsonObject &jsonData);
    void closeHighAlert();

signals:
    void drowsyLevelChanged();
    void leftEyeChanged();
    void rightEyeChanged();
    void mouthStateChanged();
    void lowAlertActiveChanged(bool active);
    void highAlertActiveChanged(bool active);
    void closeHighAlertRequested();

private slots:
    void deactivateLowAlert();
    void deactivateHighAlert();

private:
    int m_drowsyLevel;
    QString m_leftEye;
    QString m_rightEye;
    QString m_mouthState;

    int m_consecutiveLowAlertCount;
    int m_consecutiveHighAlertCount;

    bool m_lowAlertActive;
    bool m_highAlertActive;
    QTimer m_lowAlertTimer;
    // QTimer m_highAlertTimer; // No need for a timer for high alert, since it should stay until explicitly closed
};

#endif // MONITOR_H


