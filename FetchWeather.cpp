#include "FetchWeather.h"

FetchWeather::FetchWeather(QObject* parent)
    :QObject(parent)
{

}

void FetchWeather::fetchWeather(double lat, double lon, QString units)
{
    qDebug() << "Received message from QML: " << lat<<","<<lon;
    QNetworkAccessManager *networkManager = new QNetworkAccessManager(this);
    connect(networkManager,&QNetworkAccessManager::finished,this,&FetchWeather::onNetworkReply);
    QUrl url("https://api.openweathermap.org/data/2.5/weather?lat="+QString::number(lat)+"&lon="+QString::number(lon)+"&appid="+"58a720a7b3d55d130d43345e20085fa4"+"&units="+units);
    QNetworkRequest request(url);
    networkManager->get(request);
}

void FetchWeather::onNetworkReply(QNetworkReply *reply)
{
    if(reply->error() == QNetworkReply::NoError){
        QByteArray response = reply->readAll();
        QJsonDocument jsonResponse = QJsonDocument::fromJson(response);
        if(!jsonResponse.isNull()){
            qDebug() << jsonResponse;
        }
        else {
            qDebug() << "Failed to parse JSON data.";
        }
    }
    else {
        qDebug() << "Error: " << reply->errorString();
    }
    reply->deleteLater();
}
