

// #include "Monitor.h"
// #include <QDebug>

// Monitor::Monitor(QObject *parent)
//     : QObject(parent),
//     m_drowsyLevel(0),
//     m_consecutiveLowAlertCount(0),
//     m_consecutiveHighAlertCount(0),
//     m_lowAlertActive(false),
//     m_highAlertActive(false)
// {
//     m_lowAlertTimer.setInterval(5000);
//     m_lowAlertTimer.setSingleShot(true);
//     connect(&m_lowAlertTimer, &QTimer::timeout, this, &Monitor::deactivateLowAlert);
// }

// int Monitor::drowsyLevel() const
// {
//     return m_drowsyLevel;
// }

// void Monitor::setDrowsyLevel(int newDrowsyLevel)
// {
//     if (m_drowsyLevel != newDrowsyLevel) {
//         m_drowsyLevel = newDrowsyLevel;
//         emit drowsyLevelChanged();
//     }
// }

// QString Monitor::leftEye() const
// {
//     return m_leftEye;
// }

// void Monitor::setLeftEye(const QString &newLeftEye)
// {
//     if (m_leftEye != newLeftEye) {
//         m_leftEye = newLeftEye;
//         emit leftEyeChanged();
//     }
// }

// QString Monitor::rightEye() const
// {
//     return m_rightEye;
// }

// void Monitor::setRightEye(const QString &newRightEye)
// {
//     if (m_rightEye != newRightEye) {
//         m_rightEye = newRightEye;
//         emit rightEyeChanged();
//     }
// }

// QString Monitor::mouthState() const
// {
//     return m_mouthState;
// }

// void Monitor::setMouthState(const QString &newMouthState)
// {
//     if (m_mouthState != newMouthState) {
//         m_mouthState = newMouthState;
//         emit mouthStateChanged();
//     }
// }

// bool Monitor::lowAlertActive() const
// {
//     return m_lowAlertActive;
// }

// bool Monitor::highAlertActive() const
// {
//     return m_highAlertActive;
// }

// void Monitor::updateFromJson(const QJsonObject &jsonData)
// {
//     int leftEyePrediction = jsonData["left_eye_prediction"].toInt();
//     int rightEyePrediction = jsonData["right_eye_prediction"].toInt();
//     int mouthDetection = jsonData["mouth_detection"].toInt();
//     int score = jsonData["score"].toInt();

//     setLeftEye(leftEyePrediction == 0 ? "open" : "closed");
//     setRightEye(rightEyePrediction == 0 ? "open" : "closed");
//     setMouthState(mouthDetection == 1 ? "open" : "closed");
//     setDrowsyLevel(score);

//     qDebug() << "Updated Monitor with new data";

//     bool eyesClosed = (leftEyePrediction == 1 && rightEyePrediction == 1);
//     bool mouthOpen = (mouthDetection == 1);

//     if (eyesClosed || mouthOpen) {
//         m_consecutiveLowAlertCount++;
//     } else {
//         m_consecutiveLowAlertCount = 0;
//     }

//     if (m_consecutiveLowAlertCount >= 10 && !m_lowAlertActive && !m_highAlertActive) {
//         m_lowAlertActive = true;
//         emit lowAlertActiveChanged(true);
//         m_lowAlertTimer.start();
//     }

//     if (m_consecutiveLowAlertCount < 5 && m_lowAlertActive) {
//         m_lowAlertTimer.stop();
//         deactivateLowAlert();
//     }

//     if (eyesClosed) {
//         m_consecutiveHighAlertCount++;
//     } else {
//         m_consecutiveHighAlertCount = 0;
//     }

//     if (m_consecutiveHighAlertCount >= 25 && !m_highAlertActive) {
//         m_highAlertActive = true;
//         emit highAlertActiveChanged(true);
//     }
// }



// void Monitor::deactivateLowAlert()
// {
//     m_lowAlertActive = false;
//     emit lowAlertActiveChanged(false);
//     m_consecutiveLowAlertCount = 0;
// }

// void Monitor::deactivateHighAlert()
// {
//     // Not used in this version; high alert remains active until closed explicitly
// }

// void Monitor::closeHighAlert()
// {
//     if (m_highAlertActive) {
//         m_highAlertActive = false;
//         emit highAlertActiveChanged(false);
//         m_consecutiveHighAlertCount = 0;
//     }
// }


#include "Monitor.h"
#include <QDebug>

Monitor::Monitor(QObject *parent)
    : QObject(parent),
    m_drowsyLevel(0),
    m_consecutiveLowAlertCount(0),
    m_consecutiveHighAlertCount(0),
    m_lowAlertActive(false),
    m_highAlertActive(false)
{
    m_lowAlertTimer.setInterval(5000);
    m_lowAlertTimer.setSingleShot(true);
    connect(&m_lowAlertTimer, &QTimer::timeout, this, &Monitor::deactivateLowAlert);
}

int Monitor::drowsyLevel() const
{
    return m_drowsyLevel;
}

void Monitor::setDrowsyLevel(int newDrowsyLevel)
{
    if (m_drowsyLevel != newDrowsyLevel) {
        m_drowsyLevel = newDrowsyLevel;
        emit drowsyLevelChanged();
    }
}

QString Monitor::leftEye() const
{
    return m_leftEye;
}

void Monitor::setLeftEye(const QString &newLeftEye)
{
    if (m_leftEye != newLeftEye) {
        m_leftEye = newLeftEye;
        emit leftEyeChanged();
    }
}

QString Monitor::rightEye() const
{
    return m_rightEye;
}

void Monitor::setRightEye(const QString &newRightEye)
{
    if (m_rightEye != newRightEye) {
        m_rightEye = newRightEye;
        emit rightEyeChanged();
    }
}

QString Monitor::mouthState() const
{
    return m_mouthState;
}

void Monitor::setMouthState(const QString &newMouthState)
{
    if (m_mouthState != newMouthState) {
        m_mouthState = newMouthState;
        emit mouthStateChanged();
    }
}

bool Monitor::lowAlertActive() const
{
    return m_lowAlertActive;
}

bool Monitor::highAlertActive() const
{
    return m_highAlertActive;
}

void Monitor::updateFromJson(const QJsonObject &jsonData)
{
    int leftEyePrediction = jsonData["left_eye_prediction"].toInt();
    int rightEyePrediction = jsonData["right_eye_prediction"].toInt();
    int mouthDetection = jsonData["mouth_detection"].toInt();
    int score = jsonData["score"].toInt();

    setLeftEye(leftEyePrediction == 0 ? "open" : "closed");
    setRightEye(rightEyePrediction == 0 ? "open" : "closed");
    setMouthState(mouthDetection == 1 ? "open" : "closed");
    setDrowsyLevel(score);

    qDebug() << "Updated Monitor with new data";

    bool eyesClosed = (leftEyePrediction == 1 && rightEyePrediction == 1);
    bool mouthOpen = (mouthDetection == 1);

    if (eyesClosed || mouthOpen) {
        m_consecutiveLowAlertCount++;
    } else {
        m_consecutiveLowAlertCount = 0;
    }

    if (m_consecutiveLowAlertCount >= 10 && !m_lowAlertActive && !m_highAlertActive) {
        m_lowAlertActive = true;
        emit lowAlertActiveChanged(true);
        m_lowAlertTimer.start();
    }

    if (m_consecutiveLowAlertCount < 5 && m_lowAlertActive) {
        m_lowAlertTimer.stop();
        deactivateLowAlert();
    }

    if (eyesClosed) {
        m_consecutiveHighAlertCount++;
    } else {
        m_consecutiveHighAlertCount = 0;
    }

    if (m_consecutiveHighAlertCount >= 20 && !m_highAlertActive) {
        m_highAlertActive = true;
        emit highAlertActiveChanged(true);
    }
}

void Monitor::deactivateLowAlert()
{
    m_lowAlertActive = false;
    emit lowAlertActiveChanged(false);
    m_consecutiveLowAlertCount = 0;
}

void Monitor::deactivateHighAlert()
{
    // Not used in this version; high alert remains active until closed explicitly
}

void Monitor::closeHighAlert()
{
    if (m_highAlertActive) {
        m_highAlertActive = false;
        emit highAlertActiveChanged(false);
        m_consecutiveHighAlertCount = 0;
    }
}
