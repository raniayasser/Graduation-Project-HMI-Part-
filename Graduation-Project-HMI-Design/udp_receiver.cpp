#include "udp_receiver.h"
#include <QImageReader>
#include <QImageWriter>
#include <QTemporaryFile>
#include <QDataStream>

UdpReceiver::UdpReceiver(QObject *parent)
    : QObject(parent), udpSocket(new QUdpSocket(this)), expectedFrameSize(0), numFragmentsReceived(0)
{
    connect(udpSocket, &QUdpSocket::readyRead, this, &UdpReceiver::processPendingDatagrams);
    udpSocket->bind(QHostAddress::LocalHost, 12346); // Port should match the UDP port used in Python
}

UdpReceiver::~UdpReceiver()
{
    udpSocket->close();
}

QString UdpReceiver::imageSource() const
{
    return m_imageSource;
}

void UdpReceiver::processPendingDatagrams()
{
    while (udpSocket->hasPendingDatagrams()) {
        QByteArray datagram;
        datagram.resize(udpSocket->pendingDatagramSize());
        udpSocket->readDatagram(datagram.data(), datagram.size());

        QDataStream stream(&datagram, QIODevice::ReadOnly);
        int frameSize;
        int fragmentIndex;
        stream >> frameSize >> fragmentIndex;

        qDebug() << "Received fragment" << fragmentIndex << "of size" << datagram.size();

        // Remove the header from the datagram
        datagram.remove(0, sizeof(int) * 2);

        if (expectedFrameSize == 0) {
            expectedFrameSize = frameSize;
        }

        // Store the fragment in the buffer
        fragmentBuffer[fragmentIndex] = datagram;
        numFragmentsReceived++;

        // Check if all fragments have been received
        if (numFragmentsReceived == (expectedFrameSize / fragmentBuffer.begin()->size()) + 1) {
            buffer.clear();
            for (int i = 0; i < fragmentBuffer.size(); ++i) {
                buffer.append(fragmentBuffer[i]);
            }

            // Clear the fragment buffer
            fragmentBuffer.clear();
            expectedFrameSize = 0;
            numFragmentsReceived = 0;

            // Convert buffer to image
            QImage image;
            QBuffer bufferDevice(&buffer);
            bufferDevice.open(QIODevice::ReadOnly);
            image.load(&bufferDevice, "JPG");

            // Save image to a temporary file
            QTemporaryFile tempFile;
            if (!tempFile.open()) {
                qWarning() << "Failed to open temporary file";
                return;
            }
            image.save(&tempFile, "PNG");
            tempFile.close();

            // Correct the file path formatting
            QString tempFilePath = "file:///" + tempFile.fileName().replace("\\", "/");
            qDebug() << "Image saved to:" << tempFilePath; // Debugging line
            m_imageSource = tempFilePath;
            emit imageSourceChanged();
        }
    }
}
