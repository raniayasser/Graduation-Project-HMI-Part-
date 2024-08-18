// ImageProvider.h

#ifndef IMAGEPROVIDER_H
#define IMAGEPROVIDER_H

#include <QObject>
#include <QStringList>

class ImageProvider : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList imageFilenames READ imageFilenames NOTIFY imageFilenamesChanged)

public:
    explicit ImageProvider(QObject *parent = nullptr);

    QStringList imageFilenames() const;

public slots:
    void loadImagesFromFolder(const QString &folderPath);

signals:
    void imageFilenamesChanged();

private:
    QStringList m_imageFilenames;
};

#endif // IMAGEPROVIDER_H
