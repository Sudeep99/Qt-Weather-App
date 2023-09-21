#ifndef FETCHWEATHER_H
#define FETCHWEATHER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>

class FetchWeather : public QObject
{
    Q_OBJECT

public:
    FetchWeather(QObject *parent = nullptr);
public slots:
    void fetchWeather(double lat, double lon, QString units);
    void onNetworkReply(QNetworkReply *reply);
};

#endif // FETCHWEATHER_H
